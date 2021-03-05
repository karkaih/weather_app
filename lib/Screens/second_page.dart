import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/Screens/third_page.dart';
import 'package:sizer/sizer.dart';
class ListWeather extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return Weather_list();
  }
}

class Weather_list extends State<ListWeather> {
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
          Positioned(
            child: Padding(
              padding: const EdgeInsets.only(top: 10, left: 2, right: 2),
              child: ListView.builder(

                  itemCount: 20,
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
                                  builder: (context) => DetailPage()));
                        },
                        leading: Image(
                          image: AssetImage('assets/d02d.png'),
                        ),
                        title: Text("Essaouira"),
                        subtitle: Text("05/03/2021"),
                        trailing: Text("Rain 19°C"),
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
