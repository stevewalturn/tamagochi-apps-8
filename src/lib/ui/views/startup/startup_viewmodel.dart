import 'package:my_app/app/app.locator.dart';
import 'package:my_app/app/app.router.dart';
import 'package:my_app/services/shared_prefs_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class StartupViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _sharedPrefsService = locator<SharedPrefsService>();
  String? _modelError;
  String? get modelError => _modelError;

  Future runStartupLogic() async {
    try {
      await _sharedPrefsService.init();
      await Future.delayed(const Duration(seconds: 3));
      await _navigationService.replaceWithHomeView();
    } catch (e) {
      _modelError = e.toString();
      notifyListeners();
    }
  }
}
