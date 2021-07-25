import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:samasys/samasys_ui.dart';
import 'package:samasys_app/core/view_models/employee.model.dart';
import 'package:samasys_app/ui/shared/app_bar.dart';
import 'package:samasys_app/ui/views/list_employee.screen.dart';

class CreateEmployee extends StatelessWidget {
  static const String ROUTE = "/";
  CreateEmployee({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final employeeModel = Provider.of<EmployeeModel>(context);
    return Scaffold(
      appBar: appBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: ListView(
          children: [
            verticalSpaceLarge,
            BoxText.subheading('CREATE EMPLOYEE PROFILE'),
            verticalSpaceMedium,
            InputField(
              title: 'Full Name *',
              onChanged: employeeModel.changeName,
              errorText: employeeModel.name.error,
            ),
            verticalSpaceRegular,
            InputField(
              title: 'Phone Number *',
              onChanged: employeeModel.changePhone,
              errorText: employeeModel.phone.error,
            ),
            verticalSpaceRegular,
            InputField(
              title: 'Email *',
              onChanged: employeeModel.changeEmail,
              errorText: employeeModel.email.error,
            ),
            verticalSpaceRegular,
            InputField(
              title: 'Position *',
              onChanged: employeeModel.changePosition,
              errorText: employeeModel.position.error,
            ),
            verticalSpaceRegular,
            InputField(
              title: 'Salary *',
              onChanged: employeeModel.changeSalary,
              errorText: employeeModel.salary.error,
            ),
            verticalSpaceLarge,
            BoxButton(
              title: 'SAVE',
              onPress: !employeeModel.isFormValid
                  ? null
                  : () async  {
                      employeeModel.submit();
                      await Navigator.pushNamed(context, ListEmployee.ROUTE);
                    },
            ),
            verticalSpaceLarge,
          ],
        ),
      ),
    );
  }

  _displayEmpty(value) {
    return value == null ? '' : value;
  }
}

class InputField extends StatelessWidget {
  String title;
  Function(String)? onChanged;
  String? errorText;
  InputField({
    Key? key,
    required this.title,
    required this.onChanged,
    required this.errorText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('$title', style: TextStyle(fontSize: 16)),
        verticalSpaceSmall,
        BoxInputField(
          onChanged: onChanged,
          errorText: errorText,
        )
      ],
    );
  }
}
