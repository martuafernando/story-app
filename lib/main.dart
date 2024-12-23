import 'package:flutter/material.dart';

import 'src/app.dart';
import 'src/settings/settings_provider.dart';
import 'src/settings/settings_service.dart';

void main() async {
  /**
   * Load the user's preferred theme while the splash screen is displayed.
   * This prevents a sudden theme change when the app is first displayed.
   */
  final settingsController = SettingsProvider(
    SettingsService(),
  );
  await settingsController.loadSettings();

  runApp(
    MyApp(settingsProvider: settingsController),
  );
}
