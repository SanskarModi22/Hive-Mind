import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:routemaster/routemaster.dart';

import '../../../widgets/custom_text.dart';

class ModToolScreen extends ConsumerWidget {
  final String name;
  const ModToolScreen({required this.name, super.key});
  void navigateToEditCommunityScreen(BuildContext context) {
    Routemaster.of(context).push('/edit-community/$name');
  }

  void navigateToAddMods(BuildContext context) {
    Routemaster.of(context).push('/add-mods/$name');
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const CustomText(text: "Mod Tools"),
      ),
      body: Column(
        children: [
          ListTile(
            leading: const Icon(Icons.add_moderator),
            title: const Text('Add Moderators'),
            onTap: () => navigateToAddMods(context),
          ),
          ListTile(
            leading: const Icon(Icons.edit),
            title: const CustomText(
              text: "Edit Community",
            ),
            onTap: () => navigateToEditCommunityScreen(context),
          ),
        ],
      ),
    );
  }
}
