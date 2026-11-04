/// The wire contract of mid-turn input: `session/prompt` accepts exactly
/// `queue` and `steer` (`SessionPromptRequest` jsonSchema in the engine's
/// `dsh-api-session-controller`), and `session/updateQueue` takes
/// `edit` / `remove` / `steer`.
///
/// App-level tests fake the chat controller, so a simplification that sent
/// every prompt as `queue` would still pass them and silently turn steering
/// into queueing. These assertions pin the two modes to the request the
/// engine reads.
library;

import 'package:dsh_client/dsh_client.dart';
import 'package:test/test.dart';

import 'support/fake_dsh.dart';

void main() {
  late FakeDsh host;

  setUp(() async => host = await FakeDsh.start());
  tearDown(() async => host.close());

  Future<DshClient> connect() => DshClient.connect(baseUri: host.baseUri, token: FakeDsh.token, startMux: false);

  Map<String, Object?> argsOf(int index) =>
      (((host.rpcCalls[index]['payload']! as Map)['args']) as Map).cast<String, Object?>();

  /// The `request` object of the call at [index] (the engine's wire parameter).
  Map<String, Object?> requestOf(int index) => (argsOf(index)['request']! as Map).cast<String, Object?>();

  test('prompt defaults to queue and carries the text and its request id', () async {
    host.handlers['session/prompt'] = (_) => {
      'ok': true,
      'value': {'accepted': true},
    };
    final client = await connect();
    addTearDown(client.close);

    final requestId = await client.prompt('s1', 'hello');

    final request = requestOf(0);
    expect(request['sessionId'], 's1');
    expect(request['mode'], 'queue');
    expect(request['requestId'], requestId);
    expect(request['content'], [
      {'type': 'text', 'text': 'hello'},
    ]);
  });

  test('steer mode reaches the engine as mode: steer', () async {
    host.handlers['session/prompt'] = (_) => {
      'ok': true,
      'value': {'accepted': true},
    };
    final client = await connect();
    addTearDown(client.close);

    await client.prompt('s1', 'use pnpm, not npm', mode: PromptMode.steer);

    expect(requestOf(0)['mode'], 'steer');
  });

  test('a caller-supplied request id is sent as it is', () async {
    host.handlers['session/prompt'] = (_) => {
      'ok': true,
      'value': {'accepted': true},
    };
    final client = await connect();
    addTearDown(client.close);

    expect(await client.prompt('s1', 'again', requestId: 'fixed-id', mode: PromptMode.steer), 'fixed-id');
    expect(requestOf(0)['requestId'], 'fixed-id');
  });

  test('updateQueue sends edit, remove and steer actions', () async {
    host.handlers['session/updateQueue'] = (_) => {
      'ok': true,
      'value': {'accepted': true},
    };
    final client = await connect();
    addTearDown(client.close);

    await client.updateQueue('s1', 'item-1', editText: 'edited');
    await client.updateQueue('s1', 'item-1', remove: true);
    await client.updateQueue('s1', 'item-1', steer: true);

    final requests = [for (var i = 0; i < 3; i++) requestOf(i)];
    expect(requests.map((request) => (request['action']! as Map)['kind']), ['edit', 'remove', 'steer']);
    expect((requests.first['action']! as Map)['content'], [
      {'type': 'text', 'text': 'edited'},
    ]);
    expect(requests.last['itemId'], 'item-1');
    expect(requests.last['sessionId'], 's1');
  });
}
