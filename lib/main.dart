import 'package:blood_donation_app/routes/routes.dart';
import 'package:blood_donation_app/util/appstyles.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return MaterialApp.router(
      routerConfig: ref.watch(goRouterProvider),
      title: 'Blood Donation',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppStyles.mainColor),
        useMaterial3: true,
        appBarTheme: const AppBarTheme().copyWith(
            color: AppStyles.mainColor,
            centerTitle: true,
            iconTheme: const IconThemeData().copyWith(
              color: Colors.white,
            )
        ),
      ),

    );
  }
}

