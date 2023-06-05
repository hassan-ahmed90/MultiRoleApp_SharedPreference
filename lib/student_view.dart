
import 'package:flutter/material.dart';
import 'package:shared_multi_role/login.dart';
import 'package:shared_preferences/shared_preferences.dart';
class Student extends StatefulWidget {
  const Student({Key? key}) : super(key: key);

  @override
  State<Student> createState() => _StudentState();
}

class _StudentState extends State<Student> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }
  String email ="";
  String age="";
  String userType="";
  void loadData()async{
    SharedPreferences sp = await SharedPreferences.getInstance();
    email = sp.getString('email')??"";
    age =sp.getString('Age')??"";
    userType=sp.getString('userType')??"";
    setState(() {
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Student"),
      ),
      body:Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Email"),
                Text(email.toString()),
              ],
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Age"),
                Text(email.toString()),
              ],
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("User Type"),
                Text(userType.toString()),
              ],
            ),
            SizedBox(height: 40,),

            InkWell(
              onTap: ()async{

                SharedPreferences sp = await SharedPreferences.getInstance();
                sp.clear();
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Login()));

              },
              child: Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.blueGrey,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(child: Text("Logout",style: TextStyle(fontSize: 25),),),
              ),
            )



          ],
        ),
      ) ,
    );
  }
}
