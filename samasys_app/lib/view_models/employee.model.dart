import 'package:flutter/cupertino.dart';
import 'package:samasys_app/models/employee.dart';
import 'package:samasys_app/services/validator.service.dart';
import 'package:samasys_app/utils/util.dart';

class EmployeeModel extends ChangeNotifier {
/**
 * I am validating the form without using reactive_form
 * not sure if i am permitted to use because it is far more optimised
 * for handling form operations.
 */

  ValidatorService _name = ValidatorService(null, null);
  ValidatorService _phone = ValidatorService(null, null);
  ValidatorService _email = ValidatorService(null, null);
  ValidatorService _position = ValidatorService(null, null);
  ValidatorService _salary = ValidatorService(null, null);

  ValidatorService get name => _name;
  ValidatorService get phone => _phone;
  ValidatorService get email => _email;
  ValidatorService get position => _position;
  ValidatorService get salary => _salary;

  List<Employee> _employeeList = [];
  List<Employee> get employees => _employeeList;

  void addEmployee(Employee employee) {
    _employeeList.add(employee);
    notifyListeners();
  }

  void deleteEmployee(int index){
    _employeeList.removeAt(index);
    notifyListeners();
  }

  bool get isFormValid {
    if (_name.value != null &&
        _phone.value != null &&
        _email.value != null &&
        _position.value != null &&
        _salary.value != null) {
      return true;
    } else {
      return false;
    }
  }

  //form input validation listeners
  void changeName(String value) {
    if (value.length > 1) {
      _name = ValidatorService(value, null);
    } else {
      _name = ValidatorService(null, "Name is required");
    }
    notifyListeners();
  }

  void changePhone(String value) {
    if (value.length > 1 && value.length <= 11 && isNumeric(value)) {
      _phone = ValidatorService(value, null);
    } else {
      _phone =
          ValidatorService(null, "Value entered is not a valid phone number");
    }
    notifyListeners();
  }

  void changeEmail(String value) {
    if (value.length > 1 && value.contains('@')) {
      _email = ValidatorService(value, null);
    } else {
      _email = ValidatorService(null, "Email is not valid");
    }
    notifyListeners();
  }

  void changePosition(String value) {
    if (value.length > 1) {
      _position = ValidatorService(value, null);
    } else {
      _position = ValidatorService(null, "Position is required");
    }
    notifyListeners();
  }

  void changeSalary(String value) {
    if (value.length > 1 && isNumeric(value)) {
      _salary = ValidatorService(value, null);
    } else {
      _salary = ValidatorService(null, "Enter a valid number");
    }
    notifyListeners();
  }



  void submit() {
    var employee = Employee(
      name: name.value,
      phone: phone.value,
      email: email.value,
      position: position.value,
      salary: salary.value,
    );
    addEmployee(employee);
    
  }
}
