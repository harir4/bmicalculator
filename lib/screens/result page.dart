
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  final String result;
  final String status;
  final String interpret;

  ResultPage(
      {required this.result, required this.status, required this.interpret});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.blue.shade100,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment:MainAxisAlignment.center,
          children: [
            Center(child: Text('Your Result',style: TextStyle(fontSize: 35,fontWeight:FontWeight.bold))),
            SizedBox(height: 20),
            Container(
              color: Colors.blue.shade300,
              height: 300,
              width: MediaQuery.of(context).size.width,
              child:Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(status,style: TextStyle(fontSize: 25)),
                  SizedBox(height: 10),
                  Text(result,style: TextStyle(fontSize: 25)),
                  SizedBox(height: 10),

                  Text(interpret,style: TextStyle(fontSize: 15)),

                ],

              ),
            ),
            SizedBox(height: 100),

            SizedBox(width: 300,
              height: 100,
              child: ElevatedButton(style: ButtonStyle(backgroundColor:MaterialStatePropertyAll(Colors.blue.shade900,)),
                  onPressed: (){
                    Navigator.pop(context);
                  }, child:Text('Recalculate')),
            ),





          ],
        ),

      ),

    );
  }
}
