import 'package:acaziatest/model/data.dart';
import 'package:flutter/material.dart';

class PeopleCard extends StatefulWidget {
  PeopleCard({Key key, this.people}) : super(key: key);

  final People people;

  @override
  _PeopleCardState createState() {
    return _PeopleCardState();
  }
}

class _PeopleCardState extends State<PeopleCard>
    with SingleTickerProviderStateMixin {
  int tabIndex = 1;

  TabController controller;

  @override
  void initState() {
    super.initState();
    controller = new TabController(vsync: this, length: 3);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        //height: 300.0,
        color: Colors.white,
        child: Stack(
          children: <Widget>[
            Container(
              color: Colors.black12,
              height: 150.0,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 20.0),
                Center(
                  child: Container(
                    width: 180.0,
                    height: 180.0,
                    padding: const EdgeInsets.all(6.0),
                    decoration: new BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(90.0)),
                      border: Border.all(
                        width: 1,
                        color: Colors.black38,
                        style: BorderStyle.solid,
                      ),
                    ),
                    child: Container(
                      decoration: new BoxDecoration(
                        shape: BoxShape.circle,
                        image: new DecorationImage(
                          fit: BoxFit.fill,
                          image: new NetworkImage(widget.people.picture.large),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30.0),
                Container(
                  width: 300,
                  height: 150,
                  child: DefaultTabController(
                    length: 3,
                    child: Scaffold(
                      backgroundColor: Colors.transparent,
                      body: TabBarView(
                        controller: controller,
                        children: [
                          Text("1"),
                          Text("2"),
                          Text("3"),
                        ],
                      ),
                      bottomNavigationBar: TabBar(
                        controller: controller,
                        tabs: [
                          Tab(
                              icon: new Icon(
                            Icons.home,
                            color: Colors.grey,
                          )),
                          Tab(
                              icon: new Icon(
                            Icons.rss_feed,
                            color: Colors.grey,
                          )),
                          Tab(
                              icon: new Icon(
                            Icons.settings,
                            color: Colors.grey,
                          ))
                        ],
                        indicatorSize: TabBarIndicatorSize.tab,
                        indicatorColor: Colors.green,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
