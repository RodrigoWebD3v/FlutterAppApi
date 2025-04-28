import Flutter
import UIKit

@main
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {

    let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
    let batteryChannel = FlutterMethodChannel(name: "com.rodrigo/bateria",
                                              binaryMessenger: controller.binaryMessenger)
    
    batteryChannel.setMethodCallHandler { (call: FlutterMethodCall, result: @escaping FlutterResult) in
      if call.method == "obterNivelBateria" {
        self.receberNivelBateria(result: result)
      } else {
        result(FlutterMethodNotImplemented)
      }
    }

    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }

  private func receberNivelBateria(result: FlutterResult) {
    let device = UIDevice.current
    device.isBatteryMonitoringEnabled = true

    let batteryLevel = device.batteryLevel

    if batteryLevel == -1.0 {
      result(FlutterError(code: "UNAVAILABLE",
                          message: "Nível da bateria não disponível.",
                          details: nil))
    } else {
      let nivel = Int(batteryLevel * 100)
      result(nivel)
    }
  }
}
