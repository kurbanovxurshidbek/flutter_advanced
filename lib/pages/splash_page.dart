import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_advanced/pages/home_page.dart';
import 'package:flutter_advanced/pages/signin_page.dart';
import 'package:flutter_advanced/service/auth_service.dart';

import 'main_page.dart';

class SplashPage extends StatefulWidget {
  static final String id = "splash_page";
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override
  void initState() {
    super.initState();
    _initTimer();
  }

  void _initTimer(){
    Timer(const Duration(seconds: 2),(){
      _callNextPage();
    });
  }
  _callNextPage(){
    if(AuthService.isLoggedIn()){
      Navigator.pushReplacementNamed(context, MainPage.id);
    }else{
      Navigator.pushReplacementNamed(context, SignInPage.id);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromRGBO(193, 53, 132, 1),
              Color.fromRGBO(131, 58, 180, 1)
            ]
          )
        ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: Center(
              child: Text("Welcome",style: TextStyle(color: Colors.white,fontSize: 35),),
            ),
          ),
          Text("All rights reserved",style: TextStyle(color: Colors.white, fontSize: 16),),
          SizedBox(height: 20,),
        ],
      ),
      ),
    );
  }
}
