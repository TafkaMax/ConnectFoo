import 'package:amazing_todo_app/enums/notifier_state.dart';
import 'package:amazing_todo_app/enums/priority_enum.dart';
import 'package:amazing_todo_app/providers/auth_model.dart';
import 'package:amazing_todo_app/providers/todo_task_provider.dart';
import 'package:amazing_todo_app/widgets/pop_up_menu.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//TODO add due date option for creating new object!
class TodoTaskCreateScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TodoTaskCreateScreenState();
}

class _TodoTaskCreateScreenState extends State<TodoTaskCreateScreen> {
  static const mainColor = const Color(0xffB8A081);
  final textControllerTodoTaskName = TextEditingController();

  //properties
  String _todoTaskName = "";
  String _todoTaskSort = "";
  String _priorityString = priorityString(PriorityEnum.NotUrgent);
  DateTime _dueDate;

  //Constructor
  _TodoTaskCreateScreenState() {
    textControllerTodoTaskName.addListener(_todoTaskNameListener);
  }

  //listeners for textcontrollers
  void _todoTaskNameListener() {
    if (textControllerTodoTaskName.text.isEmpty) {
      _todoTaskName = "";
    } else {
      _todoTaskName = textControllerTodoTaskName.text;
    }
  }

  @override
  void dispose() {
    textControllerTodoTaskName.dispose();
    super.dispose();
  }

  void _buttonAddObjectPressed() async {
    Provider.of<AuthModel>(context, listen: false).getToken().then(
          (jwt) => Provider.of<TodoTaskProvider>(context, listen: false)
              .addTodoTask(jwt, _todoTaskName,
                  priorityEnumFromString(_priorityString).index, _dueDate),
        );
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
              controller: textControllerTodoTaskName,
              decoration: InputDecoration(
                labelText: "Todo task name",
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
                Text("Select task priority"),
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

  Widget _buildDatePicker() {
    return TextButton(
      onPressed: () {
        showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime.now(),
          lastDate: DateTime(2100),
        ).then(
          (dueDate) => {
            setState(() {
              if (dueDate != null) {
                _dueDate = dueDate;
              }
            })
          },
        );
      },
      child: Text(
        "Add due date!",
        style: TextStyle(
          fontSize: 20,
          color: Colors.brown,
        ),
      ),
    );
  }

  Widget _buildButtons() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 16),
      child: Column(
        children: [
          _buildDatePicker(),
          ElevatedButton(
            onPressed: _buttonAddObjectPressed,
            child: Text("Add new task"),
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
            "Add todo category",
            style: Theme.of(context).appBarTheme.textTheme.headline1,
          ),
        ],
      ),
      actions: [buildPopUpMenu(context)],
    );
  }

  Widget _buildValidationField() {
    return Consumer<TodoTaskProvider>(builder: (context, todomodel, child) {
      if (todomodel.state == NotifierState.initial) {
        return Container();
      } else if (todomodel.state == NotifierState.loading) {
        return CircularProgressIndicator();
      } else {
        if (todomodel.exception != null) {
          return Text(
            todomodel.exception.toString(),
            style: Theme.of(context).textTheme.bodyText2,
            textAlign: TextAlign.center,
          );
        } else {
          return Text('Todo added successfully');
        }
      }
    });
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
