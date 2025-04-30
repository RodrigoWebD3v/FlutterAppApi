package br.com.calculadora

import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.Spacer
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.height
import androidx.compose.material.Text
import androidx.compose.runtime.Composable
import androidx.compose.runtime.LaunchedEffect
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.runtime.setValue
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.platform.LocalGraphicsContext
import androidx.compose.ui.unit.dp

@Composable
fun BatteryScreen(batteryService: BatteryService) {
    val context = LocalGraphicsContext.current

    var batteryLevel by remember { mutableStateOf<Int?>(null) }

    LaunchedEffect(Unit) {
        batteryLevel = batteryService.getBatteryLevel()
    }

    Column(
        modifier = Modifier.fillMaxSize(),
        verticalArrangement = Arrangement.Center,
        horizontalAlignment = Alignment.CenterHorizontally
    ) {
        Text(text = "Battery Level:")
        Spacer(modifier = Modifier.height(16.dp))
        Text(
            text = batteryLevel?.let { "$it%" } ?: "Loading..."
        )
    }

}