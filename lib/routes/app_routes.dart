
import 'package:flutter/material.dart';

import '../views/dashboard.dart';

class AppRoutes {
  static String dashboard = '/dashboard';
  static Map<String, WidgetBuilder> routes = {

    dashboard: (context) => const Dashboard(),
  };
}
