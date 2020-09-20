import 'package:flutter/material.dart';
import 'package:flutter_provider/utils/counter.dart';
import 'package:provider/provider.dart';

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final counter2 = Provider.of<Counter>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Page'),
      ),
      body: Center(
        child: Text('${counter2.getLike()}\n${counter2.getCount()}'),
      ),
    );
  }
}
