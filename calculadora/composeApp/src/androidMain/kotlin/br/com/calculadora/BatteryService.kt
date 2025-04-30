package br.com.calculadora

import android.content.Context
import android.os.BatteryManager

actual class BatteryService(private val context: Context) {

    actual suspend fun getBatteryLevel(): Int {
        val batteryManager = context.getSystemService(Context.BATTERY_SERVICE) as BatteryManager
        return batteryManager.getIntProperty(BatteryManager.BATTERY_PROPERTY_CAPACITY)
    }
}