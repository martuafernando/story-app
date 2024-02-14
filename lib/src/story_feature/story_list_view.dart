import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:story_app/src/story_feature/model/story.dart';
import 'package:story_app/src/story_feature/story_provider.dart';
import 'package:story_app/src/story_feature/widget/card_story.dart';

class StoryListView extends StatelessWidget {
  final Function onSignOut;
  final List<Story> items;

  const StoryListView(
      {super.key, this.items = const [], required this.onSignOut});

  Widget _buildList(BuildContext context) {
    return Consumer<StoryProvider>(builder: (context, provider, _) {
      if (provider.state == ResultState.loading) {
        return const Center(child: CircularProgressIndicator());
      }

      if (provider.state == ResultState.hasData) {
        return ListView.builder(
          shrinkWrap: true,
          itemCount: provider.result.length,
          itemBuilder: (context, index) {
            var story = provider.result[index];
            return CardStory(story: story);
          },
        );
      }

      if (provider.state == ResultState.noData) {
        return Center(
          child: Text(provider.message),
        );
      }

      if (provider.state == ResultState.error) {
        return AlertDialog(
          title: const Text('Error'),
          content: const Text('An error occurred. Cannot connect to server'),
          actions: <Widget>[
            TextButton(
              onPressed: () {},
              child: const Text('Refresh'),
            ),
          ],
        );
      }

      return const Material(child: Text(''));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Story App'),
          actions: [
            IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () {},
            ),
          ],
        ),
        floatingActionButton: Stack(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 32),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: FloatingActionButton(
                  onPressed: () {},
                  child: const Icon(Icons.add),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: FloatingActionButton(
                onPressed: () {
                  onSignOut();
                },
                backgroundColor: Colors.red,
                child: const Icon(Icons.logout_outlined),
              ),
            ),
          ],
        ),
        body: _buildList(context));
  }
}
