import 'package:flutter/material.dart';
import 'package:teacher/database_helper.dart';
import 'package:teacher/show_students.dart';

class AddStudentPage extends StatefulWidget {
  @override
  _AddStudentPageState createState() => _AddStudentPageState();
}

class _AddStudentPageState extends State<AddStudentPage> {
  DatabaseHelper databaseHelper = DatabaseHelper();

  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _monthsController = TextEditingController();
  final _levelController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as Map<String, int?>;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Save Student'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextFormField(

                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Name' ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a name';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _monthsController,
                decoration: const InputDecoration(labelText: 'Months'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a total payed months';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 32),
              Text(
                "Level: ${args["level"]}",
                style: const TextStyle(
                    fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 32.0),
              Center(
                child: ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      // Add the new student to the list
                      Student newStudent = Student(
                        name: _nameController.text,
                        phoneNumber: _monthsController.text,
                        level: _levelController.text,
                      );

                      Map<String, dynamic> studentInfo = {
                        'studentName': _nameController.text,
                        'months': _monthsController.text
                      };

                      int resultResponse;

                      if (args["level"] == 1) {
                         resultResponse =  await databaseHelper.insertLevel1(studentInfo);

                      } else if (args["level"] == 2) {
                        resultResponse =  await databaseHelper.insertLevel2(studentInfo);

                      } else {
                        resultResponse =  await databaseHelper.insertLevel3(studentInfo);
                      }

                      if(resultResponse != 0){
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text("Inserted Successfully!"),duration: Duration(seconds: 1) ,
                        ));

                      }else{
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text("Insertion failed!"),duration: Duration(seconds: 1) ,
                        ));
                      }

                      //StudentsPage().students.add(newStudent);



                      // Navigate back to the student list page
                      Navigator.pop(context, newStudent);
                    }
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text('Add Student'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
