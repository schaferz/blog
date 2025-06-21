import 'package:blog/auth/auth.dart';
import 'package:blog/core/config/route/router_generator.dart';
import 'package:blog/core/core.dart';
import 'package:blog/di.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:intl/intl.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'dart:developer' show log;
import 'package:flutter/foundation.dart';
import 'package:ter_ui/ter_ui.dart';

Future<void> main() async {
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  PlatformDispatcher.instance.onError = (error, stack) {
    log(error.toString(), stackTrace: stack);
    return true;
  };

  Intl.defaultLocale = 'hu_HU';

  Bloc.observer = const TerBlocObserver();

  WidgetsFlutterBinding.ensureInitialized();

  await initDependencies();

  runApp(
    MultiRepositoryProvider(
      providers: [
        RepositoryProvider<AuthRepository>(
          lazy: false,
          create: (_) => AuthRepository(client: getIt<SupabaseClient>()),
        ),
      ],
      child: const AppWidget(),
    ),
  );
}

/// Alkalmazás widget mely az [AuthBloc]-ot globálisan provide-olja.
class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(create: (_) => AuthBloc(repository: context.read<AuthRepository>())),
      ],
      child: MaterialApp(
        theme: AppTheme.createThemeData(context),
        supportedLocales: [Locale('hu'), Locale('en')],
        localizationsDelegates: [
          ...GlobalMaterialLocalizations.delegates,
          GlobalWidgetsLocalizations.delegate,
          FormBuilderLocalizations.delegate,
        ],
        debugShowCheckedModeBanner: false,
        onGenerateRoute: RouterGenerator.generateRoute,
      ),
    );
  }
}
