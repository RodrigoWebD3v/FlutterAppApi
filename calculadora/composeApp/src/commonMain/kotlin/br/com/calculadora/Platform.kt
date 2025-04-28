package br.com.calculadora

interface Platform {
    val name: String
}

expect fun getPlatform(): Platform