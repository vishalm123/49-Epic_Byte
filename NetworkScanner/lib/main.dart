import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_projec1/pages/dns.dart';
import 'package:flutter_projec1/pages/malicious.dart';
import 'package:flutter_projec1/pages/open_port.dart';
import 'package:http/http.dart';
import 'package:window_manager/window_manager.dart';

void main() async {

  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Epic Bytes',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(
        title: 'EPIC BYTES',
      ),
    );
  }
}


class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List port = [] ;
  var portno = "";
  var malcious = "";
  var maliciousblock = "";
  var malcheck = "malicious";
    TextEditingController userInput = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
         actions: <Widget>[SizedBox(width: 20,),
    IconButton(
      icon: Icon(
        Icons.group,
        color: Colors.white,size: 30,
      ),
      onPressed: () {
showDialog(
            context: context,
            builder: (context) {
              return Dialog(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
                elevation: 16,
                child: Container(
                  child: ListView(
                    shrinkWrap: true,
                    children: <Widget>[
                      SizedBox(height: 20),
                      Center(child: Text('Leaderboard')),
                      SizedBox(height: 20),
                      // _buildRow('assets/user.png', 'Vishal', 1000),
                      // _buildRow('assets/user.png', 'John', 2000),
                      // _buildRow('assets/user.png', 'Hardik', 3000),
                      // _buildRow('assets/user.png', 'Nesan', 4000),
                    ],
                  ),
                ),
              );      },
    );
    
  }),
     SizedBox(width: 20,),
    IconButton(
      icon: Icon(
        Icons.settings,
        color: Colors.white,
      ),
      onPressed: () {
        // do something
      },
    ),
       SizedBox(width: 20,),

  ],
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => OpenPortScreen()));
              },
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.red[400],
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Center(child: Text("Open Port")),
              ),
            ),
            GestureDetector(
              onTap: (){
      
                Navigator.push(context, MaterialPageRoute(builder: (context) => MaliciousScreen()));
              },
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.green[400],
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Center(child: Text("Malcious")),
              ),
            ),
            GestureDetector(
              onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => DnsScreen()));

              },
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.yellow[400],
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Center(child: Text("DNS")),
              ),
            ),
          ],
        ),
      ),
//       body: Container(
//         child: Row(
//           children: [
//             Column(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children:  <Widget>[SizedBox(height: 20,) ,Text("Enter the website url to check whether its secure or not",style:TextStyle(fontSize: 15,fontWeight: FontWeight.bold) ,), 
               
// SizedBox(height: 20,),
//              Padding(
//              padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 10),
//              child: Container(
//               width: 250,
//               height: 45,
//                child: TextFormField(
//                 controller: userInput,
//                  decoration: InputDecoration(
//                 prefixIcon: Icon(Icons.text_format_rounded),
//                 filled: true,
//                 fillColor: 
//                      Colors.grey,
//                 focusedBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(5),
//                     borderSide: BorderSide(color: Colors.green.shade400, width: 2.0)),
//                 border:
//                     OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
//                 enabledBorder: OutlineInputBorder(
//                     borderSide: BorderSide(
//                         color
//                             : Colors.grey.shade300),
//                     borderRadius: BorderRadius.circular(3)),
//                 labelText: 'URL',
//                 labelStyle: TextStyle(
//                     color: 
//                          Colors.black),
//                 hintText: 'Enter Url',
//                 hintStyle: TextStyle(
//                     color: Colors.black
//               ),
//             ),
//             ),
//                 //controller: userInput,
//                     // decoration: InputDecoration(
//                     //   fillColor: Colors.grey,
//                     //                 filled: true,

//                     //   focusColor: Colors.grey,
                    
//                     //   border: OutlineInputBorder(
//                     //     borderSide: BorderSide.none,
//                     //     borderRadius: BorderRadius.circular(50)
//                     //   ),
//                     // ),
//                   ),
//              ),
//              SizedBox(height: 20,),
//               ElevatedButton(onPressed: ()async{print(userInput.text);
//               final website = userInput.text;
//              final response = await post(Uri.parse("http://127.0.0.1:5000/mal"),
//              body: {
//                          "website": website,
//                        });
// malcious = response.body;
// maliciousblock =
// malcious.toString().split("threats").first;
// print(maliciousblock);
// setState(() {
  
