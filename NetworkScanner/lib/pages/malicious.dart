import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class MaliciousScreen extends StatefulWidget {
  const MaliciousScreen({super.key});

  @override
  State<MaliciousScreen> createState() => _OpenPortScreenState();
}

class _OpenPortScreenState extends State<MaliciousScreen> {
    TextEditingController userInput = TextEditingController(text: "");
  var malcious = "";
  var maliciousblock = "";
  var malcheck = "malicious";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
      ),
      body: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children:  <Widget>[SizedBox(height: 20,) ,Text("Enter the website url to check whether its secure or not",style:TextStyle(fontSize: 15,fontWeight: FontWeight.bold) ,), 
               
SizedBox(height: 20,),
             Padding(
             padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 10),
             child: Container(
              width: 250,
              height: 60,
               child: TextFormField(
                controller: userInput,
                 decoration: InputDecoration(
                prefixIcon: Icon(Icons.text_format_rounded),
                filled: true,
                fillColor: 
                     Colors.grey,
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(color: Colors.green.shade400, width: 2.0)),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color
                            : Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(3)),
                labelText: 'URL',
                labelStyle: TextStyle(
                    color: 
                         Colors.black),
                hintText: 'Enter Url',
                hintStyle: TextStyle(
                    color: Colors.black
              ),
            ),
            ),
                //controller: userInput,
                    // decoration: InputDecoration(
                    //   fillColor: Colors.grey,
                    //                 filled: true,

                    //   focusColor: Colors.grey,
                    
                    //   border: OutlineInputBorder(
                    //     borderSide: BorderSide.none,
                    //     borderRadius: BorderRadius.circular(50)
                    //   ),
                    // ),
                  ),
             ),
             SizedBox(height: 20,),
              ElevatedButton(onPressed: ()async{print(userInput.text);
              final website = userInput.text;
             final response = await post(Uri.parse("http://127.0.0.1:5000/mal"),
             body: {
                         "website": website,
                       });
malcious = response.body;
maliciousblock =
malcious.toString().split("threats").first;
print(maliciousblock);
setState(() {
  
});
                    //   print(malcious);
              }, child: Column(
                children: [
                  Text("Submit"),
                ],
              )),
              SizedBox(height: 20,),
              
Text(malcious),
              SizedBox(height: 20),
              if(maliciousblock.toLowerCase().contains(malcheck.toLowerCase()))
ElevatedButton(onPressed: ()async{             
  final response = await post(Uri.parse("http://127.0.0.1:5000/block"),body: {
    "website" : userInput.text
  });
}, child: Text("Block"))             
            
             
              ],
            ),
    );
  }
}