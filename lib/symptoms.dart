import 'package:flutter/material.dart';

class Symptoms extends StatefulWidget {
  Symptoms({Key key}) : super(key: key);

  @override
  _SymptomsState createState() => _SymptomsState();
}

class _SymptomsState extends State<Symptoms> {
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: new AppBar(
        title: Text('Symptoms of Covid-19 Novel Corona Virus'),
        backgroundColor: Colors.redAccent,
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
          child: RichText(
            textAlign: TextAlign.justify,
            text:TextSpan(
            style: TextStyle(fontSize: 17.0, color: Colors.black,),
              children: <TextSpan>[
               
                TextSpan(text: 'Signs and symptoms of COVID-19 may appear two to 14 days after exposure and can include:'),
                TextSpan(text: '\n\n'),
                TextSpan(text: '* Fever', style: TextStyle(color: Colors.red[900])),
                TextSpan(text: '\n\n'),
                TextSpan(text: '* Cough', style: TextStyle(color: Colors.red[900])),
                TextSpan(text: '\n\n'),
                TextSpan(text: '* Shortness of breath or difficulty breathing', style: TextStyle(color: Colors.red[900])),
                TextSpan(text: '\n\n\n\n'),
                TextSpan(text: 'Other symptoms can include:'),
                TextSpan(text: '\n\n'),
                TextSpan(text: '* Tiredness', style: TextStyle(color: Colors.red[900])),
                TextSpan(text: '\n\n'),
                TextSpan(text: '* Aches', style: TextStyle(color: Colors.red[900])),
                TextSpan(text: '\n\n'),
                TextSpan(text: '* Runny Nose', style: TextStyle(color: Colors.red[900])),
                TextSpan(text: '\n\n'),
                TextSpan(text: '* Sore Throat', style: TextStyle(color: Colors.red[900])),
              ]
            )
          ),
      
      ),
    );
  }
}