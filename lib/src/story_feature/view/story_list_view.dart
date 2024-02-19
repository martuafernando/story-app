import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:story_app/src/story_feature/model/story.dart';
import 'package:story_app/src/story_feature/provider/story_provider.dart';
import 'package:story_app/src/story_feature/widget/card_story.dart';

class StoryListView extends StatelessWidget {
  final Function onSignOut;
  final Function onTapped;
  final Function goToAddStory;
  final Function goToSettingView;
  final List<Story> items;

  const StoryListView({
    super.key,
    this.items = const [],
    required this.onSignOut,
    required this.onTapped,
    required this.goToAddStory,
    required this.goToSettingView,
  });

  Widget _buildList(BuildContext context) {
    return Consumer<StoryProvider>(builder: (context, provider, _) {
      final state = provider.listStoryResultState;

      return state.map(loading: (value) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }, noData: (value) {
        return Center(
          child: Text(value.message),
        );
      }, hasData: (value) {
        return ListView.builder(
          shrinkWrap: true,
          itemCount: value.data.length,
          itemBuilder: (context, index) {
            var story = value.data[index];
            return CardStory(
              story: story,
              onTapped: onTapped,
            );
          },
        );
      }, error: (error) {
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
      });
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
            onPressed: () {
              goToSettingView();
            },
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
                onPressed: () {
                  goToAddStory();
                },
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
      body: _buildList(context),
    );
  }
}
