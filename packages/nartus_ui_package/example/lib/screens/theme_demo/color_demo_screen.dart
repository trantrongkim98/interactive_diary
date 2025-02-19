import 'package:example/screens/theme_demo/shared_helper.dart';
import 'package:flutter/material.dart';

class ColorDemoScreen extends StatelessWidget {
  const ColorDemoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: const Text('Color demo'),
      ),
      body: ListView(
        children: [
          createColorDemo(
              'Background color', Theme.of(context).backgroundColor),
          createColorDemo(
              'bottomAppBarColor', Theme.of(context).bottomAppBarColor),
          createColorDemo('canvasColor', Theme.of(context).canvasColor),
          createColorDemo('cardColor', Theme.of(context).cardColor),
          createColorDemo(
              'dialogBackgroundColor', Theme.of(context).dialogBackgroundColor),
          createColorDemo('disabledColor', Theme.of(context).disabledColor),
          createColorDemo('dividerColor', Theme.of(context).dividerColor),
          createColorDemo('errorColor', Theme.of(context).errorColor),
          createColorDemo('focusColor', Theme.of(context).focusColor),
          createColorDemo('highlightColor', Theme.of(context).highlightColor),
          createColorDemo('hintColor', Theme.of(context).hintColor),
          createColorDemo('hoverColor', Theme.of(context).hoverColor),
          createColorDemo('indicatorColor', Theme.of(context).indicatorColor),
          createColorDemo('primaryColor', Theme.of(context).primaryColor),
          createColorDemo(
              'primaryColorDark', Theme.of(context).primaryColorDark),
          createColorDemo(
              'primaryColorLight', Theme.of(context).primaryColorLight),
          createColorDemo('Scaffold background color',
              Theme.of(context).scaffoldBackgroundColor),
          createColorDemo(
              'secondaryHeaderColor', Theme.of(context).secondaryHeaderColor),
          createColorDemo(
              'selectedRowColor', Theme.of(context).selectedRowColor),
          createColorDemo('shadowColor', Theme.of(context).shadowColor),
          createColorDemo('splashColor', Theme.of(context).splashColor),
          createColorDemo(
              'toggleableActiveColor', Theme.of(context).toggleableActiveColor),
          createColorDemo(
              'unselectedWidgetColor', Theme.of(context).unselectedWidgetColor),
        ],
      ));
}
