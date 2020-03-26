import 'package:flutter/material.dart';
class Prevent extends StatefulWidget {
  Prevent({Key key}) : super(key: key);

  @override
  _PreventState createState() => _PreventState();
}

class _PreventState extends State<Prevent> {
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: new AppBar(
        title: Text('Prevention From Covid-19 Novel Corona Virus'),
        backgroundColor: Colors.redAccent,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
          child: RichText(
            textAlign: TextAlign.justify,
            text:TextSpan(
            style: TextStyle(fontSize: 17.0, color: Colors.black,),
              children: <TextSpan>[
               
                TextSpan(text: 'Although there is no vaccine available to prevent infection with the new coronavirus, you can take steps to reduce your risk of infection. WHO and CDC recommend following these precautions for avoiding COVID-19:'),
                TextSpan(text: '\n\n'),
                TextSpan(text: '* Avoid large events and mass gatherings.', style: TextStyle(color: Colors.red[900])),
                TextSpan(text: '\n\n'),
                TextSpan(text: '* Avoid close contact (about 6 feet) with anyone who is sick or has symptoms.', style: TextStyle(color: Colors.red[900])),
                TextSpan(text: '\n\n'),
                TextSpan(text: '* Keep distance between yourself and others if COVID-19 is spreading in your community, especially if you have a higher risk of serious illness.', style: TextStyle(color: Colors.red[900])),
                TextSpan(text: '\n\n'),
                TextSpan(text: '* Wash your hands often with soap and water for at least 20 seconds, or use an alcohol-based hand sanitizer that contains at least 60% alcohol.', style: TextStyle(color: Colors.red[900])),
                TextSpan(text: '\n\n'),
                TextSpan(text: '* Cover your mouth and nose with your elbow or a tissue when you cough or sneeze. Throw away the used tissue.', style: TextStyle(color: Colors.red[900])),
                TextSpan(text: '\n\n'),
                TextSpan(text: '* Avoid touching your eyes, nose and mouth if your hands aren\'t clean.', style: TextStyle(color: Colors.red[900])),
                TextSpan(text: '\n\n'),
                TextSpan(text: '* Avoid sharing dishes, glasses, bedding and other household items if you\'re sick.', style: TextStyle(color: Colors.red[900])),
                TextSpan(text: '\n\n'),
                TextSpan(text: '* Clean and disinfect surfaces you often touch on a daily basis', style: TextStyle(color: Colors.red[900])),
                TextSpan(text: '\n\n'),
                TextSpan(text: '* Stay home from work, school and public areas if you\'re sick, unless you\'re going to get medical care. Avoid taking public transportation if you\'re sick', style: TextStyle(color: Colors.red[900])),
                TextSpan(text: '\n\n'),
                TextSpan(text: '* Avoid eating raw or undercooked meat or animal organs.', style: TextStyle(color: Colors.red[900])),
                TextSpan(text: '\n\n'),
                TextSpan(text: '* Avoid contact with live animals and surfaces they may have touched if you\'re visiting live markets in areas that have recently had new coronavirus cases.', style: TextStyle(color: Colors.red[900]))
              ]
            )
          ),
      
      ),
    );
  }
}