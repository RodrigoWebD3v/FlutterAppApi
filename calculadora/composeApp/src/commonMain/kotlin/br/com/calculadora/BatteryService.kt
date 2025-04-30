package br.com.calculadora

expect class BatteryService {
    suspend fun getBatteryLevel(): Int
}