import 'package:flutter/material.dart';
import 'package:task_dio/api/controller.dart';
import 'package:task_dio/api/model.dart';

class Data extends StatefulWidget {
  @override
  _DataState createState() => _DataState();
}

class _DataState extends State<Data> {
  List<Article> coningData = [];
  bool isLoading = true;

  void data() async {
    controller cont = controller();
    coningData = await cont.fetchData();
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.separated(
        physics: BouncingScrollPhysics(),
        separatorBuilder: (context, int) => Divider(),
        itemCount: coningData.length,
        itemBuilder: (context, index) {
          return Container(
              child: ListView.builder(
                  itemBuilder: (context, index) => Column(
                        children: [
                          Text(
                            'Birthday is:${coningData[index].birthDAy}',
                            style: TextStyle(color: Colors.purple),
                          ),
                          Text('NickName is :${(coningData[index].nickname)}'),
                          Text('portrayed:${(coningData[index].portrayed)}'),
                          Text(
                            'Status is:${coningData[index].status}',
                            style: TextStyle(color: Colors.red),
                          ),
                        ],
                      )));
        },
      ),
    );
  }
}
