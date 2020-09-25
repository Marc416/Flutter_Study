//import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:flutter/material.dart';
//
//class DocumentView extends StatelessWidget {
//  final DocumentSnapshot documentData;
//
//  DocumentView(this.documentData);
//
//  @override
//  Widget build(BuildContext context) {
//    return Padding(
//      padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 46.0),
//      child: Container(
//          decoration: BoxDecoration(
//            border: Border.all(color: Colors.grey),
//            borderRadius: BorderRadius.circular(5.0),
//          ),
//          child: ListTile(
//            title: Text(documentData.get('title')),
//            subtitle: Row(
//              children: <Widget>[
//                Text(documentData.get('price').toString()),
//                SizedBox(width: 10, height: 10,),
//                Text(documentData.get('purchase?').toString()),
//              ],
//            ),
//          )),
//    );
//  }
//}
