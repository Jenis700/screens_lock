import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lock_app/home_screen.dart';
import 'package:lock_app/password%20Lock/model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CheckPassword extends StatefulWidget {
  CheckPassword({
    Key? key,
  }) : super(key: key);

  @override
  State<CheckPassword> createState() => _CheckPasswordState();
}

class _CheckPasswordState extends State<CheckPassword> {
  GlobalKey<FormState> _checkPass = GlobalKey();

  TextEditingController _checkTextController = TextEditingController();

  late SharedPreferences user_data;

  String? pass;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  void getData() async {
    user_data = await SharedPreferences.getInstance();

    setState(() {
      pass = user_data.getString("password");
    });
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("AlertDialog"),
              content: TextFormField(
                key: _checkPass,
                keyboardType: TextInputType.visiblePassword,
                controller: _checkTextController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.only(top: 10, left: 5),
                  hintText: 'Enter your password',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Enter your password";
                  }
                },
              ),
              actions: [
                TextButton(
                  child: Text("Cancel"),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                TextButton(
                  child: Text("Continue"),
                  onPressed: () async {
                    String data = await getLodin();
                    print("Data ${data}");
                    if (_checkTextController.text.trim() == data) {
                      performLogin();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NextPage(),
                        ),
                      );
                    } else {
                      Fluttertoast.showToast(
                        msg: "password is wrong!",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.red,
                        textColor: Colors.red,
                        fontSize: 16.0,
                      );
                    }
                  },
                ),
              ],
            );
          },
        );
      },
      child: Text("Check Password"),
    );
  }

  void performLogin() {
    if (pass != _checkTextController.text) {
      print("Wrong data");
    } else {
      print("success data");
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => NextPage(),
        ),
      );
    }
  }
}
