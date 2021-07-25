class Employee {
  String? name;
  String? phone;
  String? email;
  String? position;
  String? salary;

  Employee({
    this.name,
    this.phone,
    this.email,
    this.position,
    this.salary
  });

  @override
  String toString() {
    return '{Employee: name=$name, email=$email, phone=$phone, position=$position, salary=$salary }';
  }
}