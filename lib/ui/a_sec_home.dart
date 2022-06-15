// ignore_for_file: prefer_final_fields

import 'dart:async';

import 'package:flutter/material.dart';

class AHome extends StatelessWidget {
  AHome({Key? key}) : super(key: key);
  ScrollController _scroll = ScrollController();
  List images = [
    "https://images.unsplash.com/photo-1542995470-870e12e7e14f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxleHBsb3JlLWZlZWR8Mnx8fGVufDB8fHx8&auto=format&fit=crop&w=400&q=60",
    "https://images.unsplash.com/photo-1542332213-31f87348057f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxleHBsb3JlLWZlZWR8MXx8fGVufDB8fHx8&auto=format&fit=crop&w=400&q=60",
    "https://images.unsplash.com/photo-1542553458-79a13aebfda6?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxleHBsb3JlLWZlZWR8N3x8fGVufDB8fHx8&auto=format&fit=crop&w=400&q=60",
    "https://images.unsplash.com/photo-1543252358-f20f9c57bafe?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxleHBsb3JlLWZlZWR8M3x8fGVufDB8fHx8&auto=format&fit=crop&w=400&q=60"
  ];

  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 1), () {
      _scroll.jumpTo(_scroll.position.maxScrollExtent);
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text("List View"),
        centerTitle: true,
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          controller: _scroll,
          child: Column(
            children: [
              const Text("Images"),
              ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  // scrollDirection: Axis.horizontal,
                  itemCount: images.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 200,
                        width: 200,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(images[index]))),
                        child: Text("$index"),
                      ),
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
