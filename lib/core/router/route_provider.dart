import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:snapsticker/core/providers/firebase_providers.dart';
import 'package:snapsticker/features/ai/features/ai_main_navigation/views/pages/ai_main_nav_screen.dart';
import 'package:snapsticker/features/auth/views/sign_in_screen.dart';
import 'package:snapsticker/features/main_navigation/views/main_nav_screen.dart';
import 'package:snapsticker/features/settings/views/settings_page.dart';

part 'route_provider.g.dart';

@riverpod
GoRouter goRouter(Ref ref) {
  final authState = ref.watch(authStateChangeProvider);
  return GoRouter(
    initialLocation: '/login',
    redirect: (context, state) {
      final bool isLoggedIn = authState.value != null;
      final bool isLoggingIn = state.matchedLocation == '/login';

      if (!isLoggedIn && !isLoggingIn) return '/login';
      if (isLoggedIn && isLoggingIn) return '/main-nav-screen';

      return null;
    },
    //note: route
    routes: [
      GoRoute(path: '/login', builder: (context, state) => SignInScreen()),
      GoRoute(
        path: '/main-nav-screen',
        builder: (context, state) => MainNavScreen(),
      ),
      GoRoute(
        path: '/settings-screen',
        builder: (context, state) => SettingsPage(),
      ),
      GoRoute(path: '/ai-menu', builder: (context, state) => AiMainNavScreen()),
    ],
  );
}
