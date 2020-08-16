import 'package:shared_preferences/shared_preferences.dart';

Future<void> GetInstance() async {}

void fullCheck() async {
  final prefs = await SharedPreferences.getInstance();
  final yesterday = prefs.getString('yesterday') ?? '0';
  prefs.setString('yesterday', DateTime.now().toString());
}
