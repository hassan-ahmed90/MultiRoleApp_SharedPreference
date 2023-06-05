
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
class AuthProvider with ChangeNotifier{

  bool _loading = false;
  bool get loading=>_loading;

  setValue(bool val){
    _loading=val;
    notifyListeners();
  }

  void login(String email, String password)async{

    setValue(true);

    try{

      Response response = await post(Uri.parse('https://reqres.in/api/login'),
      body: {
        'email' : email,
        'password' : password,

          }
      );
      if(response.statusCode==200){
        setValue(false);
        print("Pass");
      }else{
        setValue(false);
        print('Failed');
      }


    }catch(e){
      setValue(false);
      print(e.toString());
    }
  }
}