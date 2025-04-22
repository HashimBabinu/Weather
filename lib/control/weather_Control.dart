import 'package:get/get.dart';
import 'package:weather_app/model/dataModel.dart';
import 'package:weather_app/services/weather_Service.dart';

class weatherController extends GetxController {
  var dataModel = weatherData().obs;

  @override
  void onInit() {
    super.onInit();
    getData();
  }

  void getData() async {
    try {
      var data = await dataService().getService();
      if (data != null) {
        dataModel.value = data;
      }
    } catch (e) {
      Get.snackbar('Error', '$e');
    }
  }
}
