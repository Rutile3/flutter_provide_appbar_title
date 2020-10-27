import 'package:flutter/material.dart';

import 'page01.dart';

class Page02 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text('Page02'),
          RaisedButton(
            child: Text('To Page01'),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Page01()),
              );
            },
          ),
        ],
      ),
    );
  }
}
