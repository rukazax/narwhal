package io.github.ccch1mneyyy.dsh_app.update

import org.junit.Assert.assertEquals
import org.junit.Assert.assertNull
import org.junit.Test

/**
 * The one decision before an APK is handed to Android's package installer
 * (lib/update/apk_installer.dart mirrors these statuses as typed results).
 */
class ApkInstallDecisionTest {

    @Test fun withPermissionAndTheFileItStartsWithTheInstaller() {
        val decision = ApkInstallDecision.decide(canInstall = true, filePresent = true)
        assertEquals(ApkInstallDecision.Status.STARTED, decision.status)
        assertNull(decision.reason)
    }

    @Test fun withoutPermissionTheSettingsPageComesFirst() {
        val decision = ApkInstallDecision.decide(canInstall = false, filePresent = true)
        assertEquals(ApkInstallDecision.Status.PERMISSION_REQUIRED, decision.status)
        assertNull(decision.reason)
    }

    @Test fun aMissingPackageIsAFailureEvenWithoutPermission() {
        // The cache may be cleared between the download and the tap: that is a
        // failure, not a reason to send the person to the settings page.
        for (canInstall in listOf(true, false)) {
            val decision = ApkInstallDecision.decide(canInstall = canInstall, filePresent = false)
            assertEquals(ApkInstallDecision.Status.FAILED, decision.status)
            assertEquals(ApkInstallDecision.NO_FILE, decision.reason)
        }
    }
}
