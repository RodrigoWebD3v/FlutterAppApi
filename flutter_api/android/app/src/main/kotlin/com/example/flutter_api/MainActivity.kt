package com.example.flutter_api

import android.content.Context
import android.os.BatteryManager
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity() {
    private val CHANNEL = "com.rodrigo/bateria"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        MethodChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            CHANNEL
        ).setMethodCallHandler { call, result ->
            if (call.method == "obterNivelBateria") {
                val nivel = obterNivelBateria()

                if (nivel != -1) {
                    result.success(nivel)
                } else {
                    result.error("UNAVAILABLE", "Nível da bateria não disponível.", null)
                }
            } else {
                result.notImplemented()
            }
        }
    }

    private fun obterNivelBateria(): Int {
        val batteryManager = getSystemService(Context.BATTERY_SERVICE) as BatteryManager
        return batteryManager.getIntProperty(BatteryManager.BATTERY_PROPERTY_CAPACITY)
    }
}
