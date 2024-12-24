import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked_annotations.dart';

class SharedPrefsService implements InitializableDependency {
  static const String _counterKey = 'counter_value';
  SharedPreferences? _prefs;

  Future<void> saveCounter(int value) async {
    try {
      await _prefs?.setInt(_counterKey, value);
    } catch (e) {
      throw 'Unable to save counter value. Please try again.';
    }
  }

  Future<int> getCounter() async {
    try {
      return _prefs?.getInt(_counterKey) ?? 0;
    } catch (e) {
      throw 'Unable to retrieve counter value. Using default value of 0.';
    }
  }

  @override
  Future<void> init() async {
    try {
      _prefs = await SharedPreferences.getInstance();
    } catch (e) {
      throw 'Failed to initialize local storage. Please restart the app.';
    }
  }
}