import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'dashboard_dark.dart';

class DashboardLight extends StatefulWidget {
  const DashboardLight({Key? key}) : super(key: key);

  @override
  State<DashboardLight> createState() => _DashboardLightState();
}

class _DashboardLightState extends State<DashboardLight> {
  bool isSwitched = true;
  late WebViewController _webViewController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(
          margin: const EdgeInsets.only(left: 5),
          decoration: const BoxDecoration(
              image: DecorationImage(
            image: AssetImage("images/digiom_logo.png"),
            fit: BoxFit.contain,
          )),
        ),
        title: const Text(
          "Digio for Operation and Maintenance Dashboard",
          style: TextStyle(fontSize: 11),
        ),
        actions: [
          Switch(
            value: isSwitched,
            onChanged: (value) {
              setState(() {
                isSwitched = value;
                Navigator.of(context).pushReplacement(_dashboardDark());
              });
            },
            activeColor: Colors.white,
            activeTrackColor: Colors.black87,
          )
        ],
        centerTitle: true,
        backgroundColor: Colors.black12,
      ),
      body: WebView(
        initialUrl: '',
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (WebViewController webViewController) {
          _webViewController = webViewController;
          _loadDashboardLight();
        },
      ),
    );
  }

    _loadDashboardLight() async {
    const String urlTwo = "https://gis.pgn.co.id/digiom/";
    _webViewController.loadUrl(urlTwo);
  }
}

Route _dashboardDark() {
  return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          const DashboardDark(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return child;
      });
}
