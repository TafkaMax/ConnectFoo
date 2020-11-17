import 'package:amazing_todo_app/providers/todo_category_provider.dart';
import 'package:amazing_todo_app/providers/todo_task_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomFab extends StatefulWidget {
  final Function() onPressed;
  final String tooltip;
  final IconData icon;

  CustomFab({this.onPressed, this.tooltip, this.icon});

  @override
  State<StatefulWidget> createState() => _CustomFabState();
}

class _CustomFabState extends State<CustomFab>
    with SingleTickerProviderStateMixin {
  bool isOpened = false;
  AnimationController _animationController;

  Animation<Color> _buttonColor;
  Animation<double> _animateIcon;
  Animation<double> _translateButton;
  Curve _curve = Curves.fastOutSlowIn;
  double _fabHeight = 56.0;

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500))
          ..addListener(() {
            setState(() {});
          });
    _animateIcon =
        Tween<double>(begin: 0.0, end: 1.0).animate(_animationController);

    _translateButton = Tween<double>(begin: _fabHeight, end: -14.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Interval(0.0, 1, curve: _curve),
      ),
    );
    super.initState();
  }

  @override
  void didChangeDependencies() {
    _buttonColor = ColorTween(
            begin: Theme.of(context).floatingActionButtonTheme.backgroundColor,
            end: Colors.red)
        .animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Interval(
          0.0,
          1.0,
          curve: Curves.linear,
        ),
      ),
    );
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  animate() {
    if (!isOpened) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }
    isOpened = !isOpened;
  }

  Widget addCategory() {
    return Container(
      child: FloatingActionButton(
        heroTag: Text('Add Category'),
        onPressed: () {
          Navigator.pushNamed(context, '/categories').then(
            (value) => Provider.of<TodoCategoryProvider>(context, listen: false)
                .returnToPreviousPage(),
          );
        },
        tooltip: 'Add Category',
        child: Icon(
          Icons.category,
        ),
      ),
    );
  }

  Widget addPriority() {
    return Container(
      child: FloatingActionButton(
        heroTag: Text('Add Priority'),
        onPressed: () {
          Navigator.pushNamed(context, "/priorities");
        },
        tooltip: 'Add Priority',
        child: Icon(
          Icons.priority_high,
        ),
      ),
    );
  }

  Widget addTask() {
    return Container(
      child: FloatingActionButton(
        heroTag: Text('Add New Task'),
        onPressed: () {
          Navigator.pushNamed(context, '/todo').then(
            (value) => Provider.of<TodoTaskProvider>(context, listen: false)
                .returnToPreviousPage(),
          );
        },
        tooltip: 'Add New Task',
        child: Icon(
          Icons.create,
        ),
      ),
    );
  }

  Widget toggle() {
    return Container(
      child: FloatingActionButton(
        backgroundColor: _buttonColor.value,
        onPressed: animate,
        tooltip: 'Toggle',
        child: AnimatedIcon(
          icon: AnimatedIcons.menu_close,
          progress: _animateIcon,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Transform(
          transform: Matrix4.translationValues(
            0.0,
            _translateButton.value * 3,
            0.0,
          ),
          child: addCategory(),
        ),
        Transform(
          transform: Matrix4.translationValues(
            0.0,
            _translateButton.value * 2.0,
            0.0,
          ),
          child: addPriority(),
        ),
        Transform(
          transform: Matrix4.translationValues(
            0.0,
            _translateButton.value,
            0.0,
          ),
          child: addTask(),
        ),
        toggle(),
      ],
    );
  }
}
