import 'package:flutter/material.dart';
import 'package:shared_multi_role/home.dart';
import 'package:shared_preferences/shared_preferences.dart';
class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final ageController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                hintText: "Email",
                border: OutlineInputBorder(
                ),
              ),
            ),
            SizedBox(height: 40,),
            TextFormField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                hintText: "Passwrod",
                border: OutlineInputBorder(
                ),
              ),
            ),
            SizedBox(height: 40,),
            TextFormField(
              controller: ageController,
              keyboardType: TextInputType.number,
             
              decoration: InputDecoration(
                hintText: "Age",
                border: OutlineInputBorder(
                ),
              ),
            )
            ,SizedBox(height: 40,),
            InkWell(
              onTap: ()async{

                SharedPreferences sp = await SharedPreferences.getInstance();
                sp.setString("email", emailController.text.toString());
                sp.setString("Age", ageController.text.toString());
                sp.setBool("isLogin", true);
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Home()));

              },
              child: Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.blueGrey,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(child: Text("Login",style: TextStyle(fontSize: 25),),),
              ),
            )
          ],
        ),
      ),
    );
  }
}
