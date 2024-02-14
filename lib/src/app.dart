import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:story_app/src/auth/auth_provider.dart';
import 'package:story_app/src/auth/auth_repository.dart';
import 'package:story_app/src/data/api/api_service.dart';
import 'package:story_app/src/routes/router_delegate.dart';
import 'package:story_app/src/story_feature/add_story_provider.dart';
import 'package:story_app/src/story_feature/story_provider.dart';
import 'package:story_app/src/story_feature/story_repository.dart';

import 'settings/settings_controller.dart';

class MyApp extends StatefulWidget {
  const MyApp({
    super.key,
    required this.settingsController,
  });

  final SettingsController settingsController;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late AppRouterDelegate appRouterDelegate;

  Widget _template() {
    return MaterialApp(
      restorationScopeId: 'app',
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', ''),
      ],
      onGenerateTitle: (BuildContext context) =>
          AppLocalizations.of(context)!.appTitle,
      theme: ThemeData(),
      darkTheme: ThemeData.dark(),
      themeMode: widget.settingsController.themeMode,
      home: Router(
        routerDelegate: appRouterDelegate,
        backButtonDispatcher: RootBackButtonDispatcher(),
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    appRouterDelegate = AppRouterDelegate(
      AuthRepository(
        apiService: ApiService(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: widget.settingsController,
      builder: (BuildContext context, Widget? child) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider<AuthProvider>(
              create: (_) => AuthProvider(
                authRepository: AuthRepository(
                  apiService: ApiService(),
                ),
              ),
            ),
            ChangeNotifierProvider<StoryProvider>(
              create: (_) => StoryProvider(
                storyRepository: StoryRepository(
                  apiService: ApiService(),
                  authRepository: AuthRepository(
                    apiService: ApiService(),
                  ),
                ),
              ),
            ),
            ChangeNotifierProvider<AddStoryProvider>(
              create: (_) => AddStoryProvider(
                storyRepository: StoryRepository(
                  apiService: ApiService(),
                  authRepository: AuthRepository(
                    apiService: ApiService(),
                  ),
                ),
              ),
            ),
          ],
          child: _template(),
        );
      },
    );
  }
}
