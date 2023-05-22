import 'package:flutter/material.dart';
import 'package:teacher/database_helper.dart';
import 'package:teacher/home_content.dart';
import 'package:teacher/profile.dart';

class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  DatabaseHelper databaseHelper = DatabaseHelper();

  int selectedIndex = 0;
  List contentPages = [
    HomeContent(),
    TeacherProfilePage(),
    ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Teacher App'),
        centerTitle: true,
        backgroundColor: Colors.orange[800],
        elevation: 30.0,
      ),
      body: contentPages[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: changeDist,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        selectedItemColor: Colors.blue,
      ),
    );
  }
  void changeDist(int i)async{

    List<Map<String, dynamic>>? levelOnePopulation = await databaseHelper.getAllLevel1();
    List<Map<String, dynamic>>? levelTwoPopulation = await databaseHelper.getAllLevel2();
    List<Map<String, dynamic>>? levelThreePopulation = await databaseHelper.getAllLevel3();


    setState(() {
       if(levelOnePopulation != null){
         levelOneStudents = levelOnePopulation.length;
       }else{
         levelOneStudents = 0;
       }

       if(levelTwoPopulation != null){
         levelTwoStudents = levelTwoPopulation.length;
       }else{
         levelTwoStudents = 0;
       }

       if(levelThreePopulation != null){
         levelThreeStudents = levelThreePopulation.length;
       }else{
         levelThreeStudents = 0;
       }

      selectedIndex = i;
    });
  }
}
