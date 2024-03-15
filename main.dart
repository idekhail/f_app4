import 'package:flutter/cupertino.dart';
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
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        //============================
        appBar: AppBar(
                  backgroundColor: Colors.green,
                  title: Text('Login Page'),
        ),
        backgroundColor: Colors.grey,
        body: Column(
          children: [
            //============================
            Container(
              margin: EdgeInsets.all(10.0),
              //color: Colors.white12,
              //============================
              child: TextField(
                controller: userController,
                keyboardType: TextInputType.name,
                decoration: const InputDecoration(
                  filled: true,
                  //fillColor: Color(0xffF02E65),
                  fillColor: Color.fromARGB(255, 255, 255, 255),
                 // fillColor: Colors.deepPurpleAccent,
                  hintText: 'Username',
                  hintStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                   // backgroundColor: Colors.white,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  ),
                ),
              ),
              //============================
            ),
            Container(
              margin: EdgeInsets.all(10.0),
              color: Colors.white12,
              //============================
              child: TextField(
                controller: passController,
                keyboardType: TextInputType.name,
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Color.fromARGB(255, 255, 255, 255),
                  hintText: 'Password',
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
            //============================
            Container(
              margin: EdgeInsets.all(10.0),
              height: 100, width: 400,
              color: Colors.brown,
              alignment: Alignment.center,
              //============================
              child: Row(
                children: [
                  Expanded(
                    child: FloatingActionButton(
                      onPressed: () {
                        showController.text = userController.text.toString();
                        showController.text +="  ---   ";
                        showController.text += passController.text.toString();
                      },
                      child: Text("Login", style: TextStyle(fontSize: 20, color: Colors.white),),
                      backgroundColor: Color.fromARGB(200, 000, 000, 200),
                    ),
                  ),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        showController.text = '';
                        userController.text= '';
                        passController.text= '';
                      },
                      child: Text("Clear", style: TextStyle(fontSize: 20, color: Colors.white),),
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
                    ),
                  ),
                  Expanded(
                    child: CloseButton(
                      color: Colors.white,
                      onPressed: () {
                        if (Platform.isAndroid) {
                          SystemNavigator.pop();
                          SystemChannels.platform.invokeMethod('SystemNavigator.pop');
                        } else if (Platform.isIOS) {
                          exit(0);
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(10.0),
              color: Colors.white12,
              //============================
              child: TextField(
                controller: showController,
               // keyboardType: TextInputType.name,
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
