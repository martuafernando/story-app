import 'package:flutter/material.dart';
import 'package:story_app/src/story_feature/model/story.dart';

class CardStory extends StatelessWidget {
  final Story story;

  const CardStory({super.key, required this.story});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      elevation: 8,
      margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      child: Column(
        children: <Widget>[
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(8),
              topRight: Radius.circular(8),
            ),
            child: Image.network(
              story.photoUrl,
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
              loadingBuilder: _loadingBuilder,
            ),
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(story.name,
                    style: Theme.of(context).textTheme.headlineSmall),
                Text(story.description,
                    style: Theme.of(context).textTheme.bodyMedium),
                const SizedBox(height: 16),
                _informationTemplate(context, label: 'Lat', data: story.lat),
                const SizedBox(height: 8),
                _informationTemplate(context, label: 'Lon', data: story.lon),
              ],
            ),
          ),
        ],
      ),
    );
  }
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
  required double? data,
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
        flex: 4,
        child: Text(
          data == null ? '-' : data.toString(),
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      )
    ],
  );
}
