package io.github.ccch1mneyyy.dsh_app.update

/**
 * Which way handing an APK to Android's package installer goes.
 *
 * Pure: no Android types, so a JVM unit test drives every branch (ApkInstallDecisionTest).
 * The plugin side ([ApkInstaller.startInstall]) only carries the answer out.
 */
object ApkInstallDecision {

    enum class Status { STARTED, PERMISSION_REQUIRED, FAILED }

    /** [reason] is set only for [Status.FAILED]; it is for logs, not for people. */
    data class Decision(val status: Status, val reason: String? = null)

    /** The downloaded package is gone: the cache was cleared under us. */
    const val NO_FILE = "no_file"

    /** Nothing on this device opens `application/vnd.android.package-archive`. */
    const val NO_HANDLER = "no_handler"

    const val ERROR = "error"

    /**
     * "Install unknown apps" is checked before the package: with the switch off the
     * system would only show its own blocked dialog, and the app's own row can offer
     * the right settings page instead.
     */
    fun decide(canInstall: Boolean, filePresent: Boolean): Decision = when {
        !filePresent -> Decision(Status.FAILED, NO_FILE)
        !canInstall -> Decision(Status.PERMISSION_REQUIRED)
        else -> Decision(Status.STARTED)
    }
}
