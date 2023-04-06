import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reddit_clone/features/auth/controller/auth_controller.dart';
import 'package:routemaster/routemaster.dart';

import '../../../theme/pallete.dart';
import '../../../widgets/custom_text.dart';

class ProfileDrawer extends ConsumerWidget {
  const ProfileDrawer({super.key});
  void logout(WidgetRef ref) {
    ref.watch(authControllerProvider.notifier).logout();
  }

  void navigateToUserProfile(BuildContext context, String uid) {
    Routemaster.of(context).push('/u/$uid');
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider)!;
    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(user.profilePic),
              radius: 70,
            ),
            const SizedBox(
              height: 10,
            ),
            CustomText(
              text: "u/${user.name}",
              fontSize: 18.0,
              fontWeight: FontWeight.w500,
            ),
            const SizedBox(
              height: 10,
            ),
            const Divider(),
            ListTile(
              title: const Text('My Profile'),
              leading: const Icon(Icons.person),
              onTap: () => navigateToUserProfile(context, user.uid),
            ),
            ListTile(
              leading: Icon(
                Icons.logout,
                color: Palette.redColor,
              ),
              title: const CustomText(
                text: "Logout",
              ),
              onTap: () => logout(ref),
            ),
            Switch.adaptive(
              value: true,
              onChanged: (value) {},
            )
          ],
        ),
      ),
    );
  }
}
