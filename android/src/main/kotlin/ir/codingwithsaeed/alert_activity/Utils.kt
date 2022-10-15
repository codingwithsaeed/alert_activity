package ir.codingwithsaeed.alert_activity

import android.app.Activity
import android.app.ActivityManager
import android.app.ActivityManager.RunningAppProcessInfo
import android.content.Context
import android.content.Intent
import android.net.Uri
import android.os.Build
import android.os.PowerManager
import android.provider.Settings
import android.view.WindowManager

/**
 * Utilities that can be used while the foreground service is running.
 *
 * @author Dev-hwang
 * @version 1.0
 */
class Utils {
    companion object {
        private fun wakeUpScreen(context: Context) {
            val powerManager = context.getSystemService(Context.POWER_SERVICE) as PowerManager
            val serviceFlag = PowerManager.SCREEN_BRIGHT_WAKE_LOCK.or(PowerManager.ACQUIRE_CAUSES_WAKEUP).or(PowerManager.ON_AFTER_RELEASE)

            val newWakeLock = powerManager.newWakeLock(serviceFlag, "ForegroundServiceUtils:WakeLock")
            newWakeLock.acquire(1000)
            newWakeLock.release()
        }

        fun openAlertActivity(context: Context, time: String, title: String, desc: String) {
            wakeUpScreen(context)
            val intent = Intent(context, AlertActivity::class.java)
            intent.putExtra("time", time)
            intent.putExtra("title", title)
            intent.putExtra("description", desc)
            intent.flags = Intent.FLAG_ACTIVITY_NEW_TASK
            intent.addFlags(Intent.FLAG_ACTIVITY_CLEAR_TASK)
            intent.addFlags(Intent.FLAG_ACTIVITY_CLEAR_TOP)
            context.startActivity(intent)
        }
    }
}
