import 'package:amazing_todo_app/enums/notifier_state.dart';
import 'package:amazing_todo_app/providers/auth_model.dart';
import 'package:amazing_todo_app/providers/todo_category_provider.dart';
import 'package:amazing_todo_app/services/todo_category_service.dart';
import 'package:amazing_todo_app/widgets/pop_up_menu.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TodoCategoryScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TodoCategoryScreenState();
}

class _TodoCategoryScreenState extends State<TodoCategoryScreen> {
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
    return Consumer<TodoCategoryProvider>(
        builder: (context, todocategorymodel, child) {
      if (todocategorymodel.todoCategories.isNotEmpty) {
        return ListView.builder(
          itemBuilder: (BuildContext context, int index) {},
        );
      }
    });
  }
}
