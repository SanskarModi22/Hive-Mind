import 'package:flutter/material.dart';
import 'package:reddit_clone/features/community/screens/create_community_screen.dart';
import 'package:routemaster/routemaster.dart';

import 'features/community/screens/add_mods_screen.dart';
import 'features/community/screens/community_screen.dart';
import 'features/community/screens/edit_community_screen.dart';
import 'features/community/screens/mods_tool_screen.dart';
import 'features/home/screens/home.dart';
import 'features/auth/screens/login_screen.dart';
import 'features/user_profile/screens/edit_profile_screen.dart';
import 'features/user_profile/screens/user_profile_screen.dart';

final loggedOutRoute = RouteMap(
  routes: {
    '/': (_) => const MaterialPage(child: LoginScreen()),
  },
);
final loggedInRoute = RouteMap(
  routes: {
    '/': (_) => const MaterialPage(child: HomeScreen()),
    '/create-community': (_) => const MaterialPage(
          child: CreateCommunityScreen(),
        ),
    '/r/:name': (route) => MaterialPage(
          child: CommunityScreen(
            name: route.pathParameters['name']!,
          ),
        ),
    '/mod-tools/:name': (routeData) => MaterialPage(
          child: ModToolScreen(
            name: routeData.pathParameters['name']!,
          ),
        ),
    '/edit-community/:name': (route) => MaterialPage(
          child: EditCommunityScreen(
            name: route.pathParameters['name']!,
          ),
        ),
    '/add-mods/:name': (routeData) => MaterialPage(
          child: AddModsScreen(
            name: routeData.pathParameters['name']!,
          ),
        ),
    '/u/:uid': (routeData) => MaterialPage(
          child: UserProfileScreen(
            uid: routeData.pathParameters['uid']!,
          ),
        ),
    '/edit-profile/:uid': (routeData) => MaterialPage(
          child: EditProfileScreen(
            uid: routeData.pathParameters['uid']!,
          ),
        ),
  },
);
