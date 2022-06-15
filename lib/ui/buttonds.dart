import 'package:flutter/material.dart';

class Buttons extends StatefulWidget {
  const Buttons({Key? key}) : super(key: key);

  @override
  State<Buttons> createState() => _ButtonsState();
}

class _ButtonsState extends State<Buttons> {
  String button = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Buttons"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            verticalSpace(40),
            Text("Button Pressed : $button"),
            verticalSpace(40),
            ElevatedButton.icon(
              onPressed: () {
                setState(() {
                  button = "Elevated";
                });
              },
              icon: const Icon(Icons.add),
              label: const Text("Add"),
            ),
            verticalSpace(30),
            IconButton(
                onPressed: () {
                  setState(() {
                    button = "Icon";
                  });
                },
                icon: const Icon(Icons.remove)),
            verticalSpace(30),
            OutlinedButton(
                onLongPress: () {
                  print("Long Press");
                },
                onHover: (v) {
                  print(v);
                },
                onPressed: () {
                  setState(() {
                    button = "Outline";
                  });
                },
                child: const Text("Outline")),
            verticalSpace(30),
            customButton(
                text: const Text("Remove"),
                icon: const Icon(Icons.remove),
                onpress: () {
                  print("Custom Button");
                }),

            // customButton(text: text, icon: icon, onpress: onpress)
          ],
        ),
      ),
    );
  }

  GestureDetector customButton(
      {required Widget text,
      required Icon icon,
      required VoidCallback onpress}) {
    return GestureDetector(
      onTap: onpress,
      child: Container(
        height: 60,
        width: 150,
        alignment: Alignment.center,
        decoration: const BoxDecoration(
            color: Colors.blueAccent,
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.elliptical(80, 30),
                bottomRight: Radius.elliptical(80, 30))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon,
            const SizedBox(
              width: 10,
            ),
            text
          ],
        ),
      ),
    );
  }

  SizedBox verticalSpace(double n) {
    return SizedBox(
      height: n,
    );
  }
}
