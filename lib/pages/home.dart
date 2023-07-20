import 'package:flutter/material.dart';
import 'package:numbers_sum/widgets/home/submit_button.dart';
import 'package:numbers_sum/widgets/rounded_number_field.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String firstNumber = "0";
  String secondNumber = "0";

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            tooltip: "History",
            onPressed: () {
              Navigator.pushNamed(context, "/results");
            },
            icon: const Icon(Icons.history)),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.1, vertical: size.height * 0.1),
            child: Column(
              children: [
                const Text(
                  "Enter two numbers to sum their interval",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                const SizedBox(height: 8),
                const Text(
                  "Example: The entries 2 and 5 will resulted in (3 + 4) = 7",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 32),
                Row(
                  children: [
                    RoudedNumberField(
                      onChanged: onChangedFirstNumber,
                      title: "First number",
                    ),
                    const SizedBox(width: 16),
                    RoudedNumberField(
                      onChanged: onChangedSecondNumber,
                      title: "Second number",
                    )
                  ],
                ),
                SubmitButton(
                  firstNumber: int.parse(firstNumber),
                  secondNumber: int.parse(secondNumber),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  onChangedFirstNumber(value) {
    if (value.isNotEmpty) {
      setState(() {
        firstNumber = value;
      });
    }
  }

  onChangedSecondNumber(value) {
    if (value.isNotEmpty) {
      setState(() {
        secondNumber = value;
      });
    }
  }
}
