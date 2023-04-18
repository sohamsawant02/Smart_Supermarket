import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TryTry extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
        title: Text('Tab bar'),
        ),
        body: Column(
          children: [
            TabBar(tabs:[
              Tab(
                icon: Icon(
                  Icons.account_balance
                ),
              ),
              Tab(
                icon: Icon(
                Icons.account_balance
                ),
              ),
              Tab(
                icon: Icon(
                    Icons.account_balance
                ),
              )
            ])
          ],
        ),
      ),
    );
  }
}
