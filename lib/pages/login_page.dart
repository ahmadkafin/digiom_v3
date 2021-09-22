import 'package:flutter/material.dart';

import 'dashboard_dark.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isVisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrangeAccent,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.only(left: 80, right: 80, bottom: 20),
            child: Image.asset("images/digiom_white.png"),
          ),
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.only(left: 50, right: 50, bottom: 80),
            child: const Text(
              "Digio for Operation Dashboard",
              style: TextStyle(color: Colors.white),
            ),
          ),
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(10),
            child: const TextField(
              decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white)),
                hintText: "Username",
                hintStyle: TextStyle(color: Colors.white),
                icon: Icon(
                  Icons.person,
                  size: 30,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(10),
            child: TextField(
              decoration: InputDecoration(
                enabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white)),
                hintText: "Password",
                hintStyle: const TextStyle(color: Colors.white),
                icon: const Icon(
                  Icons.lock,
                  size: 30,
                  color: Colors.white,
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                      _isVisible ? Icons.visibility : Icons.visibility_off),
                  onPressed: () {
                    setState(() {
                      _isVisible = !_isVisible;
                    });
                  },
                ),
              ),
              obscureText: _isVisible,
            ),
          ),
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.only(left: 15, right: 15, top: 20),
            child: SizedBox(
              width: double.infinity,
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(_dashboardDark());
                },
                child: const Text("Login"),
                style: TextButton.styleFrom(
                    primary: Colors.deepOrangeAccent,
                    backgroundColor: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
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
