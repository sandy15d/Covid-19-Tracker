

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
class WikipediaExplorer extends StatefulWidget {
  @override
  _WikipediaExplorerState createState() => _WikipediaExplorerState();
}

class _WikipediaExplorerState extends State<WikipediaExplorer> {
 


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wikipedia Explorer'),

        
      ),
      body: WebView(
        initialUrl: 'https://gisanddata.maps.arcgis.com/apps/Embed/index.html?webmap=14aa9e5660cf42b5b4b546dec6ceec7c&extent=77.3846,11.535,163.5174,52.8632&zoom=true&previewImage=false&scale=true&disable_scroll=true&theme=light',
        onWebViewCreated: (WebViewController webViewController) {
         
        },
      ),
    
    );
  }


}