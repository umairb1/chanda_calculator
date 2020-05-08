import 'package:flutter/material.dart';

class OptionType {
  String label;
  String value;

  OptionType(String label, String value) {
    this.label = label;
    this.value = value;
  }
}

class CustomRadioGroup extends StatefulWidget {
  String selectedValue;
  Function onSelect;
  final List<OptionType> options;
  CustomRadioGroup({this.options, this.selectedValue, this.onSelect});

  @override
  State<CustomRadioGroup> createState() {
    return CustomRadioGroupState(this.options, this.selectedValue, this.onSelect);
  }
}

class CustomRadioGroupState extends State<CustomRadioGroup> {
  CustomRadioGroupState(this.options, this.selectedValue, this.onSelect);
  String selectedValue;
  Function onSelect;
  final List<OptionType> options;
  List<Widget> optionsList = [];

  List<Widget> genrateOptionList() {
    this.selectedValue = this.options[0].value;
    this.options.asMap().forEach((index, option) {
      this.optionsList.add(Text(option.label));
      this.optionsList.add(
        Radio(
          value: option.value,
          groupValue: this.selectedValue,
          onChanged: (value) {
            this.setState(() =>   this.selectedValue = value);
          },
        )
      );
    });

    return this.optionsList;
  }

  @override
  Widget build(BuildContext context) {
    this.optionsList.clear();
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: genrateOptionList());
  }
}
