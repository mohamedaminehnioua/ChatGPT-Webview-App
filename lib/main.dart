import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter_plus/webview_flutter_plus.dart';

void main() {
  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ],
  );
  // Status bar Color:
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Color(0xff353740),
      systemNavigationBarColor: Color(0xff353740),
    ),
  );
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
      debugShowCheckedModeBanner: false,
      title: 'ChatGPT',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: const HomeWebView(),
    );
  }
}

class HomeWebView extends StatefulWidget {
  const HomeWebView({super.key});

  @override
  State<HomeWebView> createState() => _HomeWebViewState();
}

class _HomeWebViewState extends State<HomeWebView> {
  bool _loading = true;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          _loading
              ? const CircularProgressIndicator(
                  color: Colors.white,
                  strokeWidth: 2.0,
                )
              : const Center(),
          WebViewPlus(
            initialUrl: 'https://chat.openai.com',
            javascriptMode: JavascriptMode.unrestricted,
            userAgent: 'random',
            onPageStarted: (url) {
              setState(() {
                _loading = true;
              });
            },
            onPageFinished: (url) {
              _loading = false;
            },
            backgroundColor: const Color(0xff353740),
          ),
        ],
      ),
    );
  }
}
