import 'package:flutter/services.dart';

//=========Handle Deep Linking=========//

class NativeChannelPlugin {
  static const MethodChannel _channel = MethodChannel('com.demo.methodchannel');

  static Future<String> get callNativeCode async {
    try {
      var data = await _channel.invokeMethod('messageFunction');
      return data;
    } on PlatformException catch (e) {
      return "Failed to Invoke: '${e.message}'.";
    }
  }
}
