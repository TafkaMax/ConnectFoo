import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_demo/providers/counter_model.dart';
import 'package:provider_demo/screens/song_info_screen.dart';
import 'package:provider_demo/widgets/button_dec.dart';
import 'package:provider_demo/widgets/button_inc.dart';
import 'package:provider_demo/widgets/button_reset.dart';
import 'package:provider_demo/widgets/custom_dialog.dart';
import 'package:provider_demo/widgets/single_bit.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CounterModel>(
      create: (context) => CounterModel(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Counter'),
        ),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton(
                onPressed: () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => SongInfoScreen(),
                    ),
                  ),
                },
                child: Text('Navigate to song info'),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SingleBit(bitNo: 2),
                  SingleBit(bitNo: 1),
                  SingleBit(bitNo: 0),
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 20),
                      child: ButtonInc(),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 20),
                      child: ButtonDec(),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                child: ButtonReset(),
              ),
              CustomButton()
            ],
          ),
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        _navigateAndDisplayDialog(context);
      },
      child: Text('Launch dialog'),
    );
  }

  _navigateAndDisplayDialog(BuildContext context) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => CustomDialog(
          title: 'Dialog',
          label: 'Do you agree?',
          button1Label: 'Yes',
          button2Label: 'No',
        ),
      ),
    );

    // execution continues from here, when await resolves the Future from push
    Scaffold.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(SnackBar(
          content: Text(result == null ? 'nothing selected' : result)));
  }
}
