import 'package:flutter/material.dart';
//import 'package:flutter/services.dart';

class About extends StatefulWidget {
  About({Key key}) : super(key: key);

  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  
  
  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: new AppBar(
        title: Text('About Covid-19 Novel Corona Virus'),
        backgroundColor: Colors.redAccent,
      ),
      body: SingleChildScrollView(

        padding: const EdgeInsets.all(20.0),
          child: RichText(
            textAlign: TextAlign.justify,
            text:TextSpan(
            style: TextStyle(fontSize: 17.0, color: Colors.black,),
              children: <TextSpan>[
                TextSpan(text: 'Coronaviruses (CoV)', style: TextStyle(fontSize: 18,color: Colors.redAccent)),
                TextSpan(text: ' are a large family of viruses that cause illness ranging from the common cold to more severe diseases such as Middle East Respiratory Syndrome (MERS-CoV) and Severe Acute Respiratory Syndrome (SARS-CoV).'),
                TextSpan(text: '\n\n'),
                TextSpan(text: 'Coronavirus disease (COVID-19)',style: TextStyle(fontSize: 18,color: Colors.blueAccent)),
                TextSpan(text: ' is a new strain that was discovered in 2019 and has not been previously identified in humans.'),
                TextSpan(text: '\n\n'),
                TextSpan(text: 'Coronaviruses are zoonotic, meaning they are transmitted between animals and people.  Detailed investigations found that SARS-CoV was transmitted from civet cats to humans and MERS-CoV from dromedary camels to humans. Several known coronaviruses are circulating in animals that have not yet infected humans. '),
                TextSpan(text: '\n\n'),
                TextSpan(text: 'Common signs of infection include respiratory symptoms, fever, cough, shortness of breath and breathing difficulties. In more severe cases, infection can cause pneumonia, severe acute respiratory syndrome, kidney failure and even death.'),
                TextSpan(text: '\n\n'),
                TextSpan(text: 'Standard recommendations to prevent infection spread include regular hand washing, covering mouth and nose when coughing and sneezing, thoroughly cooking meat and eggs. Avoid close contact with anyone showing symptoms of respiratory illness such as coughing and sneezing.')
              ]
            )
          ),

      ),
    );
  }
}