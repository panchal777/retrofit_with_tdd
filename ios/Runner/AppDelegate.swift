import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(withRegistry: self)

     let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
                let mlkitChannel = FlutterMethodChannel(name: "com.demo.methodchannel",
                                                          binaryMessenger: controller.binaryMessenger)
            mlkitChannel.setMethodCallHandler({
                  (call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
                if call.method == "messageFunction"{
                result("Message From Ios")
                }
             })
      return super.application(application, didFinishLaunchingWithOptions: launchOptions)

  }
}
