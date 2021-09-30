import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DatePicker extends StatefulWidget {
  final String name;
  final Function(DateTime) onChanged;
  final String? Function(String? value)? validator;
  const DatePicker(
      {Key? key,
      required this.name,
      required this.onChanged,
      required this.validator})
      : super(key: key);

  @override
  _DatePickerState createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  final dateController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8),
      child: TextFormField(
        readOnly: true,
        enabled: true,
        validator: widget.validator,
        decoration: InputDecoration(
          labelText: widget.name,
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blueGrey),
              borderRadius: BorderRadius.circular(10.0)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 2, color: Colors.lightBlue),
              borderRadius: BorderRadius.circular(10.0)),
          errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blueAccent),
              borderRadius: BorderRadius.circular(10.0)),
          focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blue, width: 2),
              borderRadius: BorderRadius.circular(10.0)),
        ),
        controller: dateController,
        onTap: () {
          showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime.now().add(Duration(days: 30)))
              .then((pickedDate) {
            if (pickedDate != null) {
              setState(() {
                dateController.text =
                    DateFormat('dd-MM-yyyy').format(pickedDate);
                widget.onChanged(pickedDate);
              });
            }
          });
        },
      ),
    );
  }
}
