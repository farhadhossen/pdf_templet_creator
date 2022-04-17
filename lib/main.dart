import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

void main() {
  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      theme: ThemeData(
        hoverColor: Colors.red,

        cursorColor: Colors.orangeAccent,
        textSelectionHandleColor: Colors.orangeAccent,
        accentColor: Colors.orangeAccent,
        // colorScheme: Colors.orange,
        brightness: Brightness.light,
        primaryColor: Colors.green,

        splashColor: Colors.green,
        primaryColorDark: Colors.green,
        focusColor: Colors.green,
        shadowColor: Colors.green,
        canvasColor: Colors.green,
        // scaffoldBackgroundColor: Colors.green,
        bottomAppBarColor: Colors.green,
        cardColor: Colors.green,
        dividerColor: Colors.green,
        highlightColor: Colors.green,

        selectedRowColor: Colors.green,
        unselectedWidgetColor: Colors.green,
        disabledColor: Colors.green,
        secondaryHeaderColor: Colors.green,
        // backgroundColor: Colors.green,
        // dialogBackgroundColor: Colors.green,
        indicatorColor: Colors.green,
        hintColor: Colors.green,
        errorColor: Colors.green,
        toggleableActiveColor: Colors.green,
      ),
    ),
  );
}
