import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomDialog extends StatelessWidget {
  final String title;
  final String label;
  final String button1Label;
  final String button2Label;

  const CustomDialog(
      {Key key, this.title, this.label, this.button1Label, this.button2Label})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(label),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context, button1Label);
                  },
                  child: Text(button1Label),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context, button2Label);
                  },
                  child: Text(button2Label),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
