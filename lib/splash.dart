import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_multi_role/home.dart';

import 'package:shared_multi_role/sing_up.dart';
import 'package:shared_multi_role/student_view.dart';
import 'package:shared_multi_role/teacher_view.dart';
import 'package:shared_preferences/shared_preferences.dart';
class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isLogin();
  }
  void isLogin()async{
    SharedPreferences sp = await SharedPreferences.getInstance();
    bool islogin= sp.getBool("isLogin")??false;
    String userType = sp.getString('userType')??"";
    if(islogin){
      if(userType=="student"){
        Timer(Duration(seconds: 5), () {
          Navigator.push(context, MaterialPageRoute(builder:(context)=>Student()));
        });
      }else if (userType=='teacher'){
        Timer(Duration(seconds: 5), () {
          Navigator.push(context, MaterialPageRoute(builder:(context)=>Teache()));
        });
      }else if(userType=='user'){
        Timer(Duration(seconds: 5), () {
          Navigator.push(context
              , MaterialPageRoute(builder:(context)=>Home()));
        });
      }else{
        Timer(Duration(seconds: 5), () {
          Navigator.push(context, MaterialPageRoute(builder:(context)=>SignUp()));
        });
      }
    }
    else{
      Timer(Duration(seconds: 5), () {
        Navigator.push(context, MaterialPageRoute(builder:(context)=>SignUp()));
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Image(
           height: double.infinity,
          fit: BoxFit.fitHeight,
          image: NetworkImage('https://images.pexels.com/photos/17023691/pexels-photo-17023691/free-photo-of-light-city-art-street.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1')),
    );
  }
}
