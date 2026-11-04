package io.github.ccch1mneyyy.dsh_app.phone

import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Test

class PhoneTickPlanTest {
    @Test fun aTaskKeepsTheFastTick() {
        assertEquals(PhoneTickPlan.ACTIVE_MS, PhoneTickPlan.intervalMs(on = true, taskActive = true, keeperPending = false))
        // A task outranks the keeper: both want 2 s, but the idle clock must not slow down.
        assertEquals(PhoneTickPlan.ACTIVE_MS, PhoneTickPlan.intervalMs(on = true, taskActive = true, keeperPending = true))
    }

    @Test fun unboundServiceKeepsTheFastTick() {
        assertEquals(PhoneTickPlan.KEEPER_MS, PhoneTickPlan.intervalMs(on = true, taskActive = false, keeperPending = true))
    }

    @Test fun healthyAndIdleDropsToFifteenSeconds() {
        assertEquals(PhoneTickPlan.IDLE_MS, PhoneTickPlan.intervalMs(on = true, taskActive = false, keeperPending = false))
    }

    @Test fun switchedOffDropsToAMinute() {
        assertEquals(PhoneTickPlan.OFF_MS, PhoneTickPlan.intervalMs(on = false, taskActive = false, keeperPending = false))
    }

    @Test fun theIdleTickStillEndsATaskOnTime() {
        // PhoneTasks.idleMs is 3 minutes; a 15 s tick notices inside 15 s of it.
        assertTrue(PhoneTickPlan.IDLE_MS * 12 <= 3 * 60_000L)
        // And the off tick is at least as slow as the healthy one.
        assertTrue(PhoneTickPlan.OFF_MS >= PhoneTickPlan.IDLE_MS)
        assertTrue(PhoneTickPlan.IDLE_MS > PhoneTickPlan.ACTIVE_MS)
    }
}
