import 'package:acaziatest/model/data.dart';
import 'package:flutter/material.dart';

const double _fontSize = 20.0;
const double _headerHeight = 150.0;
const double _avatarSize = 180.0;
const double _detailWidth = 300.0;
const double _detailHeight = 100.0;
const int _tabCount = 5;

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
  int _tabSelectedIndex = 0;
  TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = new TabController(vsync: this, length: _tabCount)
      ..addListener(() {
        setState(() {
          _tabSelectedIndex = _controller.index;
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        color: Colors.white,
        child: Stack(
          children: <Widget>[
            Container(
              color: Colors.black12,
              height: _headerHeight,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 10.0),
                Center(
                  child: Container(
                    width: _avatarSize,
                    height: _avatarSize,
                    padding: const EdgeInsets.all(4.0),
                    decoration: new BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.all(Radius.circular(_avatarSize / 2)),
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
                SizedBox(height: 15.0),
                Container(
                  width: _detailWidth,
                  height: _detailHeight,
                  child: DefaultTabController(
                    length: _tabCount,
                    child: Scaffold(
                      backgroundColor: Colors.transparent,
                      body: TabBarView(
                        physics: NeverScrollableScrollPhysics(),
                        controller: _controller,
                        children: [
                          Center(
                            child: Text(
                              "${widget.people.name.title} ${widget.people.name.first} ${widget.people.name.last}",
                              style: TextStyle(
                                fontSize: _fontSize,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Center(
                            child: Text(
                              widget.people.dob,
                              style: TextStyle(
                                fontSize: _fontSize,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Center(
                            child: Text(
                              "${widget.people.location.street}, ${widget.people.location.city}, ${widget.people.location.state}",
                              style: TextStyle(
                                fontSize: _fontSize,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Center(
                            child: Text(
                              "${widget.people.phone}\n${widget.people.cell}",
                              style: TextStyle(
                                fontSize: _fontSize,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Center(
                            child: Text(
                              widget.people.login.username,
                              style: TextStyle(
                                fontSize: _fontSize,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                      bottomNavigationBar: TabBar(
                        controller: _controller,
                        tabs: [
                          Tab(
                            icon: new Icon(
                              Icons.account_circle,
                              color: _tabSelectedIndex == 0
                                  ? Colors.green
                                  : Colors.grey,
                            ),
                          ),
                          Tab(
                            icon: new Icon(
                              Icons.calendar_today,
                              color: _tabSelectedIndex == 1
                                  ? Colors.green
                                  : Colors.grey,
                            ),
                          ),
                          Tab(
                            icon: new Icon(
                              Icons.map,
                              color: _tabSelectedIndex == 2
                                  ? Colors.green
                                  : Colors.grey,
                            ),
                          ),
                          Tab(
                            icon: new Icon(
                              Icons.call,
                              color: _tabSelectedIndex == 3
                                  ? Colors.green
                                  : Colors.grey,
                            ),
                          ),
                          Tab(
                            icon: new Icon(
                              Icons.lock_outline,
                              color: _tabSelectedIndex == 4
                                  ? Colors.green
                                  : Colors.grey,
                            ),
                          )
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

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
