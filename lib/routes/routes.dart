import 'package:blood_donation_app/features/user_management/presentation/screens/blood_group_selected_screen.dart';
import 'package:blood_donation_app/features/user_management/presentation/screens/main_screen.dart';
import 'package:blood_donation_app/features/user_management/presentation/screens/notifications_screen.dart';
import 'package:blood_donation_app/routes/go_router_refresh_stream.dart';
import 'package:blood_donation_app/splash/splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../features/authentication/presentation/screens/account_screen.dart';
import '../features/authentication/presentation/screens/registration_screen.dart';
import '../features/authentication/presentation/screens/sign_in_screen.dart';
import '../features/user_management/presentation/screens/users_emailed_screen.dart';
part 'routes.g.dart';

enum AppRoutes {
  splash,
  main,
  signIn,
  register,
  account,
  bloodGroupSelected,
  emailedUsers,
  notifications,
}

final firebaseAuthProvider =Provider((ref)=> FirebaseAuth.instance);

@riverpod
GoRouter goRouter(GoRouterRef ref) {
  final firebaseAuth = ref.watch(firebaseAuthProvider);
  return GoRouter(
    initialLocation: '/splash',
    debugLogDiagnostics: true,
    redirect: (ctx,state){
      final isLoggedIn= firebaseAuth.currentUser!=null;

      if(isLoggedIn && (state.uri.toString()=='/signIn' || state.uri.toString()== '/register')){
        return'/main';
      }else if(!isLoggedIn && state.uri.toString().startsWith('/main')){
        return '/signIn';
      }
      return null;
    },
    refreshListenable: GoRouterRefreshStream(firebaseAuth.authStateChanges()),
    routes: [
      GoRoute(
        path: '/splash',
        name: AppRoutes.splash.name,
        builder: (ctx, state) => const SplashScreen(),
      ),

      GoRoute(
        path: '/signIn',
        name: AppRoutes.signIn.name,
        builder: (ctx, state) => const SignInScreen(),
      ),

      GoRoute(
        path: '/register',
        name: AppRoutes.register.name,
        builder: (ctx, state) {
          final type= state.extra as String;
          return RegistrationScreen(type);
        },),

      GoRoute(
        path: '/main',
        name: AppRoutes.main.name,
        builder: (ctx, state) => const MainScreen(),
        routes:[
          GoRoute(
            path: '/bloodGroupSelected',
            name: AppRoutes.bloodGroupSelected.name,
            builder: (ctx, state) {
              final bloodGroup= state.extra as String;
              return BloodGroupSelectedScreen(bloodGroup);
            },
          ),
          GoRoute(
            path: '/account',
            name: AppRoutes.account.name,
            builder: (ctx, state) => const AccountScreen(),
          ),

          GoRoute(
            path: '/notifications',
            name: AppRoutes.notifications.name,
            builder: (ctx, state) => const NotificationsScreen(),
          ),

          GoRoute(
            path: '/emailedUsers',
            name: AppRoutes.emailedUsers.name,
            builder: (ctx, state) => const UsersEmailedScreen(),
          ),

        ],
      ),
    ],
  );
}
