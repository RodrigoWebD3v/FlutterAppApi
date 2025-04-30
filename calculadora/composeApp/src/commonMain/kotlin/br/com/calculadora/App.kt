package br.com.calculadora

import androidx.compose.animation.AnimatedVisibility
import androidx.compose.foundation.Image
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.material.Button
import androidx.compose.material.MaterialTheme
import androidx.compose.material.Text
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import br.com.calculadora.service.BatteryService
import org.jetbrains.compose.resources.painterResource
import org.jetbrains.compose.ui.tooling.preview.Preview

import calculadora.composeapp.generated.resources.Res
import calculadora.composeapp.generated.resources.compose_multiplatform

@Composable
@Preview
fun App(batteryService: BatteryService) {
    MaterialTheme {
        BatteryScreen(
            batteryService = batteryService
        )
    }
}