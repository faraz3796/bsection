import 'package:bsection/ui/login.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: LoginScreen(),
  ));
}

class Splash extends StatelessWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/user_4.png"),
            const SizedBox(
              height: 20,
            ),
            const CircularProgressIndicator()
          ],
        ),
      ),
    );
    // return Container(
    //   alignment: Alignment.center,
    //   width: MediaQuery.of(context).size.width,
    //   height: MediaQuery.of(context).size.height,
    //   color: Colors.greenAccent,
    //   child: Column(
    //     mainAxisAlignment: MainAxisAlignment.center,
    //     children: [
    //       const Text("data"),
    //       const SizedBox(
    //         height: 20,
    //       ),
    //       Image.asset("assets/user_4.png")
    //     ],
    //   ),
    // );
  }
}
