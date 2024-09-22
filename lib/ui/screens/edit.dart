import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebse/extracts/extracted.dart';
import 'package:firebse/model/record.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';

class EditScreen extends StatefulWidget {

  late final Record record;
  String documentId;
  EditScreen({required this.record,required this.documentId});

  @override
  _EditScreenState createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  DateTime _dateTime = DateTime.now();

  FirebaseFirestore _store = FirebaseFirestore.instance;
  late String creditorName;
  late String product;
  late String number;
  late String quantity;
  late String rate;
  late String paidAmount;
  late String date;

  @override
  void initState() {
    creditorName = widget.record.creditors;
    product =widget.record.product;
    number =widget.record.number;
    quantity =widget.record.quantity;
    rate =widget.record.rate;
    paidAmount =widget.record.paidAmount;


    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Screen",

        ),
      backgroundColor:    theme== ThemeData.dark()? Color(0xFF340406):Colors.lightBlueAccent,
      centerTitle: true,),




      body: Container(
        decoration: BoxDecoration(

          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                theme== ThemeData.dark()?Colors.black:Color(0xFFE3F2FD),


                theme== ThemeData.dark()? Color(0xffAF1319):Colors.lightBlueAccent,
              ]
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children:[
                Headings("Edit Creditors Details"),
                HintTextFields(
                  // label: 'Enter Name',
                    hint: widget.record.creditors,
                    onChange: (value){

                      creditorName = value;
                    }
                ),
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                      onTap: (){
                        showDatePicker(context: context,
                            initialDate:DateTime.now(),
                            firstDate: DateTime(2001),
                            lastDate: DateTime(2022))
                            .then((date){
                          setState(() {

                            _dateTime = date!;

                          });
                        });
                      },
                      child: Text("  📅",style: TextStyle(
                        fontSize: 35
                      ),)
                  ),

                ),
                Expanded(
                  flex: 5,
                  child:  HintTextFields(
                    // label: 'Enter Customer Number',
                      hint:  widget.record.number,
                      onChange: (value){
                        number = value;
                      }
                  ),
          ),


              ],
            ),




            HintTextFields(
                // label: 'Enter Product Name',
                hint: widget.record.product,
                onChange: (value){
                  product = value;
                }
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Row(
                children: [
                  Expanded(child: Text("Quantity",style:  TextStyle(
                    fontSize: 18,
                    color: theme == ThemeData.dark()?Colors.white : Colors.black,
                  ),)),
                  Expanded(child: Text("Rate:",style:  TextStyle(
                    fontSize: 18,
                    color: theme == ThemeData.dark()?Colors.white : Colors.black,
                  ),)),
                ],
              ),
            ),
            Row(
              children: [
                Expanded(

                  child: NumberFields(label: widget.record.quantity,
                      onChange: (value){
                        quantity = value;
                      }
                  ),
                ),

                Expanded(

                  child: NumberFields(label: widget.record.rate,
                      onChange: (value){
                        rate = value;
                      }
                  ),
                ),
              ],
            ),
              Text("Paid Amount :",style:  TextStyle(
                fontSize: 18,
                color: theme == ThemeData.dark()?Colors.white : Colors.black,
              ),),

            NumberFields(label: widget.record.paidAmount,
                onChange: (value){
                  paidAmount = value;
                }
            ),



            GestureDetector(child: Headings("Save"),
              onTap: ()async{


              await _store.collection("creditors").doc(widget.documentId).update({
                "date": _dateTime.toString(),
                "number": number,
                "rate": rate,
                "quantity": quantity,
                "paidAmount": paidAmount,
                "product": product,
                "creditorName": creditorName,
                "hasPaid": false

              });
              Navigator.pop(context);

              },

            ),
                SizedBox(height: 50,)


          ]
            ),
          ),
        ),
      ),

    );
  }
}
