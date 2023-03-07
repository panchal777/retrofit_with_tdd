import 'package:flutter/material.dart';
import 'package:retrofit_with_tdd/features/native_demo/plugins/native_channel.dart';

class MethodChannelDemo extends StatefulWidget {
  const MethodChannelDemo({Key? key}) : super(key: key);

  @override
  State<MethodChannelDemo> createState() => _MethodChannelDemoState();
}

class _MethodChannelDemoState extends State<MethodChannelDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Native Demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Demo Application for method channel',
            ),
            const SizedBox(height: 20),
            TextButton(
              child: const Text('Method Channel click'),
              onPressed: () async {
                var data = await NativeChannelPlugin.callNativeCode;
                debugPrint('data :: $data');
              },
            )
          ],
        ),
      ),
    );
  }
}
