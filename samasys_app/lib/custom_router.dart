import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:samasys_app/pages/create_employee.screen.dart';
import 'package:samasys_app/pages/list_employee.screen.dart';

class CustomRouter {
  static Route<Widget>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case CreateEmployee.ROUTE:
        return MaterialPageRoute(builder: (_) => CreateEmployee());
      case ListEmployee.ROUTE:
        return MaterialPageRoute(builder: (_) => ListEmployee());
      default:
        return null;
    }
  }
}
