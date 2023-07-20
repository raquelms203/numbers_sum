import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:numbers_sum/controller/result_controller.dart';
import 'package:numbers_sum/pages/result.dart';

class SubmitButton extends StatefulWidget {
  const SubmitButton(
      {Key? key, required this.firstNumber, required this.secondNumber})
      : super(key: key);

  final int firstNumber;
  final int secondNumber;

  @override
  State<SubmitButton> createState() => _SubmitButtonState();
}

class _SubmitButtonState extends State<SubmitButton> {
  final ResultController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 32.0),
      child: Material(
        elevation: 12,
        borderRadius: BorderRadius.circular(5.0),
        color: Colors.blueGrey[400],
        child: TextButton(
          onPressed: () {
            submitValue();
            Navigator.pushNamed(context, "/results");
          },
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
            child: const Text(
              'Submit',
              style: TextStyle(color: Colors.white, fontSize: 20.0),
            ),
          ),
        ),
      ),
    );
  }

  void submitValue() {
    int sum = 0;
    int smallerNumber, biggerNumber;

    if (widget.firstNumber < widget.secondNumber) {
      smallerNumber = widget.firstNumber;
      biggerNumber = widget.secondNumber;
    } else {
      smallerNumber = widget.secondNumber;
      biggerNumber = widget.firstNumber;
    }

    for (int i = smallerNumber + 1; i < biggerNumber; i++) {
      sum += i;
    }

    controller.addResult(Result(
        sum: sum, firstNumber: smallerNumber, secondNumber: biggerNumber));
  }
}
