import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:numbers_sum/controller/result_controller.dart';

class ResultList extends StatefulWidget {
  const ResultList({Key? key}) : super(key: key);

  @override
  State<ResultList> createState() => _ResultListState();
}

class _ResultListState extends State<ResultList> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ResultController>(
        init: ResultController(),
        builder: (value) => Column(children: buildList(value.results)));
  }

  buildList(List list) {
    List<Widget> results = [];

    if (list.isEmpty) {
      return const [
        Center(
            child: Text(
          "No itens added yet",
          style: TextStyle(fontSize: 24),
        ))
      ];
    } else {
      results.add(Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Text(
            "Numbers",
            style: TextStyle(fontSize: 16),
          ),
          Text(
            "Result",
            style: TextStyle(fontSize: 16),
          ),
        ],
      ));
    }

    for (int i = 0; i < list.length; i++) {
      results.add(
        Container(
          padding: const EdgeInsets.all(8),
          color: i.isOdd ? Colors.white : Colors.black12,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "${list[i].firstNumber} / ${list[i].secondNumber}",
                style: const TextStyle(fontSize: 16),
              ),
              Text(
                list[i].sum.toString(),
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      );
    }

    return results;
  }
}
