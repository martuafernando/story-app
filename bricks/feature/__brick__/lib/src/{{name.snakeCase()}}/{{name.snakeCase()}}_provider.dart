import 'package:flutter/material.dart';

import '{{name.snakeCase()}}_repository.dart';

class {{name.pascalCase()}}Provider with ChangeNotifier {
  {{name.pascalCase()}}Provider(this._{{name.camelCase()}}Repository);

  final {{name.pascalCase()}}Repository _{{name.camelCase()}}Repository;
}
