import 'package:flutter/material.dart';
import 'package:teacher/home.dart';
import 'package:teacher/show_students.dart';
import 'package:teacher/sign_up.dart';
import 'add_student.dart';
import 'log_in.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';



Future main() async{

  sqfliteFfiInit();
  databaseFactory = databaseFactoryFfi;

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    routes: {
      '/':(context) => LogIn(),
      'register': (context) =>  SignUp(),
      'login': (context) =>  LogIn(),
      'home':(context) =>  Home(),
      'show':(context) =>  StudentListView(),
      'add':(context) =>  AddStudentPage(),
    },

  ));
}
