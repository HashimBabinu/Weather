import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:weather_app/control/weather_Control.dart';

class Homepage extends StatelessWidget {
   Homepage({super.key});
final controller= Get.put(weatherController());
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color.fromARGB(222, 7, 166, 240),
      extendBodyBehindAppBar: true,
      body:  Obx(() {
        final data = controller.dataModel.value;
         
       return Container(
        padding: EdgeInsets.only(top: 50, left: 20),
        height: size.height,
        width: size.width, 
        // decoration: const BoxDecoration(
        //     image: DecorationImage(
        //         fit: BoxFit.cover,
        //         image: AssetImage("asset/img/background2.jpg"))),
        child: Stack(children: [
          Container(
            height: 50,
            child: Row(
              children: [
                Container(
                  child: Row(children: [
                    const Padding(
                      padding: EdgeInsets.only(bottom: 20),
                      child: Icon(
                        Icons.location_pin,
                        color: Colors.red,
                      ),
                    ),
                     Column(
                      children: [
                        Text(data.name ?? "",
                            style: TextStyle(
                                color: Colors.white,
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.bold,
                                fontSize: 20)),
                        Text('Good Morning',
                            style: TextStyle(
                                color: Colors.white,
                                fontStyle: FontStyle.italic,
                                fontSize: 10)),
                      ],
                    ),
                    SizedBox(
                        width: 200,
                        height: 50,
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.search,
                            size: 20,
                            color: Colors.white,
                          ),
                        ))
                  ]),
                )
              ],
            ),
          ),
          // Align(alignment: Alignment.center,
          //   child: Image.asset('asset/img/sun.png')),
           Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Text('${data.temp?.current.toStringAsFixed(1) ?? ''}°C',
                                   style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
              ),
              Align(
                  alignment: Alignment.bottomCenter,
                  child: Text(data.weather?.first.main ?? '',
                      style: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                          color: Colors.white))),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Text('Temp Max',
                          style: TextStyle(fontSize: 14, color: Colors.white)),
                      Text('${data.maxTemp?.toString()??''}\u00B0',
                          style: TextStyle(fontSize: 14, color: Colors.white)), 
                    ],
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    children: [
                      Text('Temp Low',
                          style: TextStyle(fontSize: 14, color: Colors.white)),
                      Text('${data.minTemp?.toString()??''}\u00B0',
                          style: TextStyle(fontSize: 14, color: Colors.white)),
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Text('Pressure',
                          style: TextStyle(fontSize: 14, color: Colors.white)),
                      Text('${data.pressure?.toString()??''}', 
                          style: TextStyle(fontSize: 14, color: Colors.white))
                    ],
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Column(
                    children: [
                      Text('Humidity',
                          style: TextStyle(fontSize: 14, color: Colors.white)),
                          Text('${data.humidity?.toString()??''}',
                          style: TextStyle(fontSize: 14, color: Colors.white))
                    ],
                  ),
                  
                ],
              ),
            ],
          ),
        ]),
      );
  })
  
    );
  }
}

