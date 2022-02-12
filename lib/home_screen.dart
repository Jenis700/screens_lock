import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';
import 'package:lock_app/Finger%20And%20Face/finger_and_facelock.dart';
import 'package:lock_app/Pin%20Lock/pin_lock.dart';
import 'package:lock_app/password%20Lock/password_screen.dart';
import 'package:lock_app/pettern/home_pettern.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final localAuth = LocalAuthentication();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green.shade900,
        title: const Text('Screen Lock'),
        centerTitle: true,
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //! Pin
            PinLock(),
            SizedBox(height: 10),
            //! face & finger lock
            FaceAndFingerLock(localAuth: localAuth),
            SizedBox(height: 10),
            //!pettern lock
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PetternHome(),
                  ),
                );
              },
              child: Text(
                "Pettern Lock",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(Colors.green.shade900),
                elevation: MaterialStateProperty.all(3.5),
              ),
            ),

            //!password lock
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PasswordScreen(),
                  ),
                );
              },
              child: Text(
                "Password Lock",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(Colors.green.shade900),
                elevation: MaterialStateProperty.all(3.5),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class NextPage extends StatelessWidget {
  const NextPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Next Page'),
      ),
      body: Center(
        child: Text(
          "Welcome to your screen",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.amber.shade900,
            shadows: [
              Shadow(
                color: Colors.black,
                blurRadius: 5,
                offset: Offset(1, 1),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
