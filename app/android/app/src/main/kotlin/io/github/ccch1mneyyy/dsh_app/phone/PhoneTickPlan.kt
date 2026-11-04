package io.github.ccch1mneyyy.dsh_app.phone

/**
 * How often [PhoneControl]'s status tick runs, apart from Android so it is unit-tested.
 *
 * The tick ends tasks that went idle (a 3 min timeout), lets the accessibility keeper rewrite
 * 自动恢复无障碍, and pushes the status changes nothing else reports. A fixed 2 s schedule did
 * all of that ~43 000 times a day no matter what the phone was doing — with phone control off,
 * which is the default, every one of those ticks found nothing to do. These numbers keep the
 * fast path where a person is waiting for it and drop to a minute otherwise.
 */
object PhoneTickPlan {
    /** A task is running, paused, or in the hold after a stop: end it on time. */
    const val ACTIVE_MS = 2_000L

    /** Switched on but the service is not bound: the keeper may have to write the setting back. */
    const val KEEPER_MS = 2_000L

    /** Switched on, service bound, nothing running. */
    const val IDLE_MS = 15_000L

    /** Switched off: nothing to end, nothing to keep. */
    const val OFF_MS = 60_000L

    /** The delay before the next tick, in milliseconds. */
    fun intervalMs(on: Boolean, taskActive: Boolean, keeperPending: Boolean): Long = when {
        taskActive -> ACTIVE_MS
        keeperPending -> KEEPER_MS
        on -> IDLE_MS
        else -> OFF_MS
    }
}
