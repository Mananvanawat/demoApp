import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'apiRequest.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ChangeNotifierProvider<ApiRequest>(
        child: MyHome(),
        create: (context) => ApiRequest(),
      ),
    );
  }
}

class MyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final apirequest = Provider.of<ApiRequest>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Demo App'),
      ),
      body: Container(
        child: FutureBuilder(
          future: apirequest.getData(),
          builder: (context, snapshot) {
            if (snapshot.data != null) {
              var snapData = snapshot.data;
              print(snapData);
              return ListView.builder(
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return Container(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 16,right: 16,top: 5),
                        child: Card(
                          elevation: 3,
                          child: Column(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Card(elevation: 5,child: Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Text(snapData['tags'][index]['displayName'],style: TextStyle(color: Colors.pink),),
                                    ),),
                                  ],
                                ),
                              )
                              ,Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(snapData['tags'][index]['description']),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  });
            } else
              return Container(
                child: Text("Loading"),
              );
          },
        ),
      ),
    );
  }
}
