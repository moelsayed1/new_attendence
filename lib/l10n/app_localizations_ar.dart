// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get appTitle => 'تجربة فلاتر';

  @override
  String get loginPrompt => 'يلا نسجل حضور قبل المدير ما يعد الشفتات';

  @override
  String get whatIsYourAccount => 'مين الحساب الي دلي دة؟';

  @override
  String get oldPassword => 'كلمة السر القديمة';

  @override
  String get forgotPassword =>
      'نسيت الباسورد ؟ طبيعي جدا كلنا بننسي وحدنا عنا 🙁';

  @override
  String get loginButton => 'ادخل الجحيم .... قصدي الشغل 🙂';
}
