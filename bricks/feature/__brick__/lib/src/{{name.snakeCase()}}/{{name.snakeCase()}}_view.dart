import 'package:flutter/material.dart';

import '{{name.camelCase()}}_provider.dart';

class {{name.pascalCase()}}View extends StatelessWidget {
  const {{name.pascalCase()}}View({super.key, required this.provider});

  final {{name.pascalCase()}}Provider provider;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('{{name.titleCase()}}'),
      ),
      body: const Text('{{name.titleCase()}}')
    );
  }
}
