import 'package:flutter/material.dart';
import 'package:teacher/database_helper.dart';

class Student {
  final String name;
  final String phoneNumber;
  final String level;

  Student({required this.name, required this.phoneNumber, required this.level});
}

dynamic students;

class StudentListView extends StatefulWidget {
  @override
  _StudentListViewState createState() => _StudentListViewState();
}

class _StudentListViewState extends State<StudentListView> {
  DatabaseHelper databaseHelper = DatabaseHelper();

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    students = args["list"];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Students'),
      ),
      body: SingleChildScrollView(
        child: (students.length == 0)
            ? const Padding(
                padding: EdgeInsets.only(top: 200),
                child: Center(
                    child: Text(
                  "No data yet!",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.red),
                )),
              )
            : ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: students.length,
                itemBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    width: double.infinity,
                    child: Card(
                      elevation: 4.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    'Name: ${students?[index]["studentName"]}',
                                    style: const TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                IconButton(
                                    alignment: Alignment.topRight,
                                    onPressed: () async {
                                      int? currentId;
                                      int res = -1;

                                      if (args["level"] == 1) {
                                        currentId = await databaseHelper
                                            .getStudentIdByNameFromLevel1(
                                                students[index]["studentName"]);

                                        if (currentId != null) {
                                          res = await databaseHelper
                                              .deleteLevel1(currentId);

                                        }
                                      } else if (args["level"] == 2) {
                                        currentId = await databaseHelper
                                            .getStudentIdByNameFromLevel2(
                                                students[index]["studentName"]);
                                        if (currentId != null) {
                                          res = await databaseHelper
                                              .deleteLevel2(currentId);
                                        }
                                      } else {
                                        currentId = await databaseHelper
                                            .getStudentIdByNameFromLevel3(
                                                students[index]["studentName"]);
                                        if (currentId != null) {
                                          res = await databaseHelper
                                              .deleteLevel3(currentId);
                                        }
                                      }

                                      if (res != -1 && res != 0) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(const SnackBar(
                                          content:
                                              Text("Successfully deleted!"),
                                          duration: Duration(seconds: 1),
                                        ));
                                      }
                                    },
                                    icon: const Icon(Icons.delete))
                              ],
                            ),
                            const SizedBox(height: 8.0),
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    'Paid months: ${students?[index]["months"]}',
                                    style: const TextStyle(fontSize: 16.0),
                                  ),
                                ),

                                IconButton(onPressed: () async {
                                  int? currentId;
                                  int res = -1;

                                  if (args["level"] == 1) {
                                    currentId = await databaseHelper
                                        .getStudentIdByNameFromLevel1(
                                        students[index]["studentName"]);

                                    Map<String, dynamic> userToUpdate = {
                                      "id":currentId,
                                      "studentName":students?[index]["studentName"],
                                      "months":int.parse((students?[index]["months"]))+1,
                                    };

                                    res = await databaseHelper.updateLevel1(userToUpdate);


                                  } else if (args["level"] == 2) {
                                    currentId = await databaseHelper
                                        .getStudentIdByNameFromLevel2(
                                        students[index]["studentName"]);

                                    Map<String, dynamic> userToUpdate = {
                                      "id":currentId,
                                      "studentName":students?[index]["studentName"],
                                      "months":int.parse((students?[index]["months"]))+1,
                                    };

                                    res = await databaseHelper.updateLevel2(userToUpdate);

                                  } else {
                                    currentId = await databaseHelper
                                        .getStudentIdByNameFromLevel3(
                                        students[index]["studentName"]);

                                    Map<String, dynamic> userToUpdate = {
                                      "id":currentId,
                                      "studentName":students?[index]["studentName"],
                                      "months":int.parse((students?[index]["months"]))+1,
                                    };

                                    res = await databaseHelper.updateLevel3(userToUpdate);
                                  }

                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(const SnackBar(
                                      content:
                                      Text("Changes saved!"),
                                      duration: Duration(seconds: 1),
                                    ));
                                  }
                                , icon: const Icon(Icons.add_circle)),

                                IconButton(onPressed: () async {
                                  int? currentId;
                                  int res = -1;

                                  if (args["level"] == 1) {
                                    currentId = await databaseHelper
                                        .getStudentIdByNameFromLevel1(
                                        students[index]["studentName"]);

                                    Map<String, dynamic> userToUpdate = {
                                      "id":currentId,
                                      "studentName":students?[index]["studentName"],
                                      "months":int.parse((students?[index]["months"]))-1,
                                    };

                                    res = await databaseHelper.updateLevel1(userToUpdate);


                                  } else if (args["level"] == 2) {
                                    currentId = await databaseHelper
                                        .getStudentIdByNameFromLevel2(
                                        students[index]["studentName"]);

                                    Map<String, dynamic> userToUpdate = {
                                      "id":currentId,
                                      "studentName":students?[index]["studentName"],
                                      "months":int.parse((students?[index]["months"]))-1,
                                    };

                                    res = await databaseHelper.updateLevel2(userToUpdate);

                                  } else {
                                    currentId = await databaseHelper
                                        .getStudentIdByNameFromLevel3(
                                        students[index]["studentName"]);

                                    Map<String, dynamic> userToUpdate = {
                                      "id":currentId,
                                      "studentName":students?[index]["studentName"],
                                      "months":int.parse((students?[index]["months"]))-1,
                                    };

                                    res = await databaseHelper.updateLevel3(userToUpdate);
                                  }

                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(const SnackBar(
                                      content:
                                      Text("Changes saved!"),
                                      duration: Duration(seconds: 1),
                                    ));
                                  }
                                , icon: const Icon(Icons.remove_circle))

                              ],
                            ),
                            const SizedBox(height: 8.0),
                            Text(
                              'Level: ${args["level"]}',
                              style: const TextStyle(fontSize: 16.0),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // Navigate to the AddStudentPage and wait for a new student to be saved
          int? level = args["level"];

          print(students);

          Navigator.of(context).pushNamed("add", arguments: {"level": level});
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
