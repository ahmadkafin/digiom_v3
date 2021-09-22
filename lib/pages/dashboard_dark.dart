import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'dashboard_light.dart';

class DashboardDark extends StatefulWidget {
  const DashboardDark({Key? key}) : super(key: key);
  @override
  State<DashboardDark> createState() => _DashboardDarkState();
}

class _DashboardDarkState extends State<DashboardDark> {
  bool isSwitched = false;
  late WebViewController _webViewController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(
          margin: const EdgeInsets.only(left: 5),
          decoration: const BoxDecoration(
              image: DecorationImage(
            image: AssetImage("images/digiom_logo_2.png"),
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
                Navigator.of(context).pushReplacement(_dashboardLight());
              });
            },
            activeColor: Colors.white,
            activeTrackColor: Colors.black87,
          )
        ],
        centerTitle: true,
        backgroundColor: Colors.black26,
      ),
      body: WebView(
        initialUrl: '',
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (WebViewController webViewController) {
          _webViewController = webViewController;
          _loadDashboardDark();
        },
      ),
    );
  }

  _loadDashboardDark() async {
    const String urlTwo = "https://gis.pgn.co.id/digiom/index2.html";
    _webViewController.loadUrl(urlTwo);
  }
}

Route _dashboardLight() {
  return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          const DashboardLight(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return child;
      });
}
