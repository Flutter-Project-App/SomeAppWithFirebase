import 'package:flutter/material.dart';
import 'package:some_app_firebase/ped_medical_app/model/category_option_model.dart';

class ChooseType extends StatelessWidget {
  const ChooseType(
      {Key? key,
      required this.title,
      required this.options,
      required this.onOptionTap})
      : super(key: key);

  final String title;
  final List<CategoryOption> options;
  final ValueChanged<CategoryOption> onOptionTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title),
            SizedBox(
              height: 12,
            ),
            Wrap(
              spacing: 10,
              children: [
                ...options
                    .map((option) => FilterChip(
                          label: Text(
                            option.name,
                            style: TextStyle(
                                color: option.isSelected
                                    ? Colors.white
                                    : Colors.blueGrey),
                          ),
                          onSelected: (_) => onOptionTap(option),
                          selected: option.isSelected,
                          backgroundColor: Colors.white,
                          selectedColor: Colors.blueGrey.shade300,
                          checkmarkColor: Colors.white,
                        ))
                    .toList()
              ],
            )
          ],
        ),
      ),
    );
  }
}
