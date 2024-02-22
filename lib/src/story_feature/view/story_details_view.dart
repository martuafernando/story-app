import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:story_app/src/maps_feature/maps_feature_view.dart';
import 'package:story_app/src/shared/widget/platform_widget.dart';
import 'package:story_app/src/story_feature/model/story.dart';
import 'package:story_app/src/story_feature/provider/story_provider.dart';

class StoryDetailsView extends StatefulWidget {
  final String storyId;
  const StoryDetailsView({super.key, required this.storyId});

  @override
  State<StoryDetailsView> createState() => _StoryDetailsViewState();
}

class _StoryDetailsViewState extends State<StoryDetailsView> {
  @override
  void initState() {
    super.initState();
    Provider.of<StoryProvider>(context, listen: false)
        .fetchDetailStory(widget.storyId);
  }

  @override
  Widget build(BuildContext context) {
    return PlatformWidget(
      androidBuilder: (context) => _buildAndroid(context, widget.storyId),
      iosBuilder: (context) => _buildIos(context, widget.storyId),
    );
  }
}

Widget _buildPage(BuildContext context, String storyId) {
  return Consumer<StoryProvider>(builder: (context, provider, _) {
    final state = provider.storyResultState;

    return state.map(loading: (value) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }, noData: (value) {
      return Center(
        child: Text(provider.message),
      );
    }, hasData: (value) {
      return _pageTemplate(context, value.data);
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

Widget _pageTemplate(BuildContext context, Story story) {
  return SingleChildScrollView(
    child: Column(
      children: [
        Image.network(
          story.photoUrl,
          width: double.infinity,
          errorBuilder: (ctx, error, _) => const SizedBox(
            width: 100,
            child: Icon(Icons.error),
          ),
          loadingBuilder: (context, child, loadingProgress) =>
              _loadingBuilder(context, child, loadingProgress),
        ),
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              _informationTemplate(context, label: 'Name', data: story.name),
              const SizedBox(height: 8),
              _informationTemplate(context,
                  label: 'Description', data: story.description),
              const SizedBox(height: 8),
              _informationTemplate(context, label: 'Latitude', data: story.lat),
              const SizedBox(height: 8),
              _informationTemplate(context,
                  label: 'Longitude', data: story.lon),
              const SizedBox(height: 8),
              _informationTemplate(
                context,
                label: 'Created At',
                data: story.createdAt.toLocal(),
              ),
              const SizedBox(height: 8),
            ],
          ),
        ),
        SizedBox(
          width: double.infinity,
          height: 400,
          child: story.lat != null && story.lon != null
              ? MapsFeatureView(
                  latitude: story.lat!,
                  longitude: story.lon!,
                )
              : const Center(
                  child: Text('No Location Data'),
                ),
        ),
      ],
    ),
  );
}

Widget _buildAndroid(BuildContext context, String storyId) {
  return Scaffold(
    appBar: AppBar(
      title: const Text('Story App'),
    ),
    body: _buildPage(context, storyId),
  );
}

Widget _buildIos(BuildContext context, String storyId) {
  return CupertinoPageScaffold(
    navigationBar: const CupertinoNavigationBar(
      middle: Text('Story App'),
      transitionBetweenRoutes: false,
    ),
    child: _buildPage(context, storyId),
  );
}

Widget _loadingBuilder(
    BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
  if (loadingProgress == null) {
    return child;
  }

  return const Center(
    child: CircularProgressIndicator(),
  );
}

Widget _informationTemplate(
  BuildContext context, {
  required String label,
  required dynamic data,
}) {
  return Row(
    children: <Widget>[
      Expanded(
        flex: 1,
        child: Text(
          label,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ),
      Expanded(
        flex: 3,
        child: Text(
          data == null ? '-' : data.toString(),
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      )
    ],
  );
}