// });
//                     //   print(malcious);
//               }, child: Column(
//                 children: [
//                   Text("Submit"),
//                 ],
//               )),
//               SizedBox(height: 20,),
              
// Text(malcious),
//               SizedBox(height: 20),
//               if(maliciousblock.toLowerCase().contains(malcheck.toLowerCase()))
// ElevatedButton(onPressed: (){}, child: Text("Block"))             
            
             
//               ],
//             ),
//             Container(
//               width: MediaQuery.of(context).size.width * 0.5,
              
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
                
//                 children: [
//                   SizedBox(height: 20,width: 20,),
//                   Text("data"),
//                   SizedBox(height: 20,),
//                    ElevatedButton(onPressed: ()async{
//                   print("Clicked");
//              try {
//                final response = 
//              await get(Uri.parse("http://127.0.0.1:5000/api"));
//               print("Response Got");
//              print(response.body);
//              final openport = jsonDecode(response.body);
//              print(userInput);
//             for (var element in openport) {
            
//                 print(element["port"]);
            
//              }
//             port = openport;
//             setState(() {
            
//             });
//              } catch (e, s) {
//  print(e);            
//  print(s);            
//              }
//             } ,
//              child:Text("Open Port"))
//             ,SizedBox(height: 20,),
//               if(port.isNotEmpty)
//             SingleChildScrollView(
//               child: Center(
//                 child: Column(children: [
//                   // ...port.map((e) => Text("${e['foreign address']}")).toList(),
//                   Table(
//             border: TableBorder.symmetric(inside: BorderSide(width: 1, color: Colors.black), outside: BorderSide(width: 1)),
//                 columnWidths: {
//                   0: FixedColumnWidth(100),
//                   1: FixedColumnWidth(130),
//                   2: FixedColumnWidth(130),
            
//                   3: FixedColumnWidth(160),
            
//                   4: FixedColumnWidth(80)
            
//                 },              children: [TableRow(
//                       children: [Text("port",textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold),),Text("services",textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold),),
//                       Text("state",textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold),),]
//                     ),
//                     ...port.map((e){
//                       final tcpPort = e['port'];
//                       return TableRow(
//                       children: [
//                         GestureDetector(onTap:()async{
//                         final port =  tcpPort.toString().split("/").first;
//                         print(port);
//                         final response = await post(Uri.parse("http://127.0.0.1:5000/test"),body: {
//                           "port": port,
//                         });
//                         print(response.body);
//                         },
//                          child: Text("${tcpPort}",textAlign: TextAlign.center,)),
//                         Text("${e['service']}",textAlign: TextAlign.center,),
//                                           Text("${e['state']}",textAlign: TextAlign.center,),
                                                           
            
            
//                       ]
//                     );
//                     }).toList(),
                    
//                     ],
//                   )
//                 ]),
//               ),
//             )
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
      
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,

      floatingActionButton: FloatingActionButton.extended(
          backgroundColor: Colors.green[700],
          onPressed: () {},
          tooltip: "Scan",
          label: Row(
            children: const [Text("Scan"), Icon(Icons.scanner)],
          ),
          hoverColor: Colors.green[900],
          highlightElevation: 50,
          hoverElevation:
              50), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

// Widget _buildRow(String imageAsset, String name, double score) {
//   return Padding(
//     padding: const EdgeInsets.symmetric(horizontal: 2.50,vertical: 2.50),
//     child: Container(
//       width: 5,
//       child: Column(
//         children: <Widget>[
//           SizedBox(height: 12),
//           Container(height: 2, color: Colors.redAccent),
//           SizedBox(height: 12),
//           Row(
//             children: <Widget>[
//               CircleAvatar(backgroundImage: AssetImage(imageAsset)),
//               SizedBox(width: 12),
//               Text(name),
//               Spacer(),
//               Container(
//                 decoration: BoxDecoration(color: Colors.yellow[900], borderRadius: BorderRadius.circular(20)),
//                 padding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
//                 child: Text('$score'),
//               ),
//             ],
//           ),
//         ],
//       ),
//     ),
//   );
// }