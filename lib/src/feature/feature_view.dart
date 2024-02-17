import 'package:flutter/material.dart';

import 'feature_provider.dart';

class FeatureView extends StatelessWidget {
  const FeatureView({super.key, required this.provider});

  final FeatureProvider provider;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Feature'),
      ),
      body: const Text('Feature')
    );
  }
}
