import 'package:flutter/material.dart';

import 'page02.dart';

class Page01 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text('Page01'),
          RaisedButton(
            child: Text('To Page02'),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Page02()),
              );
            },
          ),
        ],
      ),
    );
  }
}
