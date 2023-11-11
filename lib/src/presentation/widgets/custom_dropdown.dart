import 'package:flutter/material.dart';

class CustomDropdown extends StatelessWidget {
  final List items;
  final dynamic defaultValue;
  final Function(String? val) onChange;
  const CustomDropdown(
      {super.key,
      required this.items,
      this.defaultValue,
      required this.onChange});

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      isExpanded: true,
      hint: const Text('Seleccionar'),
      value: defaultValue,
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: onChange,
      items: items.map<DropdownMenuItem<String>>((dynamic value) {
        return DropdownMenuItem<String>(
          value: value['id'].toString(),
          child: Text(value['name']),
        );
      }).toList(),
    );
  }
}
