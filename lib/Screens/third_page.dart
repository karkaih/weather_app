import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class DetailPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return Detail_Page();
  }
}

class Detail_Page extends State<DetailPage> {
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
                      "5 Mar. 2021",
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
                    image: AssetImage("assets/d01d.png"),
                    fit: BoxFit.fill,
                  ),
                )),

    Positioned(
        bottom: 30.0.h,
        child: Container(
      width: 100.0.w,
      height: 10.0.h,
      child: Column(
      children: [Expanded(child: Text ("Clear Sky", style: TextStyle(fontSize: 25))) ,],
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
                          child: Text("19°C", style: TextStyle(fontSize: 15))),
                      TableCell(
                          child: Text("19°C", style: TextStyle(fontSize: 15))),
                      TableCell(
                          child: Text("19°C", style: TextStyle(fontSize: 15))),
                      TableCell(
                          child: Text("19°C", style: TextStyle(fontSize: 15)))
                    ]),

                  ],
                ),
              ),
            )
          ],
        ));
  }
}
