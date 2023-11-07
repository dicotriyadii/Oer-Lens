import 'dart:io';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:awesome_dialog/awesome_dialog.dart';

//page
import 'package:aplikasi_oer_lens/home/home_view.dart';
import 'package:aplikasi_oer_lens/home/measure_view.dart';
import 'package:aplikasi_oer_lens/home/profile_view.dart';
import 'package:aplikasi_oer_lens/home/data_view.dart';
import 'package:aplikasi_oer_lens/home/history_view.dart';

class MeasurePage extends StatefulWidget {
  const MeasurePage({Key? key}) : super(key: key);

  @override
  State<MeasurePage> createState() => _MeasurePageState();
}

class _MeasurePageState extends State<MeasurePage> {
  @override
  void initState() {
    super.initState();
  }

  String Red = "0";
  String Green = "0";
  String Blue = "0";
  String Oer = "0";
  XFile? image;
  bool? loading = false;
  final ImagePicker picker = ImagePicker();
  Future sendImage(ImageSource media) async {
    setState(() {
      loading = true;
    });
    var img = await picker.pickImage(source: media);
    // var uri = "http://192.168.1.14/latihan/flutter_upload_image/create.php";
    var uri = "https://wifitermurah.com/APIOerLens/ProsesOer";
    var request = http.MultipartRequest('POST', Uri.parse(uri));
    if (img != null) {
      var pic = await http.MultipartFile.fromPath("gambar", img.path);
      request.files.add(pic);
      await request.send().then((result) {
        http.Response.fromStream(result).then((response) {
          var message = jsonDecode(response.body);
          // show snackbar if input data successfully
          final snackBar =
              SnackBar(content: Text(message['messages'].toString()));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
          setState(() {
            image = img;
            Red = message['data']['red'].toString();
            Green = message['data']['green'].toString();
            Blue = message['data']['blue'].toString();
            Oer = message['data']['oer'].toString();
            loading = false;
          });
          AwesomeDialog(
            context: context,
            dialogType: DialogType.success,
            borderSide: const BorderSide(
              color: Color.fromRGBO(255, 202, 0, 1),
              width: 2,
            ),
            width: 280,
            buttonsBorderRadius: const BorderRadius.all(
              Radius.circular(2),
            ),
            headerAnimationLoop: false,
            animType: AnimType.bottomSlide,
            title: 'Berhasil',
            desc: 'Pengambilan Gambar berhasil',
            btnOkOnPress: () {},
          ).show();
        });
      }).catchError((e) {
        print(e);
      });
    } else {
      final snackBar = SnackBar(content: Text("Gagal Upload Gambar"));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  Future getImage(ImageSource media) async {
    var img = await picker.pickImage(source: media);
    setState(() {
      image = img;
    });
  }

  void myAlert() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            title: Text('Please choose media to select'),
            content: Container(
              height: MediaQuery.of(context).size.height / 6,
              child: Column(
                children: [
                  ElevatedButton(
                    //if user click this button, user can upload image from gallery
                    onPressed: () {
                      Navigator.pop(context);
                      // getImage(ImageSource.gallery);
                      sendImage(ImageSource.gallery);
                    },
                    child: Row(
                      children: [
                        Icon(Icons.image),
                        Text('From Gallery'),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    //if user click this button. user can upload image from camera
                    onPressed: () {
                      Navigator.pop(context);
                      // getImage(ImageSource.camera);
                      sendImage(ImageSource.camera);
                    },
                    child: Row(
                      children: [
                        Icon(Icons.camera),
                        Text('From Camera'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  List<String> listKota = [
    "Pariaman",
    "Padang",
    "Bukittingi",
    "Solok",
    "Sawah Lunto",
    "Padang Panjang"
  ];
  List<String> listKebun = [
    "Kebun 1",
    "Kebun 2",
    "Kebun 3",
  ];
  String? nilaiLokasi;
  String? nilaiKebun;

  void pilihLokasi(String value) {
    //menampilkan kota yang dipilih
    setState(() {
      nilaiLokasi = value;
    });
  }

  void pilihKebun(String value) {
    //menampilkan kota yang dipilih
    setState(() {
      nilaiKebun = value;
    });
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
                  "Measure",
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
            padding: EdgeInsets.only(left: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 20),
                Container(
                  child: Text(
                    'Measure',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  ),
                ),
                DropdownButton(
                  hint: Text("Silahkan Pilih Lokasi"),
                  value: nilaiLokasi,
                  items: listKota.map((value) {
                    return DropdownMenuItem(
                      child: Text(value),
                      value: value,
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      nilaiLokasi = value;
                    });
                  },
                ),
                DropdownButton(
                  hint: Text("Silahkan Pilih Kebun"),
                  value: nilaiKebun,
                  items: listKebun.map((value) {
                    return DropdownMenuItem(
                      child: Text(value),
                      value: value,
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      nilaiKebun = value;
                    });
                  },
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
          Container(
              child: Column(
            children: <Widget>[
              Container(
                child: Column(
                  children: [
                    //if image not null show the image
                    //if image null show text
                    image != null
                        ? Container(
                            child: Column(
                              children: <Widget>[
                                Container(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Text("Red : \n" + Red),
                                      Text("Green : \n" + Green),
                                      Text("Blue : \n" + Blue),
                                      Text("Oer : \n" + Oer + "%")
                                    ],
                                  ),
                                ),
                                SizedBox(height: 20),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image.file(
                                      //to show image, you type like this.
                                      File(image!.path),
                                      fit: BoxFit.cover,
                                      width: MediaQuery.of(context).size.width,
                                      height: 400,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 50),
                              ],
                            ),
                          )
                        : Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Text("Red : \n ... "),
                                      Text("Green : \n  ... "),
                                      Text("Blue : \n  ... "),
                                      Text("Oer : \n  ... ")
                                    ],
                                  ),
                                ),
                                loading == true
                                    ? Container(
                                        child: Container(
                                            child: LinearProgressIndicator(
                                          backgroundColor: Colors.white,
                                          valueColor: AlwaysStoppedAnimation<
                                                  Color>(
                                              Color.fromRGBO(1255, 202, 0, 1)),
                                        )),
                                      )
                                    : Container(
                                        padding: EdgeInsets.only(left: 40),
                                        child: IconButton(
                                          icon: Icon(
                                            Icons.image_rounded,
                                            color: Colors.green,
                                            size: 250,
                                          ),
                                          onPressed: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        HomePage()));
                                          },
                                        ),
                                      ),
                                SizedBox(height: 200),
                                Container(
                                  padding: EdgeInsets.only(left: 50),
                                  child: ElevatedButton(
                                    onPressed: () {
                                      myAlert();
                                    },
                                    child: Text(
                                        'Klik Disini Untuk Upload / Ambil Gambar'),
                                    style: ElevatedButton.styleFrom(
                                        primary: Colors.green),
                                  ),
                                )
                              ],
                            ),
                          )
                  ],
                ),
              ),
            ],
          )),
          SizedBox(
            height: 30,
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
