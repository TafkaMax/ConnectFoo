import 'package:amazing_todo_app/enums/notifier_state.dart';
import 'package:amazing_todo_app/enums/priority_enum.dart';
import 'package:amazing_todo_app/enums/snack_bar_options.dart';
import 'package:amazing_todo_app/providers/auth_model.dart';
import 'package:amazing_todo_app/providers/todo_priority_provider.dart';
import 'package:amazing_todo_app/widgets/pop_up_menu.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodoPriorityCreateScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TodoPriorityCreateScreen();
}

class _TodoPriorityCreateScreen extends State<TodoPriorityCreateScreen> {
  static const mainColor = const Color(0xffB8A081);
  final textControllerPriorityName = TextEditingController();

  //properties
  String _priorityName = "";
  String _priorityString = priorityString(PriorityEnum.NotUrgent);

  //Constructor
  _TodoPriorityCreateScreen() {
    textControllerPriorityName.addListener(_priorityNameListener);
  }

  //listeners for textcontrollers
  void _priorityNameListener() {
    if (textControllerPriorityName.text.isEmpty) {
      _priorityName = "";
    } else {
      _priorityName = textControllerPriorityName.text;
    }
  }

  @override
  void dispose() {
    textControllerPriorityName.dispose();

    super.dispose();
  }

  void _buttonAddObjectPressed() async {
    Provider.of<AuthModel>(context, listen: false).getToken().then(
          (jwt) => Provider.of<TodoPriorityProvider>(context, listen: false)
              .addTodoPriority(
            jwt,
            _priorityName,
            priorityEnumFromString(_priorityString).index,
          ),
        );
  }

  void _buttonDeleteObjectPressed(int id) async {
    String jwt =
        await Provider.of<AuthModel>(context, listen: false).getToken();
    Provider.of<TodoPriorityProvider>(context, listen: false)
        .deleteTodoPriority(jwt, id);
    Provider.of<TodoPriorityProvider>(context, listen: false)
        .getTodoPriorities(jwt);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Container(
        child: Column(
          children: [
            _buildTextFields(),
            _buildValidationField(),
            _buildButtons(),
            _buildPriorityList(),
          ],
        ),
      ),
    );
  }

  Widget _buildTextFields() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          style: BorderStyle.none,
        ),
      ),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.all(15),
            child: TextFormField(
              controller: textControllerPriorityName,
              decoration: InputDecoration(
                labelText: "Priority name",
              ),
            ),
          ),
          Divider(
            height: 1,
            thickness: 1,
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("Select priority for priority"),
                _buildPriorityDropDown(),
              ],
            ),
          ),
          Divider(
            height: 1,
            thickness: 1,
          ),
        ],
      ),
    );
  }

  Widget _buildButtons() {
    return Container(
      child: Column(
        children: [
          ElevatedButton(
            onPressed: _buttonAddObjectPressed,
            child: Text("Add new priority"),
          ),
        ],
      ),
    );
  }

  Widget _buildAppBar() {
    return AppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: ImageIcon(
              new AssetImage("assets/icons/to-do-list.png"),
            ),
          ),
          Text(
            "Add todo priority",
            style: Theme.of(context).appBarTheme.textTheme.headline1,
          ),
        ],
      ),
      actions: [buildPopUpMenu(context)],
    );
  }

  Widget _buildValidationField() {
    return Consumer<TodoPriorityProvider>(
        builder: (context, todoprioritymodel, child) {
      if (todoprioritymodel.state == NotifierState.initial) {
        return Container();
      } else if (todoprioritymodel.state == NotifierState.loading) {
        return CircularProgressIndicator();
      } else {
        if (todoprioritymodel.exception != null) {
          return Text(
            todoprioritymodel.exception.toString(),
            style: Theme.of(context).textTheme.bodyText2,
            textAlign: TextAlign.center,
          );
        } else {
          return Text('Priority added successfully');
        }
      }
    });
  }

  Widget _buildPriorityList() {
    Provider.of<AuthModel>(context, listen: false).getToken().then(
          (jwt) => Provider.of<TodoPriorityProvider>(context, listen: false)
              .getTodoPriorities(
            jwt,
          ),
        );
    return Expanded(
      child: Consumer<TodoPriorityProvider>(
          builder: (context, todoprioritymodel, child) {
        if (todoprioritymodel.todoPriorities.isNotEmpty) {
          return ListView.separated(
            itemCount: todoprioritymodel.todoPriorities.length,
            itemBuilder: (BuildContext context, int index) {
              return Slidable(
                actionPane: SlidableBehindActionPane(),
                child: ListTile(
                  title: Text(
                    todoprioritymodel.todoPriorities[index].todoPriorityName,
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
                actionExtentRatio: 0.25,
                secondaryActions: [
                  IconSlideAction(
                    caption: 'Delete',
                    color: Colors.red,
                    icon: Icons.delete,
                    onTap: () => _showSnackBar(context, SnackBarOptions.Delete,
                        todoprioritymodel.todoPriorities[index].id),
                  ),
                ],
              );
            },
            separatorBuilder: (BuildContext context, int index) => Divider(
              color: mainColor,
            ),
          );
        } else {
          return Text(
            'No todo categories exist, add a new one!',
            textAlign: TextAlign.center,
          );
        }
      }),
    );
  }

  void _showSnackBar(
      BuildContext context, SnackBarOptions snackBarOptions, int id) {
    Scaffold.of(context).showSnackBar(
      SnackBar(
        duration: Duration(seconds: 5),
        content: Text(
          "Are you sure you want to " +
              snackBarOptions.toString().split('.').last +
              "?",
        ),
        action: SnackBarAction(
          textColor: Colors.red,
          label: snackBarOptions.toString().split('.').last,
          onPressed: () => _buttonDeleteObjectPressed(id),
        ),
      ),
    );
  }

  Widget _buildPriorityDropDown() {
    return DropdownButton(
        value: _priorityString,
        items: PriorityEnum.values
            .map((priority) => DropdownMenuItem(
                  child: Text(
                    priorityString(priority),
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                  value: priorityString(priority),
                ))
            .toList(),
        onChanged: (priority) {
          setState(() {
            print(priority);
            _priorityString = priority;
          });
        });
  }
}
