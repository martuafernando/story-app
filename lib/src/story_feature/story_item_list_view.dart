import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:story_app/src/auth/auth_provider.dart';

import '../settings/settings_view.dart';
import 'story_item.dart';
import 'story_item_details_view.dart';

/// Displays a list of SampleItems.
class StoryListView extends StatelessWidget {
  final Function onSignOut;

  const StoryListView({
    super.key,
    this.items = const [SampleItem(1), SampleItem(2), SampleItem(3)],
    required this.onSignOut
  });

  static const routeName = '/';

  final List<SampleItem> items;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sample Items'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {},
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: context.watch<AuthProvider>().isLoading
            ? const Center(child: CircularProgressIndicator())
            : const Icon(Icons.logout),
        onPressed: () { onSignOut(); },
      ),
      body: ListView.builder(
        restorationId: 'storyItemListView',
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          final item = items[index];

          return ListTile(
              title: Text('SampleItem ${item.id}'),
              leading: const CircleAvatar(
                foregroundImage: AssetImage('assets/images/flutter_logo.png'),
              ),
              onTap: () {
                Navigator.restorablePushNamed(
                  context,
                  StoryDetailsView.routeName,
                );
              });
        },
      ),
    );
  }
}
