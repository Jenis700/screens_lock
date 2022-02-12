import 'package:flutter/material.dart';
import 'package:flutter_screen_lock/flutter_screen_lock.dart';
import 'package:lock_app/Pin%20Lock/pin_model.dart';
import 'package:lock_app/home_screen.dart';

class PinLock extends StatelessWidget {
  const PinLock({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        // final inputController = InputController();
        var d = await getLoding();
        screenLock<void>(
          context: context,
          correctString: "1234",
          digits: 4,
          didUnlocked: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const NextPage()));
          },

          //! number pad ni nichenu  footer
          // footer: Container(
          //   color: Colors.red,
          //   child: Text("footer"),
          // ),

          //!password clear karva ane cancle karva matenu btn
          //? a btn false hase to right password b\vagar kai nai thay sake
          canCancel: true,

          //! for diferent back ground
          //  screenLockConfig: ScreenLockConfig(
          //   backgroundColor: Colors.black,
          // ),

          //! wrong password try
          //? open dilog to 30 secound
          // maxRetries: 2,
          // retryDelay: Duration(seconds: 3),
          // delayChild: Center(
          //   child: Text(
          //     'Cannot be entered temporarily because it failed the specified number of times.',
          //     softWrap: true,
          //   ),
          // ),

          //!password reset mate pela code ane pachi confomed code nakhiye te mate
          // confirmation: true,
          // inputController: inputController,
          // didConfirmed: (matchedText) {
          //   Navigator.of(context).push(MaterialPageRoute(
          //       builder: (context) => const NextPage()));
          // },
          // footer: TextButton(
          //   onPressed: () {
          //     // Release the confirmation state and return to the initial input state.
          //     inputController.unsetConfirmed();
          //   },
          //   child: const Text('Return enter mode.'),
          // ),

          //! for finger frint and figerprint icon
          //  customizedButtonChild: const Icon(
          //   Icons.fingerprint,
          // ),
          // customizedButtonTap: () async {
          //   await localAuth(context);
          // },
          //? finger lock open thata k\jj direct open thay jay
          // didOpened: () async {
          //   await localAuth(context);
          // },
        );
      },
      child: const Text(
        'Pin Lock',
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
