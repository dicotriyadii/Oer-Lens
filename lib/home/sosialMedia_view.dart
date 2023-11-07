import 'dart:io';
import 'package:flutter/material.dart';
import 'dart:convert';
//page
import 'package:aplikasi_oer_lens/home/home_view.dart';
import 'package:aplikasi_oer_lens/home/measure_view.dart';
import 'package:aplikasi_oer_lens/home/profile_view.dart';
import 'package:aplikasi_oer_lens/home/sejarah_view.dart';
import 'package:aplikasi_oer_lens/home/history_view.dart';
import 'package:aplikasi_oer_lens/home/about_view.dart';
import 'package:aplikasi_oer_lens/home/data_view.dart';

class sosialMediaPage extends StatefulWidget {
  const sosialMediaPage({Key? key}) : super(key: key);

  @override
  State<sosialMediaPage> createState() => _sosialMediaPageState();
}

class _sosialMediaPageState extends State<sosialMediaPage> {
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
                  "Sosial Media",
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
                                                'assets/images/logoFb.png',
                                                width: 50,
                                                height: 50,
                                              ),
                                            )),
                                        Text(
                                          "PPKS.id",
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
                                                          AboutPage()));
                                            },
                                            child: Container(
                                              child: Image.asset(
                                                'assets/images/logoIg.png',
                                                width: 50,
                                                height: 50,
                                              ),
                                            )),
                                        Text(
                                          "@PPKS_id",
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
                                                'assets/images/logoPPKSTv.png',
                                                width: 50,
                                                height: 50,
                                              ),
                                            )),
                                        Text(
                                          "PPKS_TV",
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
