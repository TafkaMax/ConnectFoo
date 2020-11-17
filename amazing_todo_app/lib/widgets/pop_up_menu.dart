import 'package:amazing_todo_app/enums/settings.dart';
import 'package:amazing_todo_app/providers/auth_model.dart';
import 'package:amazing_todo_app/providers/theme_data_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Widget buildPopUpMenu(context) {
  return PopupMenuButton(
      onSelected: (action) => settingsAction(action, context),
      itemBuilder: (BuildContext context) {
        return Settings.values
            .map((setting) {
              return PopupMenuItem(
                value: setting,
                child: Row(
                  children: [
                    getIconForSetting(setting),
                    Text(
                      getSettingString(setting),
                    ),
                  ],
                ),
              );
            })
            .where((element) => isSettingAllowed(context, element.value))
            .toList();
      });
}

isSettingAllowed(BuildContext context, Settings value) {
  if (Provider.of<AuthModel>(context, listen: false).tokenKey == "") {
    return value == Settings.theme ? true : false;
  } else {
    return true;
  }
}

void settingsAction(Settings action, BuildContext context) {
  if (action == Settings.settings) {
    print('implement settings');
  } else if (action == Settings.logout) {
    logOut(context);
  } else if (action == Settings.theme) {
    Provider.of<ThemeDataProvider>(context, listen: false).toggleTheme();
  }
}

Icon getIconForSetting(Settings setting) {
  if (setting == Settings.settings) {
    return Icon(Icons.settings);
  } else if (setting == Settings.logout) {
    return Icon(Icons.logout);
  } else if (setting == Settings.theme) {
    return Icon(Icons.lightbulb);
  } else {
    return Icon(Icons.error);
  }
}

logOut(context) {
  Provider.of<AuthModel>(context, listen: false).deleteToken();
  // Navigator.popUntil(context, ModalRoute.withName(Navigator.defaultRouteName));
  // Navigator.pop(context);
  // Navigator.popAndPushNamed(context, '/');
  Navigator.popUntil(context, (route) => route.isFirst);
}
