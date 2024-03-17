import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final userController = TextEditingController();
  final passController = TextEditingController();
  final showController = TextEditingController();

  MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        //============================
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: const Text('Login Page'),
        ),
        backgroundColor: Colors.grey,
        body: Column(
          children: [
            //============================
            Container(
              margin: const EdgeInsets.all(10.0),
              padding: const EdgeInsets.all(10.0),
              color: Colors.redAccent,
              //============================
              child: TextField(
                controller: userController,
                keyboardType: TextInputType.name,
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Color.fromARGB(255, 255, 255, 255),
                  hintText: 'Username',
                  hintStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    // backgroundColor: Colors.white,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30.0)),
                  ),
                ),
              ),
              //============================
            ),
            Container(
              margin: const EdgeInsets.all(10.0),
              padding: const EdgeInsets.all(10.0),
              color: Colors.redAccent,
              //============================
              child: TextFormField(
                controller: passController,
                decoration:  const InputDecoration(
                  labelText: 'Enter your password',
                  labelStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),                    filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30.0),),
                  ),
                ),
              ),
            ),
            //============================
            Container(
              margin: const EdgeInsets.all(10.0),
              padding: const EdgeInsets.all(15),
              color: Colors.brown,
              // alignment: Alignment.center,
              //============================
              child:Center(
                child: Row(
                  children: [
                    Expanded(
                      child: FloatingActionButton(
                        onPressed: () {
                          showController.text = userController.text.toString();
                          showController.text +="  ---   ";
                          showController.text += passController.text.toString();
                        },
                        backgroundColor: const Color.fromARGB(200, 000, 000, 200),
                        child: const Text("Login", style: TextStyle(fontSize: 20, color: Colors.white),),
                      ),
                    ),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          showController.text = '';
                          userController.text= '';
                          passController.text= '';
                        },
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
                        child: const Text("Clear", style: TextStyle(fontSize: 20, color: Colors.white),),
                      ),
                    ),
                    Expanded(
                      child: CloseButton(
                        color: Colors.white,
                        onPressed: () {
                          if (Platform.isAndroid) {
                            SystemNavigator.pop();
                            SystemChannels.platform.invokeMethod('SystemNavigator.pop');
                            exit(0);
                          } else if (Platform.isIOS) {
                            exit(0);
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(10.0),
              color: Colors.white12,
              height: 200, width: 400,
              //============================
              child: TextField(
                controller: showController,
                keyboardType: TextInputType.name,
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Color.fromARGB(255, 255, 255, 255),
                  hintText: 'Show',
                  hintStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    backgroundColor: Colors.white,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
