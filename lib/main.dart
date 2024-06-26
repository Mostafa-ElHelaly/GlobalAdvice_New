import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:globaladvice_new/core/resource_manger/routs_manager.dart';
import 'package:globaladvice_new/core/service/navigation_service.dart';
import 'package:globaladvice_new/core/service/service_locator.dart';
import 'package:globaladvice_new/core/translations/codegen_loader.g.dart';
import 'package:globaladvice_new/core/utils/config_size.dart';
import 'package:globaladvice_new/features/auth/presentation/login_screen.dart';
import 'package:google_fonts/google_fonts.dart';

import 'core/service/bloc_observer.dart';
import 'features/auth/presentation/manager/login_bloc.dart';
import 'features/auth/presentation/manager/register_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await ServerLocator().init();
  Bloc.observer = MyBlocObserver();

  runApp(
    EasyLocalization(
      fallbackLocale: const Locale('ar'),
      supportedLocales: const [
        Locale('ar'),
        Locale('en'),
      ],
      assetLoader: const CodegenLoader(),
      path: 'lib/core/translations/',
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    ConfigSize().init(context);
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<RegisterBloc>(),


        ),
        BlocProvider(
          create: (context) => getIt<LoginBloc>(),
        ),
      ],
      child: MaterialApp(
        title: 'Be sure!',
        debugShowCheckedModeBanner: false,
        supportedLocales: context.supportedLocales,
        localizationsDelegates: context.localizationDelegates,
        locale: context.locale,
        theme: ThemeData(
          textTheme: GoogleFonts.poppinsTextTheme(),
        ),
        navigatorKey: getIt<NavigationService>().navigatorKey,
        onGenerateRoute: RouteGenerator.getRoute,
        home: const LoginScreen(),
      ),
    );
  }
}

