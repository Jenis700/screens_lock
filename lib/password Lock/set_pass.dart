import 'package:flutter/material.dart';
import 'package:lock_app/password%20Lock/model.dart';

//! set passwword
class SetPassword extends StatefulWidget {
  SetPassword({
    Key? key,
  }) : super(key: key);

  @override
  State<SetPassword> createState() => _SetPasswordState();
}

class _SetPasswordState extends State<SetPassword> {
  final globalKey = GlobalKey<FormState>();

  TextEditingController _setController = TextEditingController();
  TextEditingController _setConformController = TextEditingController();

  // static SharedPreferences? setData;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    performLodin("");
  }

  // static void cheack() async {
  //   setData = await SharedPreferences.getInstance();
  // }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _setController.dispose();
    _setConformController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Set Password"),
              content: SizedBox(
                height: 180,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 15),
                    SizedBox(
                      width: 200,
                      child: Form(
                        key: globalKey,
                        child: Column(
                          children: [
                            TextFormField(
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              keyboardType: TextInputType.visiblePassword,
                              controller: _setController,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                contentPadding:
                                    EdgeInsets.only(top: 10, left: 5),
                                hintText: 'Set Password',
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Enter some text";
                                }
                              },
                            ),
                            SizedBox(height: 20),
                            TextFormField(
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              keyboardType: TextInputType.visiblePassword,
                              controller: _setConformController,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                contentPadding:
                                    EdgeInsets.only(top: 10, left: 5),
                                hintText: 'Conform password',
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Enter conform password";
                                } else if (value.isNotEmpty &&
                                    value != _setController.text) {
                                  return "Not Match";
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
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
                  onPressed: () {
                    if (globalKey.currentState!.validate()) {
                      print(_setController.text);
                      performLodin(_setController.text);
                      Navigator.pop(context);
                    }
                  },
                ),
              ],
            );
          },
        );
      },
      child: Text("Set Password"),
    );
    //
  }
}
