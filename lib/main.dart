import 'package:flutter/material.dart';
import 'package:universal_platform/universal_platform.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const PlatformHomePage(),
    );
  }
}

class PlatformHomePage extends StatelessWidget {
  const PlatformHomePage({super.key});

  Widget materialWidget(BuildContext context, String message) {
    return Scaffold(
      appBar: AppBar(title: const Text('Material UI')),
      body: Center(child: Text(message)),
    );
  }

  Widget cupertinoWidget(BuildContext context, String message) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cupertino UI')),
      body: Center(child: Text(message)),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (UniversalPlatform.isAndroid) {
      debugPrint("Running on Android");
      return materialWidget(context, 'Hi Android with Material!');
    } else if (UniversalPlatform.isIOS) {
      debugPrint("Running on iOS");
      return cupertinoWidget(context, 'Hi iOS with Cupertino!');
    } else if (UniversalPlatform.isWeb) {
      debugPrint("Running on Web");
      return materialWidget(context, 'Hi Web!');
    } else {
      return Scaffold(
        body: Center(
          child: Text('Unsupported platform'),
        ),
      );
    }
  }
}
