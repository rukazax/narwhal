// One sentence for each way a host QR code can be refused (lib/remote/qr),
// shared by the scanner's error card and the paste dialog.

import '../../l10n/l10n.dart';
import '../../remote/qr/host_qr.dart';

String hostQrErrorText(L10n l10n, HostQrError reason) => switch (reason) {
  HostQrError.empty => l10n.remoteQrErrEmpty,
  HostQrError.tooLong => l10n.remoteQrErrTooLong,
  HostQrError.notHostQr => l10n.remoteQrErrOtherApp,
  HostQrError.unsupportedVersion => l10n.remoteQrErrVersion,
  HostQrError.unsupportedTransport => l10n.remoteQrErrTransport,
  HostQrError.missingAddress => l10n.remoteQrErrNoAddress,
  HostQrError.invalidAddress => l10n.remoteQrErrInvalidAddress,
  HostQrError.missingUser => l10n.remoteQrErrNoUser,
  HostQrError.invalidPort => l10n.remoteQrErrPort,
};
