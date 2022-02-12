import 'package:flutter/material.dart';
import 'package:flutter_screen_lock/flutter_screen_lock.dart';
import 'package:local_auth/local_auth.dart';
import 'package:lock_app/home_screen.dart';

class FaceAndFingerLock extends StatelessWidget {
  const FaceAndFingerLock({
    Key? key,
    required this.localAuth,
  }) : super(key: key);

  final LocalAuthentication localAuth;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        screenLock(
          context: context,
          correctString: "1234",
          digits: 4,
          inputButtonConfig: InputButtonConfig(
            displayStrings: ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"],
          ),

          //! for finger frint and figerprint icon
          customizedButtonChild: const Icon(
            Icons.fingerprint,
            size: 35,
            color: Colors.greenAccent,
          ),
          customizedButtonTap: () async {
            final didAuthenticate = await localAuth.authenticate(
              localizedReason: 'Please authenticate',
              biometricOnly: true,
            );
            if (didAuthenticate) {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const NextPage()));
            }
          },
        );
      },
      child: Text(
        "Finger & Face Lock",
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.green.shade900),
        elevation: MaterialStateProperty.all(3.5),
      ),
    );
  }
}
