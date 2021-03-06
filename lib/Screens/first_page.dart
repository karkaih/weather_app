import 'dart:io';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:weather_app/Json_package/weather_page1.dart';
import 'package:weather_app/Screens/second_page.dart';
import 'package:intl/intl.dart';
class Search extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return Search_page();
  }
}

class Search_page extends State<Search> {
  TextEditingController textEditingController = TextEditingController();
  Coord user ;
  Coord card ;
  bool  test = true ;
  _getCoord() async {

    var data = await http.get(
        "http://api.openweathermap.org/data/2.5/weather?q="+textEditingController.text+"&appid=4fb4a7ce04bfdac5a90209896600dfa9&units=metric");
    var jsonData = jsonDecode(data.body);
    if (data.statusCode == 200 ) {
      setState(() {
        card  = Coord.fromjson(jsonData);
        user =Coord.fromjson1(jsonData);
        test = true;
      });

    }
    else{
      setState(() {
        user = new Coord();
        card = new Coord.fristPage("No match City","","01d",0.0,"Enter a valid City");
        test = false;
        print("kayn mochkil");
      });

    }


  }
  initState(){
super.initState();
 user = new Coord();
 card = new Coord.fristPage("City Name","","01d",0.0,"Enter City");
  }
   @override
  Widget build(BuildContext context) {

    return WillPopScope(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body:  Stack(
              children: [
                //image
                Positioned.fill(
                  child: Container(
                    child: Image(
                      image: AssetImage('assets/cloud.png'),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                //dakchi lakher
                Positioned(
                  bottom: 0.0.h,
                  child: ClipRect(
                    child: Container(
                      width: 100.0.w,
                      height: 55.0.h,
                      decoration: new BoxDecoration(
                          color: Colors.white.withOpacity(0.9),
                          borderRadius:
                          BorderRadius.vertical(top: Radius.circular(40))),
                      child: Stack(
                        children: [
                          Positioned(
                            child: Center(
                              child: InkWell(
                                onTap: (){
                                  if(user.lon != null && user.lat != null){
                                    print("Container clicked");
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => ListWeather(user,card.Name)),);
                                  }
                                  else{
                                    showDialog(
                                      context: context,
                                      builder: (context) => new AlertDialog(
                                        title: new Text('Error'),
                                        content: new Text('Fill the Text Field'),
                                        actions: <Widget>[
                                          new GestureDetector(
                                            onTap: () => Navigator.of(context).pop(false),
                                            child: Text("OK",style: TextStyle(color: Colors.red)),
                                          ),

                                        ],
                                      ),
                                    );
                                    }


                                },
                                child: Container(
                                  width: 80.0.w,
                                  height: 250,
                                  decoration: BoxDecoration(
                                      color: Colors.lightBlueAccent.withOpacity(0.2),
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Column(
                                    children: [
                                      Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.only(top: 15),
                                            child: Text(
                                               card.Name+","+card.country ,
                                              style: TextStyle(
                                                  color: Colors.black, fontSize: 18,decoration: TextDecoration.none),
                                            ),
                                          )),
                                      Expanded(
                                          child: Image(
                                              image:AssetImage("assets/d"+card.Icon.toString()+".png"))),
                                      Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.only(top: 30),
                                            child: Text(

                                              card.temp.toString()+"°C",
                                              style: TextStyle(
                                                  color: Colors.black.withOpacity(0.5), fontSize: 15,decoration: TextDecoration.none),
                                            ),
                                          )),
                                      Expanded(
                                          child: Text(
                                           card.Description,
                                            style: TextStyle(
                                                color: Colors.black, fontSize: 15,decoration: TextDecoration.none),
                                          ))
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
//blast text field
                Positioned(
                    bottom: 50.0.h,
                    left: 10.0.w,
                    child: Container(
                      width: 80.0.w,
                      height: 80,
                      decoration: BoxDecoration(
                          color: Colors.white, borderRadius: BorderRadius.circular(20)),
                      child: Row(
                        children: [
                          Expanded(child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20
                                ,vertical: 8
                            ),
                            child: TextField(
                              onSubmitted: (value){
                                if(value.isEmpty){
                                  showDialog(
                                    context: context,
                                    builder: (context) => new AlertDialog(
                                      title: new Text('Error'),
                                      content: new Text('Fill the Text Field'),
                                      actions: <Widget>[
                                        new GestureDetector(
                                          onTap: () => Navigator.of(context).pop(false),
                                          child: Text("OK",style: TextStyle(color: Colors.red)),
                                        ),

                                      ],
                                    ),
                                  );
                                }else{
                                  _getCoord();
                                }

//                                 if (TextInputType.text==null){
//                                   user = new Coord();
//                                   card = new Coord.fristPage("City Name","01d",0.0,"Enter City");
//                                 }
//                                 else{
// _getCoord();
//                                   // if(_getCoord()==true){
//                                   //   _getCoord();
//                                   // }
//                                   // else{
//                                   //   user = new Coord();
//                                   //   card = new Coord.fristPage("No match City","01d",0.0,"Enter a valid City");
//                                   // }
//                                 }

                              },
                              controller: textEditingController,
                              decoration: InputDecoration(
                                fillColor: Colors.white,
                                hintText: 'Search',
                              ),),
                          )),
                        ],
                      ),

                    )),

                //town Image
                Positioned(
                  bottom: 58.0.h,
                  left: 43.0.w,
                  child: Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(

                        image: DecorationImage(
                            image: AssetImage('assets/town.png'), fit: BoxFit.fill)),

                  ),
                ),



              ],
            )


      ),
      onWillPop:_onBackPressed
      //     () {
      //   debugPrint("cllicked");
      //   exit(0);
      // } ,
    );
  }
  Future<bool> _onBackPressed() {
    return showDialog(
      context: context,
      builder: (context) => new AlertDialog(
        title: new Text('Are you sure?'),
        content: new Text('Do you want to exit an App'),
        actions: <Widget>[
          new GestureDetector(
            onTap: () => Navigator.of(context).pop(false),
            child: Text("NO",style: TextStyle(color: Colors.red)),
          ),
          SizedBox(height: 16),
          new GestureDetector(
            onTap: () =>Navigator.of(context).pop(true),
            child: Text("YES",style: TextStyle(color: Colors.blue),),
          ),
        ],
      ),
    ) ??
        false;
  }
}
