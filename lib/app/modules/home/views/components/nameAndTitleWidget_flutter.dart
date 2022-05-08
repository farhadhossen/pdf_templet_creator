
import 'package:flutter/material.dart';

Widget NameAndTitle(String name){


  return
    Container(
        width: double.infinity,
        color: Colors.white,
        child: Column(
            children: [

              Text("Radisson Digital Technologies Limited",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight:FontWeight
                          .bold
                  )),


              Text(""+name),

              Container(
                width: double.infinity,
                //color: backgroundColor2,
                padding: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment:
                  MainAxisAlignment
                      .spaceEvenly,
                  children: [
                    Expanded(
                        flex: 1,
                        child:  Text("Date",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight:
                              FontWeight
                                  .bold),)
                    ),
                    Expanded(
                        flex: 1,
                        child: Text("Day",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight:
                              FontWeight
                                  .bold),)
                    ),
                    Expanded(
                      flex: 1,
                      child:  Text("In Time",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight:
                            FontWeight
                                .bold),
                      ),
                    ),
                    Expanded(
                        flex: 1,
                        child: Text("Out Time",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight:
                              FontWeight
                                  .bold),)

                    ),
                    Expanded(
                      flex: 1,
                      child: Text("Status"),
                    ),
                  ],
                ),
              ),
            ]

        )
    );
}