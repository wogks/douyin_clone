import 'package:douyin_clone/common/widgets/main_navigation/main_navigation_screen.dart';
import 'package:douyin_clone/features/authentication/login_screen.dart';
import 'package:douyin_clone/features/authentication/sign_up_screen.dart';
import 'package:douyin_clone/features/inbox/activity_screen.dart';
import 'package:douyin_clone/features/inbox/chat_detail_screen.dart';
import 'package:douyin_clone/features/inbox/chats_screen.dart';
import 'package:douyin_clone/features/onboarding/interests_screen.dart';
import 'package:douyin_clone/features/videos/video_recording_screen.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  initialLocation: '/inbox',
  routes: [
    GoRoute(
      name: SignUpScreen.routeName,
      path: SignUpScreen.routeURL,
      builder: (context, state) => const SignUpScreen(),
    ),
    GoRoute(
      path: LoginScreen.routeURL,
      name: LoginScreen.routeName,
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: InterestsScreen.routeURL,
      name: InterestsScreen.routeName,
      builder: (context, state) => const InterestsScreen(),
    ),
    GoRoute(
      path: '/:tab(home|discover|inbox|profile)',
      name: MainNavigationScreen.routeName,
      builder: (context, state) {
        final tab = state.params['tab']!;
        return MainNavigationScreen(tab: tab);
      },
    ),
    GoRoute(
      path: ActivityScreen.routeURL,
      name: ActivityScreen.routeName,
      builder: (context, state) => const ActivityScreen(),
    ),
    GoRoute(
        path: ChatsScreen.routeURL,
        name: ChatsScreen.routeName,
        builder: (context, state) => const ChatsScreen(),
        routes: [
          GoRoute(
            path: ChatDetailScreen.routeURL,
            name: ChatDetailScreen.routeName,
            builder: (context, state) {
              final chatId = state.params['chatId']!;
              return ChatDetailScreen(chatId: chatId);
            },
          ),
        ]),
    GoRoute(
      path: VideoRecordingScreen.routeUrl,
      name: VideoRecordingScreen.routeName,
      builder: 
    )
  ],
);
