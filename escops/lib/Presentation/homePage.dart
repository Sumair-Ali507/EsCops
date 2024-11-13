import 'package:escops/Presentation/print_page.dart';
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

  final f = NumberFormat("\$###,###.00", "en_US");
  Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    int _total =0;
    _total = data.map((e) => e['Price']* e['qty']).reduce(
        (value, element) => value + element
    );
    return Scaffold(
      appBar: AppBar(
        title: Text('Thermal-Printer'),
        backgroundColor: Colors.redAccent,
      ),

      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
                itemCount: data.length,
                itemBuilder: (c,i){
                  return ListTile(
                    title: Text(
                      data[i]['title'].toString(),
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      "${f.format(data[i]['Price'])} x ${data[i]['qty']}"
                    ),

                    trailing: Text(
                      f.format(
                        data[i]['Price'] * data[i]['qty'],
                      ),
                    ),
                  );
                },
              )
          ),

          Container(
            color: Colors.grey[200],
            padding: EdgeInsets.all(20.0),
            child: Row(
              children: [
                 Text(
                   "Total: ${f.format(_total)}",
                   style: TextStyle(
                     fontWeight: FontWeight.bold,

                   ),
                 ),

                SizedBox(width: 80,),
                Expanded(child: TextButton.icon(
                  onPressed: (){
                    Navigator.push(context,
                    MaterialPageRoute(builder: (_) => PrintPage(data),
                    ));

                  },
                  label: Text('Print'),
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.green,
                  ),
                  icon: Icon(Icons.print),
                )),

              ],
            ),
          )
        ],
      ),
    );
  }
}
