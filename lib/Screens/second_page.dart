import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather_app/Json_package/weather_page1.dart';
import 'package:weather_app/Screens/third_page.dart';
import 'package:sizer/sizer.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ListWeather extends StatefulWidget {
  Coord user;
  String Name;

  ListWeather(this.user, this.Name);

  @override
  State<StatefulWidget> createState() {
    return Weather_list(user, Name);
  }
}

class Weather_list extends State<ListWeather> {
  List<Coord> list = [];
  Coord user;

  String Name;

  Weather_list(this.user, this.Name);

  _getCoord() async {
    var data = await http.get(
        "https://api.openweathermap.org/data/2.5/onecall?lat=" +
            user.lon.toString() +
            "&lon=" +
            user.lon.toString() +
            "&exclude=hourly,current&appid=a6f41d947e0542a26580bcd5c3fb90ef&units=metric");
    var jsonData = jsonDecode(data.body);
    if (data.statusCode == 200) {
      print(jsonData['daily']);
      setState(() {
        list = user.getList(jsonData);
      });
    } else {
      // setState(() {
      //   user = new Coord();
      //   card = new Coord.fristPage("No match City","","01d",0.0,"Enter a valid City");
      //   test = false;
      print("kayn mochkil page tanya");
      print("dkhelti lpage tanya" + user.lon.toString());
      print(user.lat);
      // });

    }

    print(user.lon);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getCoord();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return (Scaffold(
      appBar: AppBar(
        title: Text("Casting Hourly"),
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Container(
              child: Image(
                image: AssetImage('assets/cloud.png'),
                fit: BoxFit.fill,
              ),
            ),
          ),
          list.length == 0
              ? Center(
                  child:Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  Text(
                  "Loading ........",
    style: TextStyle(fontSize: 60),
    ),
                    SizedBox(height:40),
                    SpinKitPouringHourglass(
                      color: Colors.red,
                      size: 40,
                    )

                  ],
                  ) )
              : Positioned(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10, left: 2, right: 2),
                    child: ListView.builder(
                        itemCount: list.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            elevation: 12,
                            margin: EdgeInsets.only(top: 5),
                            color: Colors.lightBlueAccent.withOpacity(0.5),
                            child: ListTile(
                              contentPadding: EdgeInsets.all(20),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => DetailPage(
                                            list[index], this.Name)));
                              },
                              leading: Image(
                                image: AssetImage(
                                    "assets/d" + list[index].Icon + ".png"),
                              ),
                              title: Text(this.Name),
                              subtitle: Text(list[index].dt),
                              trailing: Text(list[index].Description +
                                  " " +
                                  list[index].temp.toString() +
                                  "°C"),
                            ),
                          );
                        }),
                  ),
                ),
        ],
      ),
    ));
  }
}
