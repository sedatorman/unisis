import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:unisis/islemler/c_getir.dart';
import 'package:unisis/siniflar/c_siniflar.dart';
import 'package:unisis/widget/menuG.dart';
import 'package:unisis/widget/menuO.dart';

import 'package:unisis/islemler/dbUtils.dart';
import 'package:unisis/siniflar/dbModel.dart';

DbUtils utils = DbUtils();

class ogrenciBilgiPage extends StatefulWidget {
  @override
  _ogrenciBilgiPageState createState() => _ogrenciBilgiPageState();
}

class _ogrenciBilgiPageState extends State<ogrenciBilgiPage> {
  List<dbModel> kayitList = [];

  int gelenRenk = 1;
  List<Color> olusanRenk = [
    Colors.cyan,
    Colors.blue,
    Colors.red,
    Colors.yellow,
    Colors.green,
    Colors.black
  ];

  void dgGetir() async {
    await utils.kayitlar().then((result) => {
          setState(() {
            kayitList = result;
          })
        });
    gelenRenk = kayitList[0].renk;
    if (gelenRenk == null) gelenRenk = 1;
  }

  @override
  Widget build(BuildContext context) {
    dgGetir();
    //******************************************************************
    // Kullanici Kontrol ***********************************************
    //******************************************************************
    Kullanicilar listKullanici;
    listKullanici = ModalRoute.of(context).settings.arguments;
    if (listKullanici == null)
      Navigator.of(context).popUntil((route) => route.isFirst);
    //******************************************************************
    //******************************************************************



    return Scaffold(
      appBar: AppBar(
        title: Text('Üniversite Bilgi Sistemi'),
        centerTitle: true,
        backgroundColor: olusanRenk[gelenRenk],
      ),
      drawer: listKullanici.kl_kul_tipi == 1
          ? menuG(listKullanici)
          : menuO(listKullanici),
      body: Container(
        color: Colors.blue[100],
        padding: EdgeInsets.all(10),
        child: Center(
          child: Column(
            children: [
              StreamBuilder<QuerySnapshot>(
                stream: getirOgrencilerDT()
                    .where('o_ogr_no', isEqualTo: listKullanici.kl_uni_no)
                    .snapshots(),
                builder: (context, snapshot) {
                  List<DocumentSnapshot> listOfDocumentSnap = snapshot.data.docs;
                  if (snapshot.hasData) {
                    return Column(
                      children: [
                        Container(width: 20, child: Text("")),
                        Container(
                            width: 200,
                            child: Image.asset("assets/foto/" + Ogrenciler
                                .fromFirestore(listOfDocumentSnap[0].data())
                                .o_ogr_no.toString() + ".jpg",
                                width: 200, height: 200, fit: BoxFit.contain)),
                        Container(width: 20, child: Text("")),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'OgrenciNo : ',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                decoration: TextDecoration.none,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text('${Ogrenciler
                                .fromFirestore(listOfDocumentSnap[0].data())
                                .o_ogr_no}',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                decoration: TextDecoration.none,
                              ),),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Adı Soyadı : ',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                decoration: TextDecoration.none,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                                '${Ogrenciler
                                    .fromFirestore(listOfDocumentSnap[0].data())
                                    .o_adi} ${Ogrenciler
                                    .fromFirestore(listOfDocumentSnap[0].data())
                                    .o_soyadi}',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                decoration: TextDecoration.none,
                              ),),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Fakültesi : ',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                decoration: TextDecoration.none,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text('${Ogrenciler
                                .fromFirestore(listOfDocumentSnap[0].data())
                                .o_fak_id}',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                decoration: TextDecoration.none,
                              ),),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Bölümü : ',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                decoration: TextDecoration.none,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text('${Ogrenciler
                                .fromFirestore(listOfDocumentSnap[0].data())
                                .o_bol_id}',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                decoration: TextDecoration.none,
                              ),),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Telefon : ',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                decoration: TextDecoration.none,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text('${Ogrenciler
                                .fromFirestore(listOfDocumentSnap[0].data())
                                .o_telefon}',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                decoration: TextDecoration.none,
                              ),),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'e-Posta : ',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                decoration: TextDecoration.none,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text('${Ogrenciler
                                .fromFirestore(listOfDocumentSnap[0].data())
                                .o_eposta}',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                decoration: TextDecoration.none,
                              ),),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Adres : ',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                decoration: TextDecoration.none,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text('${Ogrenciler
                                .fromFirestore(listOfDocumentSnap[0].data())
                                .o_adres}',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                decoration: TextDecoration.none,
                              ),),
                          ],
                        ),
                      ],
                    );
                  }
                }
              ),
            ],
          ),
        ),
      ),
    );
  }
}
