import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
class Search extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return Search_page();
  }
}

class Search_page extends State<Search> {
  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Stack(
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
            bottom: 0,
            child: ClipRect(
              child: Container(
                width: 400,
                height: 400,
                decoration: new BoxDecoration(
                    color: Colors.white.withOpacity(0.9),
                    borderRadius:
                    BorderRadius.vertical(top: Radius.circular(40))),
                child: Stack(
                  children: [
                    Positioned(
                      child: Center(
                        child: Container(
                          width: 300,
                          height: 250,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20)),
                          child: Column(
                            children: [
                              Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 15),
                                    child: Text(
                                      "Essaouira",
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 18,decoration: TextDecoration.none),
                                    ),
                                  )),
                              Expanded(
                                  child: Image(
                                      image: AssetImage('assets/d10d.png'))),
                              Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 30),
                                    child: Text(

                                      "19°C",
                                      style: TextStyle(
                                          color: Colors.black.withOpacity(0.5), fontSize: 15,decoration: TextDecoration.none),
                                    ),
                                  )),
                              Expanded(
                                  child: Text(
                                    "Broken clouds",
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 15,decoration: TextDecoration.none),
                                  ))
                            ],
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
              child: Center(
            child: Container(
              width: 300,
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
                      controller: textEditingController,
                      decoration: InputDecoration(
                      fillColor: Colors.white,
                      hintText: 'Search',
                    ),),
                  )),
                ],
              ),

            ),
          )),

          //town Image
          Positioned(
            bottom: 420,
            left: 170,
            child: Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(

                  image: DecorationImage(
                      image: AssetImage('assets/town.png'), fit: BoxFit.fill)),

            ),
          ),



        ],
      ),
    );
  }
}
