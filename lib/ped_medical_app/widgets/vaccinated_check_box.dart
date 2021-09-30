import 'package:flutter/material.dart';

class VaccinatedCheckbox extends StatefulWidget {
  final String name;
  final bool value;
  final Function(bool?) onChanged;
  const VaccinatedCheckbox(
      {Key? key,
      required this.name,
      required this.value,
      required this.onChanged})
      : super(key: key);

  @override
  _VaccinatedCheckboxState createState() => _VaccinatedCheckboxState();
}

class _VaccinatedCheckboxState extends State<VaccinatedCheckbox> {
  late bool checked;

  @override
  void initState() {
    checked = widget.value;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
        title: Text(widget.name),
        contentPadding: EdgeInsets.only(left: 8),
        controlAffinity: ListTileControlAffinity.leading,
        value: checked,
        onChanged: (value) {
          if (value != null) {
            setState(() {
              checked = value;
              widget.onChanged(value);
            });
          }
        });
  }
}
