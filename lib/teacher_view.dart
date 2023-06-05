
import 'package:flutter/material.dart';
import 'package:shared_multi_role/sing_up.dart';
import 'package:shared_preferences/shared_preferences.dart';
class Teache extends StatefulWidget {
  const Teache({Key? key}) : super(key: key);

  @override
  State<Teache> createState() => _TeacheState();
}

class _TeacheState extends State<Teache> {
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
        title: Text("Teacher"),
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
                Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUp()));

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
