import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:weather_app/Json_package/weather_page1.dart';

class DetailPage extends StatefulWidget {
  Coord coord ;
  String Name;
  DetailPage(this.coord,this.Name);
  @override
  State<StatefulWidget> createState() {
    return Detail_Page(coord,Name);
  }
}

class Detail_Page extends State<DetailPage> {
  Coord coord ;
  String Name;
  Detail_Page(this.coord,this.Name);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Details"),
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
                top: 0,
                child: ClipRect(
                  child: Container(
                    width: 100.0.w,
                    height: 10.0.h,
                    child: Center(
                        child: Text(
                      coord.dt,
                      style: TextStyle(
                          color: Colors.black.withOpacity(0.6),
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    )),
                  ),
                )),
            Positioned(
                bottom: 50.0.h,
                left: 25.0.w,
                child: Container(
                  width: 50.0.w,
                  height: 25.0.h,
                  child: Image(
                    image: AssetImage("assets/d"+coord.Icon+".png"),
                    fit: BoxFit.fill,
                  ),
                )),

    Positioned(
        bottom: 30.0.h,
        child: Container(
      width: 100.0.w,
      height: 10.0.h,
      child: Column(
      children: [Expanded(child: Text (coord.Description, style: TextStyle(fontSize: 25))) ,],
    ),)),
            Positioned(
              bottom: 20.0.h,
              left: 5.0.w,
              child: Container(
                padding: EdgeInsets.all(5),
                width: 100.0.w,
                child: Table(

                  children: [
                    TableRow(
                        children: [
                      TableCell(
                          child: Text(
                        "Max",
                        style: TextStyle(fontSize: 20),
                      )),
                      TableCell(
                          child: Text("Min", style: TextStyle(fontSize: 20))),
                      TableCell(
                          child:
                              Text("Evening", style: TextStyle(fontSize: 20))),
                      TableCell(
                          child: Text("Night", style: TextStyle(fontSize: 20)))
                    ]),
                    TableRow(
                        children: [
                         SizedBox(height: 15),//SizeBox Widget
                          SizedBox(height: 15),
                          SizedBox(height: 15),
                          SizedBox(height: 0),
                        ]
                    ),
                    TableRow(children: [
                      TableCell(
                          child: Text( coord.Max.toString()+" °C", style: TextStyle(fontSize: 15))),
                      TableCell(
                          child: Text(coord.Min.toString()+" °C", style: TextStyle(fontSize: 15))),
                      TableCell(
                          child: Text(coord.Evening.toString()+" °C", style: TextStyle(fontSize: 15))),
                      TableCell(
                          child: Text(coord.Night.toString()+" °C", style: TextStyle(fontSize: 15)))
                    ]),

                  ],
                ),
              ),
            )
          ],
        ));
  }
}
