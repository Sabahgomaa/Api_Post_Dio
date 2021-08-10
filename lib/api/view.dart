import 'package:flutter/material.dart';
import 'package:task_dio/api/controller.dart';
import 'package:task_dio/api/model.dart';

import '../data.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Article> comingData = [];
  bool isLoading = true;

  void data() async {
    controller cont = controller();
    comingData = await cont.fetchData();
    setState(() {
      // data();
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: comingData.length,
              itemBuilder: (context, index) {
                return InkWell(
                    onTap: () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => Data()));
                    },
                    child: Column(
                      children: [
                        Image.network(comingData[index].image),
                        Text(comingData[index].name),
                      ],
                    ));
              },
            ),
    );
  }
}
