import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:globaladvice_new/core/resource_manger/routs_manager.dart';
import 'package:globaladvice_new/core/service/navigation_service.dart';
import 'package:globaladvice_new/core/service/service_locator.dart';
import 'package:globaladvice_new/core/translations/codegen_loader.g.dart';
import 'package:globaladvice_new/core/utils/config_size.dart';
import 'package:globaladvice_new/core/utils/font_loader.dart';
import 'package:globaladvice_new/features/auth/presentation/login_screen.dart';
import 'package:globaladvice_new/features/home/presentation/home_screen.dart';
import 'package:globaladvice_new/features/home/presentation/manager/car_insurance/carinsurance_bloc.dart';
import 'package:globaladvice_new/features/home/presentation/manager/car_insurance/carinsurance_event.dart';
import 'package:globaladvice_new/features/home/presentation/manager/healthinsurancebloc/healthinsurancebloc_bloc.dart';
import 'package:globaladvice_new/features/home/presentation/manager/life_insurance/life_insurance_bloc.dart';
import 'package:globaladvice_new/features/home/presentation/manager/life_insurance/life_insurance_event.dart';
import 'package:globaladvice_new/features/home/presentation/manager/life_insurance/life_insurance_state.dart';
import 'package:globaladvice_new/features/home/presentation/manager/other_forms_bloc/other_forms_bloc.dart';
import 'package:globaladvice_new/features/home/presentation/manager/other_forms_bloc/other_forms_state.dart';
import 'package:globaladvice_new/features/home/presentation/manager/property_insurance.dart/property_insurance_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/service/bloc_observer.dart';
import 'core/utils/translation_provider.dart';
import 'core/widgets/Custom_Drawer.dart';
import 'features/auth/presentation/manager/login_bloc/login_bloc.dart';
import 'features/auth/presentation/manager/register_bloc/register_bloc.dart';
import 'features/auth/presentation/manager/reset_password_bloc/bloc/reset_password_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'features/home/presentation/manager/car_data_bloc/car_data_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await ServerLocator().init();
  Bloc.observer = MyBlocObserver();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  final isArabic = prefs.getBool("is_arabic") ?? false;
  final isLogin = prefs.getBool("is_login") ?? false;

  runApp(
    MyApp(
      isArabic: isArabic,
      isLogin: isLogin,
    ),
  );
}

class MyApp extends StatelessWidget {
  MyApp({super.key, required this.isArabic, required this.isLogin});
  final bool isArabic;
  final bool isLogin;
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
          BlocProvider(
            create: (context) => getIt<CarinsuranceBloc>(),
          ),
          BlocProvider(
            create: (context) => getIt<LifeInsuranceBloc>(),
          ),
          BlocProvider(
            create: (context) => getIt<PropertyInsuranceBloc>(),
          ),
          BlocProvider(
            create: (context) => getIt<LifeInsuranceBloc>(),
          ),
          BlocProvider(
            create: (context) => getIt<OtherInsuranceBloc>(),
          ),
          BlocProvider(
            create: (context) => getIt<PropertyInsuranceBloc>(),
          ),
          BlocProvider(
            create: (context) => getIt<CarDataBloc>(),
          ),
          ChangeNotifierProvider(
              create: (_) => TranslationProvider(isArabic, isLogin)),
        ],
        child: Consumer<TranslationProvider>(
          builder: (context, translate, child) {
            return MaterialApp(
              title: 'Be sure!',
              debugShowCheckedModeBanner: false,
              locale: translate.locale, // Set initial locale
              supportedLocales: [
                const Locale('en', ''),
                const Locale('ar', ''),
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
                fontFamily: FontLoader.getFontFamily(translate.locale),
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
              home: Provider.value(
                  value: isLogin,
                  child: isLogin ? const HomeScreen() : const HomeScreen()),
            );
          },
        ));
  }
}
