import 'package:flutter/material.dart';

import 'feature_repository.dart';

class FeatureProvider with ChangeNotifier {
  FeatureProvider(this._featureRepository);

  final FeatureRepository _featureRepository;
}
