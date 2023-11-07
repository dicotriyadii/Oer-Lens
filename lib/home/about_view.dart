import 'dart:io';
import 'package:flutter/material.dart';
import 'dart:convert';
//page
import 'package:aplikasi_oer_lens/home/home_view.dart';
import 'package:aplikasi_oer_lens/home/measure_view.dart';
import 'package:aplikasi_oer_lens/home/profile_view.dart';
import 'package:aplikasi_oer_lens/home/sejarah_view.dart';
import 'package:aplikasi_oer_lens/home/history_view.dart';
import 'package:aplikasi_oer_lens/home/data_view.dart';
import 'package:aplikasi_oer_lens/home/sosialMedia_view.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  int _currentIndex = 0;
  String _currentMenu = 'Home';
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //pemanggilan material
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.green,
          leading: IconButton(
            icon: new Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              Route route = MaterialPageRoute(builder: (context) => HomePage());
              Navigator.push(context, route);
            },
          ),
          title: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text(
                  "About",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  textAlign: TextAlign.left,
                ),
              ],
            ),
          )),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => MeasurePage()));
        },
        tooltip: 'Increment',
        child: Icon(Icons.camera),
        elevation: 2.0,
        backgroundColor: Color.fromRGBO(47, 125, 51, 1),
      ),
      body: ListView(
        children: [
          Container(
            child: Column(
              children: <Widget>[
                SizedBox(height: 10),
                Container(
                  margin: EdgeInsets.only(right: 20, left: 20),
                  child: Column(
                    children: <Widget>[
                      Image.asset(
                        'assets/images/LogoOerPPKSBUMN.png',
                        width: 350,
                        height: 250,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: Column(
              children: <Widget>[
                Container(
                  child: Column(
                    children: <Widget>[
                      Card(
                          child: Container(
                              width: 320,
                              padding: EdgeInsets.all(15),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  Container(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: <Widget>[
                                        GestureDetector(
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          sejarahPage()));
                                            },
                                            child: Container(
                                              child: Image.asset(
                                                'assets/images/icon1.png',
                                                width: 50,
                                                height: 50,
                                              ),
                                            )),
                                        Text(
                                          "Sejarah PPKS",
                                          style: TextStyle(fontSize: 15),
                                          textAlign: TextAlign.left,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: <Widget>[
                                        GestureDetector(
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          sosialMediaPage()));
                                            },
                                            child: Container(
                                              child: Image.asset(
                                                'assets/images/icon3.png',
                                                width: 50,
                                                height: 50,
                                              ),
                                            )),
                                        Text(
                                          "Sosial Media",
                                          style: TextStyle(fontSize: 15),
                                          textAlign: TextAlign.left,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: <Widget>[
                                        GestureDetector(
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          historyPage()));
                                            },
                                            child: Container(
                                              child: Image.asset(
                                                'assets/images/icon2.png',
                                                width: 50,
                                                height: 50,
                                              ),
                                            )),
                                        Text(
                                          "History",
                                          style: TextStyle(fontSize: 15),
                                          textAlign: TextAlign.left,
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              )))
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    children: <Widget>[
                      Card(
                          child: Container(
                              width: 320,
                              padding: EdgeInsets.all(20),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    child: Text(
                                      "Versi Aplikasi : 1.0",
                                      style: TextStyle(fontSize: 15),
                                      textAlign: TextAlign.left,
                                    ),
                                  ),
                                ],
                              )))
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        //bottom navigation bar on scaffold
        color: Color.fromRGBO(47, 125, 51, 1),
        shape: CircularNotchedRectangle(), //shape of notch
        notchMargin:
            5, //notche margin between floating button and bottom appbar
        child: Row(
          //children inside bottom appbar
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: Icon(
                Icons.home,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomePage()));
              },
            ),
            IconButton(
              icon: Icon(
                Icons.list,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => dataPage()));
              },
            ),
            IconButton(
              icon: Icon(
                Icons.history,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => historyPage()));
              },
            ),
            IconButton(
              icon: Icon(
                Icons.history,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomePage()));
              },
            ),
            IconButton(
              icon: Icon(
                Icons.logout,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomePage()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
