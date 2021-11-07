import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:layout/screens/detail.dart';

import 'package:http/http.dart' as http;
import 'dart:async';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Covid Vaccine"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: FutureBuilder(
          builder: (context, AsyncSnapshot snapshot) {
         //   var data = json.decode(snapshot.data.toString());
            return ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return myBox(snapshot.data[index]['title'], snapshot.data[index]['subtitle'],
                    snapshot.data[index]['image_url'], snapshot.data[index]['details']);
              },
              itemCount: snapshot.data.length,
            );
          },
//          future: DefaultAssetBundle.of(context).loadString('assets/data.json'),
          future: getData(),
        ),
      ),
    );
  }

  Container myBox(
      String title, String subtitle, String image_url, String details) {
    var v1 = title;
    var v2 = subtitle;
    var v3 = image_url;
    var v4 = details;

    return Container(
      margin: EdgeInsets.only(top: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        image: DecorationImage(
            image: NetworkImage(image_url),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.6), BlendMode.darken)),
      ),
      height: 175,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                  fontSize: 25,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Text(
              subtitle,
              style: TextStyle(fontSize: 15, color: Colors.white),
            ),
            //SizedBox(height: 0.5),
            TextButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => DetailScreen(v1, v2, v3, v4)));
              },
              child: Text(
                'More Detail...',
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }

Future getData() async {
    // https://raw.githubusercontent.com/UncleEngineer/BasicAPI/main/data.json
    var url = Uri.https('raw.githubusercontent.com','/Wintech-thekop/Latout/master/assets/data.json');
    var response = await http.get(url);
    var result = json.decode(response.body);
    return result;
  }



}
