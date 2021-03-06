import 'package:amazing_todo_app/enums/notifier_state.dart';
import 'package:amazing_todo_app/enums/snack_bar_options.dart';
import 'package:amazing_todo_app/providers/auth_model.dart';
import 'package:amazing_todo_app/providers/todo_category_provider.dart';
import 'package:amazing_todo_app/services/todo_category_service.dart';
import 'package:amazing_todo_app/widgets/pop_up_menu.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodoCategoryScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TodoCategoryScreenState();
}

class _TodoCategoryScreenState extends State<TodoCategoryScreen> {
  static const mainColor = const Color(0xffB8A081);
  final textControllerCategoryName = TextEditingController();
  final textControllerCategorySort = TextEditingController();

  TodoCategoryServiceMapper todoCategoriesService =
      TodoCategoryServiceMapper('/TodoCategories');

  //properties
  String _categoryName = "";
  String _categorySort = "";

  //Constructor
  _TodoCategoryScreenState() {
    textControllerCategoryName.addListener(_categoryNameListener);
    textControllerCategorySort.addListener(_categorySortListener);
  }

  //listeners for textcontrollers
  void _categoryNameListener() {
    if (textControllerCategoryName.text.isEmpty) {
      _categoryName = "";
    } else {
      _categoryName = textControllerCategoryName.text;
    }
  }

  void _categorySortListener() {
    if (textControllerCategorySort.text.isEmpty) {
      _categorySort = "";
    } else {
      _categorySort = textControllerCategorySort.text;
    }
  }

  @override
  void dispose() {
    textControllerCategoryName.dispose();
    textControllerCategorySort.dispose();
    super.dispose();
  }

  void _buttonAddObjectPressed() async {
    Provider.of<AuthModel>(context, listen: false).getToken().then(
          (jwt) => Provider.of<TodoCategoryProvider>(context, listen: false)
              .addTodoCategory(
            jwt,
            _categoryName,
            int.parse(_categorySort),
          ),
        );
  }

  void _buttonDeleteObjectPressed(int id) async {
    String jwt =
        await Provider.of<AuthModel>(context, listen: false).getToken();
    Provider.of<TodoCategoryProvider>(context, listen: false)
        .deleteTodoCateogry(jwt, id);
    Provider.of<TodoCategoryProvider>(context, listen: false)
        .getTodoCategories(jwt);
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
            _buildCategoryList(),
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
              controller: textControllerCategoryName,
              decoration: InputDecoration(
                labelText: "Category name",
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(15),
            child: TextFormField(
              controller: textControllerCategorySort,
              decoration: InputDecoration(
                labelText: "Sort priority",
              ),
              obscureText: true,
            ),
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
            child: Text("Add new category"),
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
    return Consumer<TodoCategoryProvider>(
        builder: (context, todocategorymodel, child) {
      if (todocategorymodel.state == NotifierState.initial) {
        return Container();
      } else if (todocategorymodel.state == NotifierState.loading) {
        return CircularProgressIndicator();
      } else {
        if (todocategorymodel.exception != null) {
          return Text(
            todocategorymodel.exception.toString(),
            style: Theme.of(context).textTheme.bodyText2,
            textAlign: TextAlign.center,
          );
        } else {
          return Text('Category added successfully');
        }
      }
    });
  }

  Widget _buildCategoryList() {
    Provider.of<AuthModel>(context, listen: false).getToken().then(
          (jwt) => Provider.of<TodoCategoryProvider>(context, listen: false)
              .getTodoCategories(
            jwt,
          ),
        );
    return Expanded(
      child: Consumer<TodoCategoryProvider>(
          builder: (context, todocategorymodel, child) {
        if (todocategorymodel.todoCategories.isNotEmpty) {
          return ListView.separated(
            itemCount: todocategorymodel.todoCategories.length,
            itemBuilder: (BuildContext context, int index) {
              return Slidable(
                actionPane: SlidableBehindActionPane(),
                child: ListTile(
                  title: Text(
                    todocategorymodel.todoCategories[index].todoCategoryName,
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
                        todocategorymodel.todoCategories[index].id),
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

  // deleteButtonTheme() {
  //   return ButtonStyle(
  //     backgroundColor:
  //   );
  // }

  // cancelButtonTheme() {
  //   return ButtonStyle(
  //     backgroundColor:
  //   );
  // }
}
