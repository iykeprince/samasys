import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:samasys/samasys_ui.dart';
import 'package:samasys_app/core/models/employee.dart';
import 'package:samasys_app/core/view_models/employee.model.dart';
import 'package:samasys_app/ui/shared/app_bar.dart';
import 'package:samasys_app/ui/widgets/loan_record_list.dart';

class ListEmployee extends StatefulWidget {
  static const String ROUTE = "/list_employee";
  const ListEmployee({Key? key}) : super(key: key);

  @override
  _ListEmployeeState createState() => _ListEmployeeState();
}

class _ListEmployeeState extends State<ListEmployee> {
  int _selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    final _employeeModel = Provider.of<EmployeeModel>(context);
    return Scaffold(
      appBar: appBar(),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalSpaceRegular,
              BoxText.subheading('EMPLOYEES'),
              verticalSpaceMedium,
              Expanded(
                child: ListView.builder(
                  itemCount: _employeeModel.employees.length,
                  itemBuilder: (_, index) => EmployeeItem(
                    index: index,
                    selectedIndex: _selectedIndex,
                    employee: _employeeModel.employees[index],
                    onShowLoanRecord: (index) {
                      setState(() {
                        _selectedIndex = index;
                      });
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class EmployeeItem extends StatefulWidget {
  Function(int index)? onShowLoanRecord;
  int index;
  int selectedIndex;
  Employee employee;

  EmployeeItem({
    Key? key,
    required this.index,
    required this.selectedIndex,
    required this.employee,
    this.onShowLoanRecord,
  }) : super(key: key);

  @override
  _EmployeeItemState createState() => _EmployeeItemState();
}

class _EmployeeItemState extends State<EmployeeItem> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (event) => {setState(() => _isHovered = true)},
      onHover: (event) => {setState(() => _isHovered = true)},
      onExit: (event) => {setState(() => _isHovered = false)},
      child: GestureDetector(
        onTap: () => widget.onShowLoanRecord!(widget.index),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 10),
                    decoration: BoxDecoration(
                        border: Border.all(width: 1, color: kcLightGreyColor),
                        borderRadius: BorderRadius.circular(4)),
                    child: Row(
                      children: [
                        Image.asset('assets/images/user.jpg'),
                        horizontalSpaceMedium,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            BoxText.headingThree(
                                '${widget.employee.name?.toUpperCase()}'),
                            verticalSpaceSmall,
                            BoxText.body('${widget.employee.position}'),
                            BoxText.body('${widget.employee.phone}'),
                            BoxText.body('${widget.employee.email}')
                          ],
                        )
                      ],
                    ),
                  ),
                  _isHovered
                      ? Positioned(
                          bottom: 10,
                          right: 0,
                          child: Row(
                            children: [
                              _buildActionItem(
                                  onTap: () async {
                                    await Fluttertoast.showToast(
                                        msg:
                                            "This feature is not available at the moment!",
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.BOTTOM,
                                        timeInSecForIosWeb: 1,
                                        backgroundColor: Colors.red,
                                        textColor: Colors.white,
                                        fontSize: 16.0);
                                  },
                                  icon: Icons.edit_outlined),
                              horizontalSpaceTiny,
                              _buildActionItem(
                                  onTap: () {
                                    context
                                        .read<EmployeeModel>()
                                        .deleteEmployee(widget.index);
                                  },
                                  icon: Icons.delete_outline_outlined),
                            ],
                          ),
                        )
                      : Container(),
                ],
              ),
              widget.selectedIndex == widget.index
                  ? LoanRecordList()
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }

  _buildActionItem({Function()? onTap, IconData? icon}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.grey,
        ),
        child: Icon(
          icon,
          size: 24,
          color: Colors.black,
        ),
      ),
    );
  }
}
