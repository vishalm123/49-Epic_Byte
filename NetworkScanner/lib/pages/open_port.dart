import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart';

class OpenPortScreen extends StatefulWidget {
  const OpenPortScreen({super.key});

  @override
  State<OpenPortScreen> createState() => _OpenPortScreenState();
}

class _OpenPortScreenState extends State<OpenPortScreen> {
  List port = [] ;
  var portno = "";
    TextEditingController userInput = TextEditingController(text: "");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
      ),
      body: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                
                children: [
                  SizedBox(height: 20,width: 20,),
                  Text("data"),
                  SizedBox(height: 20,),
                   ElevatedButton(onPressed: ()async{
                  print("Clicked");
             try {
               final response = 
             await get(Uri.parse("http://127.0.0.1:5000/api"));
              print("Response Got");
             print(response.body);
             final openport = jsonDecode(response.body);
             print(userInput);
            for (var element in openport) {
            
                print(element["port"]);
            
             }
            port = openport;
            setState(() {
            
            });
             } catch (e, s) {
 print(e);            
 print(s);            
             }
            } ,
             child:Text("Open Port"))
            ,SizedBox(height: 20,),
              if(port.isNotEmpty)
            SingleChildScrollView(
              child: Center(
                child: Column(children: [
                  // ...port.map((e) => Text("${e['foreign address']}")).toList(),
                  Table(
            border: TableBorder.symmetric(inside: BorderSide(width: 1, color: Colors.black), outside: BorderSide(width: 1)),
                columnWidths: {
                  0: FixedColumnWidth(100),
                  1: FixedColumnWidth(130),
                  2: FixedColumnWidth(130),
            
                  3: FixedColumnWidth(160),
            
                  4: FixedColumnWidth(80)
            
                },              children: [TableRow(
                      children: [Text("port",textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold),),Text("services",textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold),),
                      Text("state",textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold),),]
                    ),
                    ...port.map((e){
                      final tcpPort = e['port'];
                      return TableRow(
                      children: [
                        GestureDetector(onTap:()async{
                        final port =  tcpPort.toString().split("/").first;
                        print(port);
                        final response = await post(Uri.parse("http://127.0.0.1:5000/test"),body: {
                          "port": port,
                        });
                        print(response.body);
                        },
                         child: Text("${tcpPort}",textAlign: TextAlign.center,)),
                        Text("${e['service']}",textAlign: TextAlign.center,),
                                          Text("${e['state']}",textAlign: TextAlign.center,),
                                                           
            
            
                      ]
                    );
                    }).toList(),
                    
                    ],
                  )
                ]),
              ),
            )
                ],
              ));
  }
}