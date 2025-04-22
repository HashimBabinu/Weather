import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather_app/model/dataModel.dart';

class dataService {
  var url = 'https://api.openweathermap.org/data/2.5/weather?lat=11.2855&lon=76.2386&units=metric&appid=7a47b9b5f6e3804f4a029a48d18ee59d';

  Future<weatherData?> getService() async {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      print("API Response: $data"); // Optional debugging
      return weatherData.fromJson(data);
    } else {
      print('Failed to load weather: ${response.statusCode}');
    }
    return null;
  }
}








// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:weather_app/model/dataModel.dart';

// class dataService {
//   var url = 'https://api.openweathermap.org/data/2.5/weather?lat=11.2855°&lon=76.2386°&appid=7a47b9b5f6e3804f4a029a48d18ee59d';
//   Future<weatherData?>  getService() async  { 
//     final response = await http.get(Uri.parse(url)); 
//     //check condition 
//     if (response.statusCode ==200) { 
//       //json decode 
//       final data =  jsonDecode(response.body); 
//       return weatherData.fromJson(data); 
//     } else { 
//       print('Failed to load weather'); 
//     }
//     return null;
//   }
// }