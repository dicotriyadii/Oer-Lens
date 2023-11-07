import 'dart:io';
import 'package:flutter/material.dart';
import 'dart:convert';
//page
import 'package:aplikasi_oer_lens/home/home_view.dart';
import 'package:aplikasi_oer_lens/home/measure_view.dart';
import 'package:aplikasi_oer_lens/home/profile_view.dart';
import 'package:aplikasi_oer_lens/home/about_view.dart';
import 'package:aplikasi_oer_lens/home/data_view.dart';
import 'package:aplikasi_oer_lens/home/history_view.dart';

class sejarahPage extends StatefulWidget {
  const sejarahPage({Key? key}) : super(key: key);

  @override
  State<sejarahPage> createState() => _sejarahPageState();
}

class _sejarahPageState extends State<sejarahPage> {
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
                  "Sejarah PPKS",
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
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    "Sejarah Singkat PPKS",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                    textAlign: TextAlign.left,
                                  ),
                                  Text(
                                    "Cikal bakal PPKS bernama APA (Algemeene Proefstation der AVROS/Algemeene Vereeniging van Rubberplanters ter Oostkust van Sumatra) yang didirikan pada tanggal 26 September 1916. APA merupakan sebuah lembaga penelitian perkebunan pertama di Sumatra. Pada saat itu, fokus utama penelitian APA adalah komoditi karet, setelah semakin berkembang APA juga menangani penelitian teh dan kelapa sawit.Latar belakang pendirian APA adalah krisis yang melanda industri tembakau pada tahun-tahun sebelumnya. Krisis industri tembakau telah memberikan pelajaran berharga yaitu dibutuhkan suatu dukungan kuat dari penelitian dan pengembangan (research and development) untuk keberlanjutan dan kemajuan suatu komoditas pertanian.\n Sejalan dengan berkembangnya perkebunan kelapa sawit di Sumatra, sebuah perusahaan Belanda (Handle Vereeniging Amsterdam / HVA) memiliki Balai Penelitian Sisal sendiri di Dolok Ilir yang secara diam-diam banyak melakukan penelitian kelapa sawit yang menghasilkan beberapa jenis unggul Psifera.Tidak mau kalah, Perkebunan Negara pada tahun 1963 membentuk Lembaga Penelitian Marihat untuk keperluan penelitian kelapa sawit dan pada beberapa tahun berikutnya berganti nama menjadi Puslitbun Marihat.\nLembaga penelitian APA berganti nama menjadi Balai Penyelidikan GAPPERSU atau Research Institute of The Sumatra Planters Association (RISPA) pada 1957. Status dan nama RISPA terus menerus berganti hingga pada 1987, kemudian berganti nama menjadi Pusat Penelitian Perkebunan (Puslitbun) Medan dan bertahan sampai terlaksananya penggabungan antara Puslitbun Marihat, Bandar Kuala, dan Medan pada 24 Desember 1992. Gabungan Puslitbun inilah akhirnya yang menjadi Pusat Penelitian Kelapa Sawit (PPKS).",
                                    style: TextStyle(fontSize: 18),
                                    textAlign: TextAlign.left,
                                  ),
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
