import 'package:acaziatest/card.dart';
import 'package:acaziatest/model/data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tindercard/flutter_tindercard.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  Data _data;
  Future<Database> _database;

  @override
  void initState() {
    super.initState();
    _connectDatabase();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await _loadJson();
    });
  }

  _loadJson() async {
    String json = await DefaultAssetBundle.of(this.context)
        .loadString('assets/data.json');
    _data = dataFromJson(json);
    setState(() {});
  }

  _connectDatabase() async {
    _database = openDatabase(
      // Set the path to the database. Note: Using the `join` function from the
      // `path` package is best practice to ensure the path is correctly
      // constructed for each platform.
      join(await getDatabasesPath(), 'tinder_database.db'),
      // When the database is first created, create a table to store dogs.
      onCreate: (db, version) {
        return db.execute(
          "CREATE TABLE tinder(id INTEGER PRIMARY KEY, name TEXT, dob TEXT, phone TEXT, email TEXT, location TEXT)",
        );
      },
      // Set the version. This executes the onCreate function and provides a
      // path to perform database upgrades and downgrades.
      version: 1,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: _data == null
          ? Center(
              child: CircularProgressIndicator(strokeWidth: 1.0),
            )
          : Center(
              child: Container(
                height: MediaQuery.of(context).size.height * 0.6,
                child: TinderSwapCard(
                  orientation: AmassOrientation.BOTTOM,
                  totalNum: _data.results.length,
                  stackNum: 3,
                  swipeEdge: 4.0,
                  maxWidth: MediaQuery.of(context).size.width * 0.9,
                  maxHeight: MediaQuery.of(context).size.width,
                  minWidth: MediaQuery.of(context).size.width * 0.8,
                  minHeight: MediaQuery.of(context).size.width * 0.8,
                  cardBuilder: (context, index) => PeopleCard(
                    people: _data.results[index],
                  ),
                  swipeCompleteCallback:
                      (CardSwipeOrientation orientation, int index) async {
                    // Get orientation & index of swiped card!
                    if (orientation == CardSwipeOrientation.RIGHT) {
                      await _insertPeopleToDB(_data.results[index]);
                      Scaffold.of(context).showSnackBar(
                          SnackBar(content: Text('Added to favorite')));
                    }
                  },
                ),
              ),
            ),
    );
  }

  _insertPeopleToDB(People p) async {
    final Database db = await _database;
    await db.insert(
      'tinder',
      p.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  @override
  void dispose() async {
    (await _database).close();
    super.dispose();
  }
}
