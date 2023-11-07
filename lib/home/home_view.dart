import 'dart:io';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

// halaman
import 'package:aplikasi_oer_lens/home/history_view.dart';
import 'package:aplikasi_oer_lens/home/measure_view.dart';
import 'package:aplikasi_oer_lens/home/profile_view.dart';
import 'package:aplikasi_oer_lens/home/home_view.dart';
import 'package:aplikasi_oer_lens/home/about_view.dart';
import 'package:aplikasi_oer_lens/home/data_view.dart';
import 'package:aplikasi_oer_lens/home/cobaWarna.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: Color.fromRGBO(47, 125, 51, 1),
      ),
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
                Container(
                  child: Container(
                    padding: EdgeInsets.all(12),
                    width: 1100,
                    height: 70,
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(47, 125, 51, 1),
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(60))),
                    child: Container(
                      child: Row(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(right: 10),
                            child: Image.asset(
                              'assets/images/profile.png',
                              width: 50,
                              height: 50,
                            ),
                          ),
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                SizedBox(height: 15),
                                Text(
                                  ' Selamat Datang Di Aplikasi Oer Lens',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.left,
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 5),
                Container(
                  child: Container(
                      height: 250,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: 20, left: 20),
                            child: Column(
                              children: <Widget>[
                                Image.asset(
                                  'assets/images/gambarCarousel.jpg',
                                  width: 300,
                                  height: 250,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(right: 20),
                            child: Column(
                              children: <Widget>[
                                Image.asset(
                                  'assets/images/gambar1.jpg',
                                  width: 300,
                                  height: 250,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(right: 20),
                            child: Column(
                              children: <Widget>[
                                Image.asset(
                                  'assets/images/gambar3.jpg',
                                  width: 300,
                                  height: 250,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(right: 20),
                            child: Column(
                              children: <Widget>[
                                Image.asset(
                                  'assets/images/gambar4.jpg',
                                  width: 300,
                                  height: 250,
                                ),
                              ],
                            ),
                          ),
                        ],
                      )),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MeasurePage()));
                        },
                        child: Container(
                          child: Card(
                            child: Column(
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.all(4),
                                  child: ListTile(
                                    leading: Image.asset(
                                      'assets/images/icon4.png',
                                      width: 50,
                                      height: 50,
                                    ),
                                    title: Text('Measure'),
                                    subtitle: Text(
                                        'Perhitungan RGB untuk menghasilkan Rendement yang optimal'),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => dataPage()));
                        },
                        child: Container(
                          child: Card(
                            child: Column(
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.all(4),
                                  child: ListTile(
                                    leading: Image.asset(
                                      'assets/images/icon3.png',
                                      width: 50,
                                      height: 50,
                                    ),
                                    title: Text('Data'),
                                    subtitle: Text(
                                        'Kumpulan data dari hasil perhitungan measure'),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => historyPage()));
                        },
                        child: Container(
                          child: Card(
                            child: Column(
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.all(4),
                                  child: ListTile(
                                    leading: Image.asset(
                                      'assets/images/icon2.png',
                                      width: 50,
                                      height: 50,
                                    ),
                                    title: Text('History'),
                                    subtitle:
                                        Text('Riwayat perhitungan Rendement'),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AboutPage()));
                          },
                          child: Container(
                            child: Card(
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    padding: EdgeInsets.all(4),
                                    child: ListTile(
                                      leading: Image.asset(
                                        'assets/images/icon1.png',
                                        width: 50,
                                        height: 50,
                                      ),
                                      title: Text('Tentang'),
                                      subtitle:
                                          Text('Tentang aplikasi Oer Lens'),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )),
                    ],
                  ),
                ),
              ],
            ),
          ),
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
                    MaterialPageRoute(builder: (context) => HomePage()));
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
