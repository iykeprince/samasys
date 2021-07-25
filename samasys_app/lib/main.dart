import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:samasys_app/core/utils/custom_router.dart';
import 'package:samasys_app/core/view_models/employee.model.dart';
import 'package:samasys_app/ui/views/create_employee.screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => EmployeeModel(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'SAMASYS',
        initialRoute: CreateEmployee.ROUTE,
        onGenerateRoute: CustomRouter.onGenerateRoute,
      ),
    );
  }
}
