import 'package:display/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:intl/intl.dart';
import 'package:intl/intl_standalone.dart';
import 'package:flutter_gen/gen_l10n/display_localizations.dart';

/// Runs the application
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await findSystemLocale();

  var systemLocale = Locale(Intl.systemLocale);
  var locale = AppLocalizations.delegate.isSupported(systemLocale)
      ? systemLocale
      : AppLocalizations.supportedLocales.first;

  await AppLocalizations.delegate.load(locale);
  usePathUrlStrategy();
  runApp(const App());
}
