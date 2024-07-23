import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:globaladvice_new/core/resource_manger/routs_manager.dart';
import 'package:globaladvice_new/core/service/navigation_service.dart';
import 'package:globaladvice_new/core/service/service_locator.dart';
import 'package:globaladvice_new/core/translations/codegen_loader.g.dart';
import 'package:globaladvice_new/core/utils/config_size.dart';
import 'package:globaladvice_new/features/auth/presentation/login_screen.dart';
import 'package:globaladvice_new/features/home/presentation/home_screen.dart';
import 'package:globaladvice_new/features/home/presentation/manager/healthinsurancebloc/healthinsurancebloc_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'core/service/bloc_observer.dart';
import 'core/utils/translation_provider.dart';
import 'core/widgets/Custom_Drawer.dart';
import 'features/auth/presentation/manager/login_bloc/login_bloc.dart';
import 'features/auth/presentation/manager/register_bloc/register_bloc.dart';
import 'features/auth/presentation/manager/reset_password_bloc/bloc/reset_password_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await ServerLocator().init();
  Bloc.observer = MyBlocObserver();

  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    ConfigSize().init(context);

    return MultiProvider(
        providers: [
          BlocProvider(
            create: (context) => getIt<RegisterBloc>(),
          ),
          BlocProvider(
            create: (context) => getIt<LoginBloc>(),
          ),
          BlocProvider(
            create: (context) => getIt<ResetPasswordBloc>(),
          ),
          BlocProvider(
            create: (context) => getIt<HealthinsuranceBloc>(),
          ),
          ChangeNotifierProvider(create: (_) => TranslationProvider()),
        ],
        child: Consumer<TranslationProvider>(
          builder: (context, translate, child) {
            return MaterialApp(
              title: 'Be sure!',
              debugShowCheckedModeBanner: false,
              locale: translate.locale, // Set initial locale
              supportedLocales: [
                Locale('en', ''),
                Locale('ar', ''),
              ],
              localizationsDelegates: const [
                AppLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate
              ],
              theme: ThemeData(
                canvasColor: Colors
                    .white, // Change this to adjust dropdown background color

                textTheme: GoogleFonts.poppinsTextTheme(),
              ),
              navigatorKey: getIt<NavigationService>().navigatorKey,
              onGenerateRoute: RouteGenerator.getRoute,
              localeResolutionCallback: (locale, supportedLocales) {
                for (var supportedLocale in supportedLocales) {
                  if (supportedLocale.languageCode == locale!.languageCode) {
                    return supportedLocale;
                  }
                }
                return supportedLocales.first;
              },
              home: const HomeScreen(),
            );
          },
        ));
  }
}
