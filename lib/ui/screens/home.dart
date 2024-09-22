import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebse/constants.dart';
import 'package:firebse/model/record.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:url_launcher/url_launcher.dart';

import 'edit.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  FirebaseFirestore _store = FirebaseFirestore.instance;

  Future<void> customLaunch(command) async {
    if (await canLaunch(command)) {
      print("launched $command");
      await launch(command);
    } else {
      print(' could not launch $command');
    }
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: _store.collection("creditors").snapshots(),
        builder: (context, snapshot) {
          return snapshot.hasData
              ? ListView.builder(
                  itemBuilder: (context, position) {
                    var data = snapshot.data!.docs;
                    var serverRecord = data[position];

                    Record record = Record(
                      date: serverRecord["date"],
                      quantity: serverRecord["quantity"],
                        rate: serverRecord["rate"],
                        paidAmount: serverRecord["paidAmount"],
                        product: serverRecord["product"],
                        number: serverRecord["number"],
                        creditors: serverRecord["creditorName"],
                        hasPaid: serverRecord["hasPaid"]);

                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                          gradient: LinearGradient(
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                            colors: [
                              theme== ThemeData.dark()?Colors.grey:Colors.purpleAccent,
                              theme== ThemeData.dark()?Color(0xff312A77):Colors.lightBlueAccent,


                              theme== ThemeData.dark()?Color(0xff312A77):Colors.deepPurpleAccent,

                              theme== ThemeData.dark()?Colors.black:Colors.purpleAccent,

                            ],
                          )
                      ),
                      margin: EdgeInsets.all(15),
                      padding:
                          EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      record.creditors,
                                      style: TextStyle(
                                        color:Colors.white,
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    TextS("Date : ${(record.date).substring(0,10)}"),
                                    TextS(
                                      "Phone number: ${record.number}",
                                    ),
                                    TextS(
                                      "Product: ${record.product}",
                                    ),
                                    Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Rate: ${record.rate}",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20
                                            ),
                                          ),
                                          Text(
                                            "Quantity: ${record.quantity}",
                                            style:TextStyle(
                                                color: Colors.white,
                                                fontSize: 20
                                            ),
                                          ),
                                          SizedBox(
                                            width: 25,
                                          ),
                                        ]),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    TextS(
                                      "Total Amount: ${int.parse(record.quantity)*int.parse(record.rate)}",
                                    ),
                                    TextS(
                                      "Due Amount: ${(int.parse(record.quantity)*int.parse(record.rate))-int.parse(record.paidAmount)}",
                                    ),
                                    Row(
                                      children: [
                                        IconButton(
                                          onPressed: () {
                                            print("YES");
                                            customLaunch(
                                                "tel: +977 ${record.number}");
                                          },
                                          icon: Icon(Icons.phone),
                                          color: Colors.greenAccent,
                                        ),
                                        SizedBox(
                                          width: 25,
                                        ),
                                        IconButton(
                                          onPressed: () {
                                            customLaunch("sms: +977 ${record.number}");
                                          },
                                          icon: Icon(Icons.message_rounded),
                                          color: Colors.orangeAccent,
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Column(
                              children: [
                                GestureDetector(
                                    onTap: () {
                                      Navigator.push(context, MaterialPageRoute(builder: (context)=> EditScreen(documentId: data[position].id,
                                        record: record,

                                      )));
                                    }, child: Icon(Icons.edit)),
                                SizedBox(
                                  height: 25,
                                ),
                                GestureDetector(
                                    onTap: ()async {
                                      await _store.collection("creditors").doc(data[position].id).delete();
                                    }, child: Icon(Icons.delete)),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  itemCount: snapshot.data!.size,
                )
              : Container();
        });
  }
}

class TextS extends StatelessWidget {
  final String label;

  TextS(this.label);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          label,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20
          )),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
