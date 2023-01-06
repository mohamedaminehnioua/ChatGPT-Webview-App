import 'package:flutter/material.dart';
import 'package:webview_flutter_plus/webview_flutter_plus.dart';

void main() {
  runApp(
    const App(),
  );
}

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ChatGPT',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: const HomeWebView(),
    );
  }
}

class HomeWebView extends StatelessWidget {
  const HomeWebView({super.key});

  @override
  Widget build(BuildContext context) {
    return const WebViewPlus(
      initialUrl: 'https://www.chat.openai.com',
      javascriptMode: JavascriptMode.unrestricted,
    );
  }
}
