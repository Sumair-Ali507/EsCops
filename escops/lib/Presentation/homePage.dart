import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Homepage extends StatelessWidget {
  final List<Map<String, dynamic>> data =[
    {'title':'Cadbury Dairy Mil', 'Price': 15, 'qty':2},
    {'title':'Parle G Gluco Biscuit', 'Price': 20, 'qty':3},
    {'title':'Fresh Onion -1KG', 'Price': 150, 'qty':5},
    {'title':'Fresh Sweet Lime', 'Price': 25, 'qty':4},
    {'title':'Maggie', 'Price': 30, 'qty':4},
  ];

  final f= NumberFormat("\$###, ###.00" , "en_US");
  Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}
