import 'package:get/get.dart';
import 'package:numbers_sum/pages/result.dart';

class ResultController extends GetxController {
  var results = [];

  addResult(Result value) {
    results.insert(0, value);
    update();
  }
}
