import 'package:flutter/material.dart';
import 'package:unisis/islemler/c_getir.dart';
import 'package:unisis/siniflar/c_siniflar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';

class deneme extends StatefulWidget {

  @override
  _denemeState createState() => _denemeState();
}

class _denemeState extends State<deneme> {


  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
        appBar: AppBar(title: Text("Denene kısmı"),),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: Colors.blue[100],
              height: 30,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    " Notlar",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      decoration: TextDecoration.none,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Expanded(child: Text(" ")),
                  Text(
                      " "),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                      alignment: Alignment.center,
                      height: 40,
                      decoration: BoxDecoration(
                          border: Border.all(width: 0.5),
                          color: Colors.blue[50]),
                      child: Text(
                        "Ders Kod",
                        style: TextStyle(
                          color: Colors.black,
                          decoration: TextDecoration.none,
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                ),
                Expanded(
                  flex: 6,
                  child: Container(
                      alignment: Alignment.center,
                      height: 40,
                      decoration: BoxDecoration(
                          border: Border.all(width: 0.5),
                          color: Colors.blue[50]),
                      child: Text(
                        "Ders Adı",
                        style: TextStyle(
                          color: Colors.black,
                          decoration: TextDecoration.none,
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                      alignment: Alignment.center,
                      height: 40,
                      width: 85,
                      decoration: BoxDecoration(
                          border: Border.all(width: 0.5),
                          color: Colors.blue[50]),
                      child: Text(
                        "Vize",
                        style: TextStyle(
                          color: Colors.black,
                          decoration: TextDecoration.none,
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                      alignment: Alignment.center,
                      height: 40,
                      width: 85,
                      decoration: BoxDecoration(
                          border: Border.all(width: 0.5),
                          color: Colors.blue[50]),
                      child: Text(
                        "Final",
                        style: TextStyle(
                          color: Colors.black,
                          decoration: TextDecoration.none,
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                      alignment: Alignment.center,
                      height: 40,
                      width: 85,
                      decoration: BoxDecoration(
                          border: Border.all(width: 0.5),
                          color: Colors.blue[50]),
                      child: Text(
                        "Bütünleme",
                        style: TextStyle(
                          color: Colors.black,
                          decoration: TextDecoration.none,
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                      alignment: Alignment.center,
                      height: 40,
                      width: 85,
                      decoration: BoxDecoration(
                          border: Border.all(width: 0.5),
                          color: Colors.blue[50]),
                      child: Text(
                        "Sonuç",
                        style: TextStyle(
                          color: Colors.black,
                          decoration: TextDecoration.none,
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                ),
              ],
            ),
            Flexible(
              child: StreamBuilder<QuerySnapshot>(
                stream:getirNotlarDT().where('n_ogr_no',isEqualTo: '2').orderBy('n_ders_no').snapshots(),
                builder:(BuildContext context, AsyncSnapshot asyncSnapshot){
                  List<DocumentSnapshot> listOfDocumentSnap = asyncSnapshot.data.docs;
                  return ListView.builder(
                    itemCount: listOfDocumentSnap.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                flex:2,
                                child: Container(
                                  height: 40,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 4.0, vertical: 2.0),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 0.5,
                                          color: Colors.grey
                                              .withOpacity(0.5))),
                                  child: Text(
                                      "${Notlar.fromFirestore(listOfDocumentSnap[index].data()).n_ders_no}"),
                                ),
                              ),
                              Expanded(
                                flex:6,
                                child: Container(
                                  height: 40,
                                  width: 150,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 4.0, vertical: 2.0),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 0.5,
                                          color: Colors.grey
                                              .withOpacity(0.5))),
                                  child: Text(
                                      "${Notlar.fromFirestore(listOfDocumentSnap[index].data()).n_ders_adi}"),
                                ),
                              ),
                              Expanded(
                                flex:2,
                                child: Container(
                                  height: 40,
                                  width: 85,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 4.0, vertical: 2.0),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 0.5,
                                          color: Colors.grey
                                              .withOpacity(0.5))),
                                  child: Text(
                                      "${Notlar.fromFirestore(listOfDocumentSnap[index].data()).n_vize}"),
                                ),
                              ),
                              Expanded(
                                flex:2,
                                child: Container(
                                  height: 40,
                                  width: 85,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 4.0, vertical: 2.0),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 0.5,
                                          color: Colors.grey
                                              .withOpacity(0.5))),
                                  child: Text(
                                      "${Notlar.fromFirestore(listOfDocumentSnap[index].data()).n_final}"),
                                ),
                              ),
                              Expanded(
                                flex:2,
                                child: Container(
                                  height: 40,
                                  width: 85,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 4.0, vertical: 2.0),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 0.5,
                                          color: Colors.grey
                                              .withOpacity(0.5))),
                                  child: Text(
                                      "${Notlar.fromFirestore(listOfDocumentSnap[index].data()).n_butunleme}"),
                                ),
                              ),
                              Expanded(
                                flex:2,
                                child: Container(
                                  height: 40,
                                  width: 85,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 4.0, vertical: 2.0),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 0.5,
                                          color: Colors.grey
                                              .withOpacity(0.5))),
                                  child: Text(
                                      "${Notlar.fromFirestore(listOfDocumentSnap[index].data()).n_sonuc}"),
                                ),
                              ),
                            ],
                          ),
                        ],
                      );


                    },
                  );
                },
              ),
            ),

          ],
        ),
    );
  }
}
