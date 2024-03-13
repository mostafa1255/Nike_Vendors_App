import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import '../../../generated/l10n.dart';
import '../../router/app_router.dart';

class Change_Local_Success extends StatelessWidget {
  const Change_Local_Success({
    super.key,
    required this.locale,
  });
  final Locale locale;
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      locale: locale,
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      routerConfig: Approuter.router,
      debugShowCheckedModeBanner: false,
    );
  }
}
