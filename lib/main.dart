import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'Shared/di/injection_container.dart' as di;
import 'Shared/routes/app_routes.dart';
import 'Shared/theme/app_theme.dart';
import 'Shared/theme/theme_cubit.dart';
import 'Modules/Home/home_bloc/home_bloc.dart';
import 'Modules/Home/screens/home_screen.dart';
import 'Modules/JobDetails/job_details_bloc/job_details_bloc.dart';
import 'Modules/JobDetails/screens/job_details_screen.dart';
import 'Modules/Chat/chat_bloc/chat_bloc.dart';
import 'Models/job_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  // Initialize dependency injection
  await di.init();

  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('ar')],
      path: 'assets/translations',
      fallbackLocale: const Locale('en'),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ThemeCubit()),
        BlocProvider(create: (context) => di.sl<HomeBloc>()),
        BlocProvider(create: (context) => di.sl<JobDetailsBloc>()),
        BlocProvider(create: (context) => di.sl<ChatBloc>()),
      ],
      child: BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (context, themeMode) {
          return MaterialApp(
            title: 'Saboba',
            debugShowCheckedModeBanner: false,
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: themeMode,
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            initialRoute: AppRoutes.home,
            onGenerateRoute: (settings) {
              switch (settings.name) {
                case AppRoutes.home:
                  return MaterialPageRoute(builder: (_) => const HomeScreen());
                case AppRoutes.jobDetails:
                  final job = settings.arguments as JobModel;
                  return MaterialPageRoute(
                    builder: (_) => JobDetailsScreen(job: job),
                  );
                default:
                  return MaterialPageRoute(builder: (_) => const HomeScreen());
              }
            },
          );
        },
      ),
    );
  }
}
