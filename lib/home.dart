import 'package:acaziatest/card.dart';
import 'package:acaziatest/model/data.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  Data data;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await loadJson();
    });
  }

  loadJson() async {
    String json =
        await DefaultAssetBundle.of(context).loadString('assets/data.json');
    data = dataFromJson(json);
  }

  @override
  Widget build(BuildContext context) {
    return data == null
        ? Center(
            child: CircularProgressIndicator(),
          )
        : PeopleCard(
            people: data.results[0],
          );
  }
}
