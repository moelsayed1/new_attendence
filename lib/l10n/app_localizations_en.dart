// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Flutter Demo';

  @override
  String get loginPrompt =>
      'Let\'s register attendance before the manager counts the shifts';

  @override
  String get whatIsYourAccount => 'What\'s your account?';

  @override
  String get oldPassword => 'Old Password';

  @override
  String get forgotPassword =>
      'Forgot password? Naturally, we completely forgot about it here 🙁';

  @override
  String get loginButton => 'Enter hell... I mean work 🙂';
}
