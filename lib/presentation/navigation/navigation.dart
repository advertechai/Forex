import 'package:forex/presentation/screens/glossary/glossary_page.dart';
import 'package:forex/presentation/screens/profile/profile_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/models/strategy.dart';
import '../screens/home/home_screen.dart';
import '../screens/quiz/quiz_screen.dart';
import '../screens/stratagyDetails/strategy_detail_screen.dart';
import '../screens/strategy/strategy_screen.dart';

class Navigation {
  static final GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: HomeScreen.path,
        name: HomeScreen.name,
        redirect: (context, state) => Future.sync(
          () async {
            SharedPreferences prefs = await SharedPreferences.getInstance();
            bool hasCompletedQuiz = prefs.getBool('hasCompletedQuiz') ?? false;

            if (!hasCompletedQuiz) {
              return state.namedLocation(QuizScreen.name);
            }
            return null;
          },
        ),
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: QuizScreen.path,
        name: QuizScreen.name,
        builder: (context, state) {
          return const QuizScreen();
        },
      ),
      GoRoute(
        path: StrategyScreen.path,
        name: StrategyScreen.name,
        builder: (context, state) {
          return StrategyScreen();
        },
        routes: [
          GoRoute(
            path: StrategyDetailScreen.path,
            name: StrategyDetailScreen.name,
            builder: (context, state) {
              final strategy = state.extra as Strategy;

              return StrategyDetailScreen(
                strategy: strategy,
              );
            },
          ),
        ],
      ),
      GoRoute(
        path: ProfileScreen.path,
        name: ProfileScreen.name,
        builder: (context, state) {
          return ProfileScreen();
        },
      ),
      GoRoute(
        path: GlossaryPage.path,
        name: GlossaryPage.name,
        builder: (context, state) {
          return GlossaryPage();
        },
      ),
    ],
  );
}
