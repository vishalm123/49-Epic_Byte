import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class DnsScreen extends StatefulWidget {
  const DnsScreen({super.key});

  @override
  State<DnsScreen> createState() => _DnsScreenState();
}

class _DnsScreenState extends State<DnsScreen> {
   bool isapicalled = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Center(child: ElevatedButton(onPressed: ()async{
              final response = await get(Uri.parse("http://127.0.0.1:5000/dns"));
                setState(() {
                  isapicalled = true;
                });
                

            }, child: Text("Flush")),
            ),
            if(isapicalled)
                          Text("Flushed Successfully",style: TextStyle(fontWeight: FontWeight.bold),)

          ],
        ),
      ),
    );
  }
}