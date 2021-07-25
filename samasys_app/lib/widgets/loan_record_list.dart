import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:samasys/samasys_ui.dart';

List LOAN_SAMPLE_DATA = [
  {'month': 'JAN', 'year': '2020'},
  {'month': 'FEB', 'year': '2020'},
  {'month': 'DEC', 'year': '2019'},
];

class LoanRecordList extends StatelessWidget {
  const LoanRecordList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BoxText.subheading('LOAN RECORD'),
          verticalSpaceSmall,
          Container(
            height: 500,
            child: GroupedListView<dynamic, String>(
              elements: LOAN_SAMPLE_DATA,
              groupBy: (element) => element['year'],
              order: GroupedListOrder.DESC,
              groupSeparatorBuilder: (String value) => Container(
                margin: EdgeInsets.symmetric(vertical: 16),
                child: Row(
                  children: [
                    BoxText.subheading(value),
                    Divider(),
                  ],
                ),
              ),
              itemBuilder: (_, element) => LoanRecordItem(element: element),
            ),
          ),
        ]);
  }
}

class LoanRecordItem extends StatelessWidget {
  dynamic element;
  LoanRecordItem({Key? key, required this.element}) : super(key: key);

  String _currency = "₦";

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: kcLightGreyColor,
        ),
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: kcLightGreyColor,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.calendar_today, color: kcMediumGreyColor),
                verticalSpaceTiny,
                Text(element['month'],
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                      color: kcMediumGreyColor,
                    ))
              ],
            ),
          ),
          horizontalSpaceMedium,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  BoxText.subheading('BORROWED:'),
                  horizontalSpaceSmall,
                  BoxText.subheading('${_currency}50,000')
                ],
              ),
              Divider(
                color: kcMediumGreyColor,
                height: 16,
                thickness: 2,
                indent: 10,
                endIndent: 10,
              ),
              Row(
                children: [
                  BoxText.subheading('RECEIVABLE:'),
                  horizontalSpaceSmall,
                  BoxText.subheading('${_currency}100,000')
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
