import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MessageListWidget extends StatelessWidget {
  final String message;
  final DateTime date;
  MessageListWidget(this.message, this.date);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 4, top: 8),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                  color: Colors.grey[350]!,
                  blurRadius: 2.0,
                  offset: Offset(0, 1.0))
            ], borderRadius: BorderRadius.circular(50), color: Colors.white),
            child: MaterialButton(
              disabledTextColor: Colors.black87,
              padding: EdgeInsets.only(left: 18),
              onPressed: null,
              child: Wrap(
                alignment: WrapAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.all(8),
                      width: double.infinity,
                      child: Text(message))
                  // Container(
                  //   child: Row(
                  //     children: [],
                  //   ),
                  // )
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 4),
            child: Align(
              alignment: Alignment.topRight,
              child: Text(
                  DateFormat('dd-MM-yyyy, kk:mma').format(date).toString(), style: TextStyle(color: Colors.grey),),
            ),
          )
        ],
      ),
    );
  }
}
