import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebse/extracts/extracted.dart';
import 'package:firebse/model/record.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';

class Group extends StatefulWidget {

  final Function()? onTap;
  final Function(String)? onChangeName;
  final Function(String)? onChangeProduct;
  final Function(String)? onChangeNum;
  final Function(String)? onChangeQuantity;
  final Function(String)? onChangeRate;
  final Function(String)? onChangePaidAmount;
  final Function()? onChangeDate;



  Group({this.onChangeDate,this.onTap, this.onChangeName,this.onChangeNum,this.onChangePaidAmount,this.onChangeProduct,this.onChangeQuantity,this.onChangeRate});

  @override
  _GroupState createState() => _GroupState();
}

class _GroupState extends State<Group> {
  FirebaseFirestore _store = FirebaseFirestore.instance;
  late DateTime _dateTime = DateTime.now() ;







  @override
  Widget build(BuildContext context) {
    // Headings("Enter Creditors Name");
    return SingleChildScrollView(


    child: Column(
          children:[
            // Headings("Enter Creditors Details"),
            TextFields(label: 'Enter Name',
            onChange: widget.onChangeName
          ),


            Row(
              children: [
                GestureDetector(
                  child: Text(" 📅",style: TextStyle(
                      fontSize: 35
                  ),),
                  onTap: widget.onChangeDate,

                ),

                Expanded(

                  child: TextFields(label: 'Enter Customer Number',
                      onChange: widget.onChangeNum
                  ),
                ),
              ],
            ),

            TextFields(label: 'Enter Product Name',
                onChange: widget.onChangeProduct
            ),
           Row(
             children: [
               Expanded(

                 child: NumberFields(label: 'Enter Quantity',
                     onChange: widget.onChangeQuantity
                 ),
               ),

               Expanded(

                 child: NumberFields(label: 'Enter Rate',
                     onChange: widget.onChangeRate
                 ),
               ),
             ],
           ),

            NumberFields(label: 'Enter Paid Amount',
                onChange: widget.onChangePaidAmount
            ),
            // Text(_dateTime== null?"Date: ":"Date Time ${_dateTime.toString()}",style: ksubheaders,),




            GestureDetector(child: Headings("Add"),
            onTap: widget.onTap
            ),
            SizedBox(height: 50,),

        ]
          ),


    );



  }
}
