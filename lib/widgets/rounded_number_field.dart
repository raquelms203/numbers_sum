import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RoudedNumberField extends StatefulWidget {
  const RoudedNumberField({
    Key? key,
    required this.onChanged,
    required this.title,
  }) : super(key: key);

  final String title;
  final void Function(String)? onChanged;

  @override
  State<RoudedNumberField> createState() => _RoudedNumberFieldState();
}

class _RoudedNumberFieldState extends State<RoudedNumberField> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextField(
        keyboardType: TextInputType.number,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        decoration: InputDecoration(
            hintText: widget.title,
            contentPadding: const EdgeInsets.all(15),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(15))),
        onChanged: widget.onChanged,
      ),
    );
  }
}
