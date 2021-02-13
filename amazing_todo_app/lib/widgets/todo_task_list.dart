import 'package:amazing_todo_app/domain/todo_task.dart';
import 'package:amazing_todo_app/enums/date_enum.dart';
import 'package:amazing_todo_app/enums/icon_enum.dart';
import 'package:amazing_todo_app/providers/auth_model.dart';
import 'package:amazing_todo_app/providers/theme_data_provider.dart';
import 'package:amazing_todo_app/providers/todo_task_provider.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//TODO add option to add due date!
class TodoTaskList extends StatefulWidget {
  @override
  _TodoTaskListState createState() => _TodoTaskListState();
}

//Testing changes
class _TodoTaskListState extends State<TodoTaskList> {
  static const mainColor = const Color(0xffB8A081);

  List<TodoTask> _todoTaskList;

  List<TodoTask> get todoTaskList => _todoTaskList;
  void _setTodoTaskList(List<TodoTask> inputList) {
    _todoTaskList = inputList;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _setCurrentList();

    return Consumer<TodoTaskProvider>(
      builder: (BuildContext context, todotaskmodel, Widget child) {
        if (todotaskmodel.todoTasks.isNotEmpty) {
          // for (TodoTask todotask in todotaskmodel.todoTasks) {
          //   final GlobalKey<ExpansionTileCardState> testCard+todotask.id.toString() = new GlobalKey();
          // }

          return ListView.separated(
              itemBuilder: (BuildContext context, int index) {
                return ExpansionTileCard(
                  key: UniqueKey(),
                  leading: CircleAvatar(
                    foregroundColor:
                        Provider.of<ThemeDataProvider>(context, listen: false)
                                .isDarkTheme
                            ? mainColor
                            : Colors.brown,
                    backgroundColor:
                        Provider.of<ThemeDataProvider>(context, listen: false)
                                .isDarkTheme
                            ? Colors.brown
                            : mainColor,
                    child: _getCurrentIcon(
                      todotaskmodel.todoTasks[index],
                      IconStateEnum.Complete,
                    ),
                  ),
                  title: Text(
                    todotaskmodel.todoTasks[index].todoTaskName,
                    style: todotaskmodel.todoTasks[index].isCompleted
                        ? Theme.of(context).textTheme.headline5
                        : Theme.of(context).textTheme.bodyText2,
                  ),
                  subtitle: Text(
                    _getFormattedDateText(
                        todotaskmodel.todoTasks[index], DateType.DueDate),
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  children: [
                    Divider(
                      thickness: 1.0,
                      height: 1.0,
                    ),
                    CheckboxListTile(
                      title: Text(
                        "Complete this task!",
                        style: todotaskmodel.todoTasks[index].isCompleted
                            ? Theme.of(context).textTheme.headline5
                            : Theme.of(context).textTheme.bodyText2,
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _getFormattedDateText(
                              todotaskmodel.todoTasks[index],
                              DateType.DueDate,
                            ),
                            style: Theme.of(context).textTheme.headline6,
                          ),
                          Text(
                            _getFormattedDateText(
                              todotaskmodel.todoTasks[index],
                              DateType.CreatedDate,
                            ),
                            style: Theme.of(context).textTheme.headline6,
                          ),
                        ],
                      ),
                      secondary: _getCurrentIcon(todotaskmodel.todoTasks[index],
                          IconStateEnum.Complete),
                      isThreeLine: true,
                      onChanged: (bool value) {
                        setState(() {
                          todotaskmodel.todoTasks[index].isCompleted = value;
                          Provider.of<AuthModel>(context, listen: false)
                              .getToken()
                              .then(
                                (jwt) => Provider.of<TodoTaskProvider>(context,
                                        listen: false)
                                    .putTodoTask(
                                        jwt,
                                        todotaskmodel.todoTasks[index].id,
                                        todotaskmodel.todoTasks[index]),
                              );
                        });
                      },
                      value: todotaskmodel.todoTasks[index].isCompleted,
                      activeColor: mainColor,
                      checkColor: Colors.brown,
                    ),
                    CheckboxListTile(
                      title: Text(
                        "Archive this task!",
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                      secondary: _getCurrentIcon(todotaskmodel.todoTasks[index],
                          IconStateEnum.Archive),
                      onChanged: (bool value) {
                        setState(() {
                          todotaskmodel.todoTasks[index].isArchived = value;
                          Provider.of<AuthModel>(context, listen: false)
                              .getToken()
                              .then(
                                (jwt) => Provider.of<TodoTaskProvider>(context,
                                        listen: false)
                                    .putTodoTask(
                                        jwt,
                                        todotaskmodel.todoTasks[index].id,
                                        todotaskmodel.todoTasks[index]),
                              );
                        });
                      },
                      value: todotaskmodel.todoTasks[index].isArchived,
                      activeColor: mainColor,
                      checkColor: Colors.brown,
                    ),
                    ButtonBar(
                      alignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
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
                                    todotaskmodel.todoTasks[index].dueDT =
                                        dueDate;
                                    Provider.of<AuthModel>(context,
                                            listen: false)
                                        .getToken()
                                        .then(
                                          (jwt) =>
                                              Provider.of<TodoTaskProvider>(
                                                      context,
                                                      listen: false)
                                                  .putTodoTask(
                                                      jwt,
                                                      todotaskmodel
                                                          .todoTasks[index].id,
                                                      todotaskmodel
                                                          .todoTasks[index]),
                                        );
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
                        )
                      ],
                    ),
                  ],
                );
              },
              separatorBuilder: (BuildContext context, int index) => Divider(
                    color: mainColor,
                  ),
              itemCount: todotaskmodel.todoTasks.length);
        } else {
          return Text("No tasks, please add a new task!");
        }
      },
    );
  }

  void _setCurrentList() async {
    await Provider.of<AuthModel>(context, listen: false).getToken().then(
          (jwt) => Provider.of<TodoTaskProvider>(context, listen: false)
              .getTodoTasks(jwt),
        );

    List<TodoTask> todoTasks =
        Provider.of<TodoTaskProvider>(context, listen: false).todoTasks;

    _setTodoTaskList(todoTasks);
  }

  Widget _getCurrentIcon(TodoTask todoTask, IconStateEnum iconStateEnum) {
    if (iconStateEnum == IconStateEnum.Complete) {
      if (todoTask.isCompleted) {
        return Icon(
          Icons.check,
          color: Theme.of(context).accentColor,
        );
      } else {
        return Icon(
          Icons.priority_high,
          color: Theme.of(context).accentColor,
        );
      }
    } else {
      if (todoTask.isArchived) {
        return Icon(
          Icons.check,
          color: Theme.of(context).accentColor,
        );
      } else {
        return Icon(
          Icons.priority_high,
          color: Theme.of(context).accentColor,
        );
      }
    }
  }

  String _getFormattedDateText(TodoTask todoTask, DateType dateType) {
    if (dateType == DateType.CreatedDate) {
      return "Created on " +
          todoTask.createdDT.day.toString() +
          "." +
          todoTask.createdDT.month.toString() +
          "." +
          todoTask.createdDT.year.toString();
    } else if (dateType == DateType.DueDate) {
      if (todoTask.dueDT == null) {
        return "No due date set";
      } else {
        return "Due on: " +
            todoTask.dueDT.day.toString() +
            "." +
            todoTask.dueDT.month.toString() +
            "." +
            todoTask.dueDT.year.toString();
      }
    } else {
      return "Should not get this message";
    }
  }
}
