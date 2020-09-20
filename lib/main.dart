import 'package:flutter/material.dart';
import 'package:flutter_provider/second_screen.dart';
import 'package:flutter_provider/utils/counter.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Counter>(
      create: (context) => Counter(0, false),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: MyHomePage(title: 'Provider Counter Example'),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    final counter = Provider.of<Counter>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '${counter.getCount()}',
              style: Theme.of(context).textTheme.headline4,
            ),
            Padding(
              padding: EdgeInsets.all(30),
            ),
            Container(
              child: IconButton(
                onPressed: () {
                  counter.setLike();
                },
                icon: Icon(
                  Icons.star,
                  color: counter.getLike() ? Colors.red : Colors.black,
                ),
              ),
            ),
            Container(
              child: FlatButton(
                child: Text('Second Page'),
                color: Colors.blue,
                textColor: Colors.white,
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute<Null>(
                    builder: (context) => SecondScreen(),
                  ));
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: counter.increase,
            tooltip: 'Increment',
            child: Icon(Icons.add),
            heroTag: null,
          ),
          Padding(
            padding: EdgeInsets.all(5),
          ),
          FloatingActionButton(
            onPressed: counter.decrease,
            tooltip: 'Decrement',
            child: Icon(Icons.remove),
            heroTag: null,
          ),
        ],
      ),
    );
  }
}
