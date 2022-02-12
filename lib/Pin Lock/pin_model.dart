import 'package:shared_preferences/shared_preferences.dart';

final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

void performLodin(int setPass) async {
  SharedPreferences prefs = await _prefs;
  final int pass = setPass;
  prefs.setInt("pass", pass);
}

Future<int> getLoding() async {
  SharedPreferences prefs = await _prefs;
  final int pass = (prefs.getInt("pass") ?? 1234);
  print("GET ${pass}");
  return pass;
}

// Future<SharedPreferences> shared() async {
//   final SharedPreferences prefs = await _prefs;
//   return prefs;
// }
