class weatherData {
  final String? name;
  final Temperature? temp; //Temperature

  final int? humidity;
  final Wind? wind; //Wind
  final double? maxTemp;
  final double? minTemp;
  final int? pressure;
  final List<WeatherInfo>? weather;   //List<WeatherInfo>

  weatherData(
      { this.name,
       this.temp,
       this.humidity,
       this.wind,
       this.maxTemp, 
       this.minTemp,
       this.pressure, 
       this.weather});
  factory weatherData.fromJson(Map<String, dynamic> json) {
    return weatherData(
        name: json["name"], 
        temp: Temperature.fromJson(json["main"]), 
        humidity: json["main"]["humidity"], 
        wind: Wind.fromJson(json["wind"]), 
        maxTemp: (json["main"]["temp_max"]), 
        minTemp: (json["main"]["temp_min"]), 
        pressure: json["main"]["pressure"], 
        weather: List<WeatherInfo>.from(
          json["weather"].map(
            (weather)=> WeatherInfo.fromJson(weather),
          )
        )); 
  } 

  Map<String, dynamic> toJson() {
    return {
      "name": name, 
      "temp": temp, 
      "humidity": humidity,
      "wind": wind,
      "temp_max": maxTemp,
      "temp_min": minTemp,
      "pressure": pressure,
      "weather": weather
    }; 
  }
}

class WeatherInfo {
  final String main;
  WeatherInfo({
    required this.main
  });
  factory WeatherInfo.fromJson(Map<String,dynamic>json){
    return WeatherInfo(main:json["main"] );
  }
}
class Temperature {
  final double current;
  Temperature({required this.current});

  factory Temperature.fromJson(Map<String, dynamic> json) {
    return Temperature(current: json["temp"] ); // ✅ Reads "temp" from "main"
  }
}

class Wind {
  final double speed;
  Wind({required this.speed});

  factory Wind.fromJson(Map<String,dynamic>json){
    return Wind(speed: json["speed"]);
  }
}