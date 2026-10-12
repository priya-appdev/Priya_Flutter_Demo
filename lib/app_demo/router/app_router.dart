import 'package:counter_app/app_demo/main/tabbar_screen.dart';
import 'package:counter_app/app_demo/riverpod/user/user_provider.dart';
import 'package:counter_app/app_demo/screens/auth/createnewpassword_screen.dart';
import 'package:counter_app/app_demo/screens/auth/forgotpassword_screen.dart';
import 'package:counter_app/app_demo/screens/auth/login_screen.dart';
import 'package:counter_app/app_demo/screens/auth/registration_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final routeProvider = Provider<GoRouter>((ref){
    // Changes whenever the user logs in or out, so GoRouter runs redirect again.
    final loginState = ValueNotifier<bool>(ref.read(userProvider).email.isNotEmpty);
    ref.listen<bool>(
      userProvider.select((user) => user.email.isNotEmpty),
      (_, isLoggedIn) => loginState.value = isLoggedIn,
    );

    final router = GoRouter(
      initialLocation: '/login',
      refreshListenable: loginState,
      // Replaces the old AuthGate: logged out -> /login, logged in -> /home.
      redirect: (context, state) {
        final isLoggedIn = loginState.value;
        final onLoginPages = state.matchedLocation.startsWith('/login');

        if (!isLoggedIn && !onLoginPages) return '/login';
        if (isLoggedIn && onLoginPages) return '/home';
        return null;
      },
      routes: [
        GoRoute(
          path: '/login',
          builder: (context,state) => const LoginpageState(),
          routes: [
            GoRoute(
              path: 'register',
              builder: (context,state) => RegistrationScreen(),
            ),
            GoRoute(
              path: 'forgot-password',
              builder: (context,state) => const ForgotpasswordScreen(),
              routes: [
                GoRoute(
                  path: 'new-password',
                  builder: (context,state) => const CreateNewPasswordState()
                ),
              ]
            )
          ]
      ),
      GoRoute(
        path: '/home',
        builder: (context, state) => const TabbarControllerPage(),
      )
    ]);

    ref.onDispose(() {
      router.dispose();
      loginState.dispose();
    });
    return router;
});
