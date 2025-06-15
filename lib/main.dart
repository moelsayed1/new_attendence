import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:new_attendence/l10n/app_localizations.dart';
import 'package:new_attendence/features/login/presentation/cubit/login_cubit.dart';
import 'package:new_attendence/features/login/login_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_attendence/features/login/data/datasources/login_remote_datasource_impl.dart';
import 'package:new_attendence/features/login/data/repositories/login_repository_impl.dart';
import 'package:new_attendence/features/login/domain/usecases/login_user.dart';
import 'package:new_attendence/core/constants/app_constants.dart';

final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final remoteDataSource = LoginRemoteDataSourceImpl();
        final repository = LoginRepositoryImpl(remoteDataSource: remoteDataSource);
        final loginUser = LoginUser(repository);
        return LoginCubit(loginUser);
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        scaffoldMessengerKey: scaffoldMessengerKey,
        title: 'New Attendence',
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('en'), // English
          Locale('ar'), // Arabic
        ],
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          fontFamily: AppConstants.fontCairo,
        ),
        home: const LoginScreen(),
      ),
    );
  }
} 