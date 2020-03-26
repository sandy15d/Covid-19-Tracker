import 'package:covid_19/about.dart';
import 'package:covid_19/country.dart';
import 'package:covid_19/prevnt.dart';
import 'package:covid_19/symptoms.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'dart:convert' show json;
import 'package:date_format/date_format.dart';


class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  // Animation animation;
  // AnimationController animationController;
  bool _isFetching = false;
  Map _allData;

  Future _fetchAllData() async {
    if (!_isFetching) {
      setState(() {
        _isFetching = true;
      });

      final response = await http.get("https://corona.lmao.ninja/all");
      if (response.statusCode == 200) {
        setState(() {
          _allData = json.decode(response.body);
          _isFetching = false;
        });
      } else {
        _scaffoldKey.currentState.showSnackBar(SnackBar(
          content: Text("Make sure you have internet connection.",
              style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.orange,
          action: SnackBarAction(
            textColor: Colors.white,
            label: "Try Again",
            onPressed: _fetchAllData,
          ),
        ));
      }
    }
  }

  _timestampToDate(ts) {
    var date = new DateTime.fromMillisecondsSinceEpoch(_allData["updated"]);
    var fd =
        formatDate(date, [MM, " ", dd, " ", yyyy, " ", HH, ":", nn, " ", am]);
    return fd;
  }

  @override
  void initState() {
    super.initState();
    _fetchAllData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(
          'Covid-19 Tracker',
          style: TextStyle(fontSize: 24),
        ),
        backgroundColor: Colors.redAccent,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: _fetchAllData,
          ),
        ],
      ),
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            new DrawerHeader(
              decoration: new BoxDecoration(
                  image: new DecorationImage(
                      image: new AssetImage('assets/images/bg.png'),
                      fit: BoxFit.fill)),
              child: null,
            ),
            new ListTile(
                title: new Text("Country Wise Detail",style: TextStyle(fontSize: 20, color: Colors.deepPurple),),
                trailing: new Icon(Icons.public),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Countries()),
                  );
                }),
                 new ListTile(
                title: new Text("About Covid-19",style: TextStyle(fontSize: 20, color: Colors.deepPurple),),
                trailing: new Icon(Icons.usb),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => About()),
                  );
                }),
                new ListTile(
                title: new Text("Covid-19 Symptoms",style: TextStyle(fontSize: 20, color: Colors.deepPurple),),
                trailing: new Icon(Icons.verified_user),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Symptoms()),
                  );
                }),
                new ListTile(
                title: new Text("Prevention from Covid-19",style: TextStyle(fontSize: 20, color: Colors.deepPurple),),
                trailing: new Icon(Icons.layers),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Prevent()),
                  );
                }),
          ],
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: _isFetching
            ? <Widget>[
                SizedBox(
                  height: 300,
                ),
                SizedBox(
                  child: CircularProgressIndicator(
                    strokeWidth: 10.0,
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
                  ),
                  height: 50.0,
                ),
              ]
            : <Widget>[
                Text(
                  "Covid-19 Around World",
                  style: Theme.of(context).textTheme.display1.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  _timestampToDate(_allData["recoverd"]),
                  style: Theme.of(context).textTheme.title.copyWith(
                        color: Colors.blueAccent,
                      ),
                ),
                const SizedBox(height: 16.0),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: _buildWikiCategory(
                          Icons.healing,
                          "Total Case",
                          Colors.redAccent.withOpacity(0.7),
                          _allData["cases"].toString()),
                    ),
                  ],
                ),
                const SizedBox(height: 16.0),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: _buildWikiCategory(
                          Icons.track_changes,
                          "Total Death",
                          Colors.blueAccent.withOpacity(0.7),
                          _allData["deaths"].toString()),
                    ),
                    const SizedBox(width: 16.0),
                    Expanded(
                      child: _buildWikiCategory(Icons.toys, "Recovered",
                          Colors.greenAccent, _allData["recovered"].toString()),
                    ),
                  ],
                ),
                 const SizedBox(height: 16.0),
                Row(
                  children: <Widget>[
                   Container(
                    
                     alignment: Alignment.center,
                     child: Image.asset('assets/images/prevent.jpg'),
                      width: 350,
                   )
                  ],
                ),
              ],
      ),
      bottomNavigationBar: Container(
        height: 40.0,
        color: Colors.white,
        child: Center(
          child: Text("Concept By: Sandeep Dewangan",
              style: TextStyle(fontSize: 17, color: Colors.blue)),
        ),
      ),
    );
  }

  @override
  void dispose() {
    //animationController.dispose();
    super.dispose();
  }

  Stack _buildWikiCategory(
      IconData icon, String label, Color color, String data) {
    return Stack(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.all(36.0),
          alignment: Alignment.centerRight,
          child: Opacity(
              opacity: 0.3,
              child: Icon(
                icon,
                size: 40,
                color: Colors.white,
              )),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(20.0),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                data,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
              const SizedBox(height: 32.0),
              Text(
                label,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
