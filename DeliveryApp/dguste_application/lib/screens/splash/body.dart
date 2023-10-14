import 'package:flutter/material.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
   return ListView.builder(
    
    itemCount: 20 ,
    itemBuilder: (context, index) {
      
      return  Container(height: 30, decoration: BoxDecoration(border: Border.all(color: Colors.black)));
      
    },);
  }
}