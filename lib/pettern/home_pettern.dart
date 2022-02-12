import 'package:flutter/material.dart';
import 'package:lock_app/pettern/chek_pettern.dart';
import 'package:lock_app/pettern/set_pettern.dart';
import 'package:lock_app/pettern/util.dart';

class PetternHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pattern Lock Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      routes: {
        "/check_pattern": (BuildContext context) => CheckPattern(),
        "/set_pattern": (BuildContext context) => SetPattern(),
      },
      home: Scaffold(
        appBar: AppBar(
          title: Text("Pattern Lock Demo"),
        ),
        body: HomeWidget(),
      ),
    );
  }
}

class HomeWidget extends StatefulWidget {
  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  List<int>? pattern;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'This is demo of "Pattern Lock"',
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 24),
          MaterialButton(
            color: Colors.lightGreen,
            child: Text("Set Pattern", style: TextStyle(color: Colors.white)),
            onPressed: () async {
              final result = await Navigator.pushNamed(context, "/set_pattern");
              if (result is List<int>) {
                context.replaceSnackbar(
                  content: Text("pattern is $result"),
                );
                setState(() {
                  pattern = result;
                });
              }
            },
          ),
          if (pattern != null) ...[
            SizedBox(height: 16),
            MaterialButton(
              color: Colors.green,
              child:
                  Text("Check Pattern", style: TextStyle(color: Colors.white)),
              onPressed: () async {
                final result = await Navigator.pushNamed(
                  context,
                  "/check_pattern",
                  arguments: pattern,
                );
                if (result == true) {
                  context.replaceSnackbar(
                    content: Text(
                      "it's correct",
                      style: TextStyle(color: Colors.green),
                    ),
                  );
                }
              },
            ),
          ],
          SizedBox(height: 24),
        ],
      ),
    );
  }
}
