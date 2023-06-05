import 'package:flutter/material.dart';
import 'package:shared_multi_role/home.dart';
import 'package:shared_multi_role/student_view.dart';
import 'package:shared_multi_role/teacher_view.dart';
import 'package:shared_preferences/shared_preferences.dart';
class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final ageController = TextEditingController();
  final userTypeController= TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SignUp'),
        centerTitle:  true,
      ),
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
            ),
            SizedBox(height: 40,),
            TextFormField(
              controller: userTypeController,
              decoration: InputDecoration(
                hintText: "User Type",
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
                sp.setString('userType', userTypeController.text.toString());
                sp.setBool("isLogin", true);

                if(userTypeController.text.toString()=='student'){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Student()));
                }else if(userTypeController.text.toString()=='teacher'){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Teache()));
                }else{
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Home()));
                }


              },
              child: Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(child: Text("SignUp",style: TextStyle(fontSize: 25),),),
              ),
            )
          ],
        ),
      ),
    );
  }
}
