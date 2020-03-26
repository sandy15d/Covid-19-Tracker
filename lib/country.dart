import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'dart:convert' show json;

class Countries extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CountriesState();
}

class _CountriesState extends State<Countries> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  RefreshController _refreshController = RefreshController();
  bool _isFetching = false;
  List _countriesData;
  List _countriesDataSearched;

  List<Widget> buildList() {
    return List.generate(_countriesDataSearched.length, (i) =>
      InkWell(
        onTap: () => {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              // return object of type Dialog
              return AlertDialog(
                title: Text(" " + _countriesDataSearched[i]["country"], style: TextStyle( fontSize: 24, color: Colors.blue)),
                content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text("Total Cases: " + _countriesDataSearched[i]["cases"].toString(), style: TextStyle( fontSize: 20, color: Colors.blue)),
                      Text("Total Deaths: " + _countriesDataSearched[i]["deaths"].toString(), style: TextStyle( fontSize: 20, color: Colors.red)),
                      Text("Total Recoveries: " + _countriesDataSearched[i]["recovered"].toString(), style: TextStyle( fontSize: 20, color: Colors.green)),
                      SizedBox( height: 20.0 ),
                      Text("Cases Today: " + _countriesDataSearched[i]["todayCases"].toString(), style: TextStyle( fontSize: 20, color: Colors.blue)),
                      Text("Deaths Today: " + _countriesDataSearched[i]["todayDeaths"].toString(), style: TextStyle( fontSize: 20, color: Colors.red)),
                      SizedBox( height: 20.0 ),
                      Text("Active: " + _countriesDataSearched[i]["active"].toString(), style: TextStyle( fontSize: 20, color: Colors.blue)),
                      Text("Critical: " + _countriesDataSearched[i]["critical"].toString(), style: TextStyle( fontSize: 20, color: Colors.orange)),
                      SizedBox( height: 20.0 ),
                      Text("Cases Per One Million: " + _countriesDataSearched[i]["casesPerOneMillion"].toString(), style: TextStyle( fontSize: 20, color: Colors.blue)),
                    ],
                ),
                actions: <Widget>[
                  FlatButton(
                    child: Text("CLOSE", style: TextStyle( color: Colors.blue)),
                    onPressed: () { Navigator.of(context).pop(); },
                  ),
                ],
              );
            }
          )
        },
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Card(
            elevation: 2.0,
            child: Column(
              children: <Widget>[
                SizedBox( height: 10.0 ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween, //MainAxisAlignment.start
                    children: <Widget>[
                      Text(" " + _countriesDataSearched[i]["country"], style: TextStyle( fontSize: 24, color: Colors.redAccent)),
                      Text(_countriesDataSearched[i]["cases"].toString(), style: TextStyle( fontSize: 24, color: Colors.black)),
                    ],
                  ),
                ),
                SizedBox( height: 10.0 ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _fetchCountriesData() async {
    if (!_isFetching) {
      setState(() {
        _isFetching = true;
      });

      final response = await http.get("https://corona.lmao.ninja/countries");
      if (response.statusCode == 200) {
        setState(() {
          _countriesData = json.decode(response.body);
          _countriesDataSearched = json.decode(response.body);
          _isFetching = false;
        });
        _refreshController.refreshCompleted();
      } else {
        _scaffoldKey.currentState.showSnackBar(
          SnackBar(
            content: Text("Make sure you have internet connection.", style: TextStyle( color: Colors.white)),
            backgroundColor: Colors.orange,
            action: SnackBarAction(
              textColor: Colors.white,
              label: "Try Again",
              onPressed: _fetchCountriesData,
            ),
          )
        );
      }
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchCountriesData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: TextField(
          decoration: InputDecoration(
            hintText: "Search",
            hintStyle: TextStyle( fontSize: 20, color: Colors.white),
            suffixIcon: Icon(Icons.search, color: Colors.white)
          ),
          style: TextStyle(
            
            fontSize: 20,
            color: Colors.white,
          ),
          onChanged: (text){
            text = text.toLowerCase();
            if (text == "") {
              setState(() { _countriesDataSearched = _countriesData; });
            } else {
              setState(() {
                _countriesDataSearched = _countriesDataSearched.where((country) {
                  return country["country"].toLowerCase().contains(text);
                }).toList();
              });
            }
          }
        ),
      ),
      body: _isFetching ?
        Container(
          child: Center(
            child: SizedBox(
              child: CircularProgressIndicator(
                strokeWidth: 10.0,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
              ),
              height: 100.0, width: 100.0,
            ),
          ),
        )
      :
        SmartRefresher(
          controller: _refreshController,
          enablePullDown: true,
          onRefresh: _fetchCountriesData,
          child: CustomScrollView(
            slivers: [SliverList(delegate: SliverChildListDelegate(buildList()))],
          ),
        ),
    );
    
  }
   @override
  void dispose() {
    super.dispose();
  }
}