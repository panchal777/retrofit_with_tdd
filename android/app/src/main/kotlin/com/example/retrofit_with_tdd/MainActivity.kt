package com.example.retrofit_with_tdd

import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterFragmentActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel


class MainActivity : FlutterFragmentActivity() {

    private val EVENTS = "com.demo.methodchannel"
    var methodChannelResult: MethodChannel.Result? = null

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            EVENTS
        ).setMethodCallHandler { call, result ->
            methodChannelResult = result;
            if (call.method == "messageFunction") {
                result.success("Message From Android")
            }
        }
    }
}
