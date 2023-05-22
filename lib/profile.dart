import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:teacher/database_helper.dart';
import 'package:teacher/log_in.dart';


 int? levelOneStudents = 100;
 int? levelTwoStudents = 100;
 int? levelThreeStudents = 100;

 String? accountOwner = loggedInUser;

class TeacherProfilePage extends StatefulWidget {
  @override
  _TeacherProfilePageState createState() => _TeacherProfilePageState();
}

class _TeacherProfilePageState extends State<TeacherProfilePage> {
  DatabaseHelper databaseHelper = DatabaseHelper();

  @override
  void initState() {
    super.initState();

    // Future<List<Map<String, dynamic>>?> resultLevelOne =  databaseHelper.getAllLevel1();
    // if(resultLevelOne != null){
    //   print(resultLevelOne);
    // }
  }

  @override
  Widget build(BuildContext context) {
    int totalStudents = levelOneStudents! + levelTwoStudents! + levelThreeStudents!;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              const SizedBox(height:16),
              const CircleAvatar(
                radius: 100,
                backgroundImage: AssetImage('assets/profile-image.png'),
              ),
              const SizedBox(height: 20),
               Text(
                "$accountOwner",
                style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  const Icon(Icons.people),
                  const SizedBox(width: 10),
                  Text(
                    "Level 1: ${levelOneStudents} Student",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                        color: Colors.grey[600]),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  const Icon(Icons.people),
                  const SizedBox(width: 10),
                  Text(
                    "Level 2: ${levelTwoStudents} Student",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                        color: Colors.grey[600]),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  const Icon(Icons.people),
                  const SizedBox(width: 10),
                  Text(
                    "Level 3: ${levelThreeStudents} Student",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                        color: Colors.grey[600]),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  const Icon(Icons.people),
                  const SizedBox(width: 10),
                  Text(
                    "Total Students: ${totalStudents} Student",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                        color: Colors.grey[600]),
                  ),
                ],
              ),
              const SizedBox(
                height: 64,
              ),

              MaterialButton(
                color: Colors.deepOrange,
                onPressed: (){
                  Navigator.pushReplacementNamed(context, 'login');
              },child: const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text("Log out" , style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),),
              ),)
            ],
          ),
        )
        ,
      ),
    );
  }
}
