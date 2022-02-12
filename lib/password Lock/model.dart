import 'package:shared_preferences/shared_preferences.dart';

final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

void performLodin(String setPass) async {
  SharedPreferences prefs = await shared();
  final String password = setPass.trim();
  print("SET ${password}");
  prefs.setString("password", password.trim());
}

Future<String> getLodin() async {
  SharedPreferences prefs = await shared();
  final String password = (prefs.getString('password') ?? "");
  print("GET ${password}");
  return password;
}

Future<SharedPreferences> shared() async {
  final SharedPreferences prefs = await _prefs;
  return prefs;
}
