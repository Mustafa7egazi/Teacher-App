import 'package:flutter/material.dart';
import 'package:teacher/database_helper.dart';

class HomeContent extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<HomeContent> {

  DatabaseHelper databaseHelper = DatabaseHelper();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.indigo[300],
      width: double.infinity,
      height: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 45.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding:
                const EdgeInsetsDirectional.symmetric(horizontal: 80.0),
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadiusDirectional.only(
                      topStart: Radius.circular(20.0),
                      topEnd: Radius.circular(20.0),
                    ),
                  ),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  width: 200.0,
                  child: Expanded(
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        const Image(
                          fit: BoxFit.cover,
                          image: AssetImage('assets/Learning-cuate.png'),
                        ),
                        Container(
                          width: double.infinity,
                          color: Colors.black.withOpacity(.7),
                          child: TextButton(
                            onPressed: () async{

                              dynamic listOfStudents = await databaseHelper.getAllLevel1();

                              Navigator.of(context).pushNamed("show",
                              arguments: {
                                "level": 1,
                                "list": listOfStudents
                                  });
                            },
                            child: const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                "Level One",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Padding(
                padding:
                const EdgeInsetsDirectional.symmetric(horizontal: 80.0),
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadiusDirectional.only(
                      topStart: Radius.circular(20.0),
                      topEnd: Radius.circular(20.0),
                    ),
                  ),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  width: 200.0,
                  child: Expanded(
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        const Image(
                          fit: BoxFit.cover,
                          image: AssetImage('assets/Learning-rafiki.png'),
                        ),
                        Container(
                          width: double.infinity,
                          color: Colors.black.withOpacity(.7),
                          child: TextButton(
                            onPressed: () async{

                              dynamic listOfStudents = await databaseHelper.getAllLevel2();

                              Navigator.of(context).pushNamed("show",
                                  arguments: {
                                    "level": 2,
                                    "list":listOfStudents
                                  });
                            },
                            child: const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                "Level Two",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Padding(
                padding:
                const EdgeInsetsDirectional.symmetric(horizontal: 80.0),
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadiusDirectional.only(
                      topStart: Radius.circular(20.0),
                      topEnd: Radius.circular(20.0),
                    ),
                  ),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  width: 200.0,
                  child: Expanded(
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        const Image(
                          fit: BoxFit.cover,
                          image: AssetImage('assets/Learning-bro.png')
                          ,
                        ),
                        Container(
                          width: double.infinity,
                          color: Colors.black.withOpacity(.7),
                          child: TextButton(
                            onPressed: () async{

                              dynamic listOfStudents = await databaseHelper.getAllLevel3();

                              Navigator.of(context).pushNamed("show",
                                  arguments: {
                                    "level": 2,
                                    "list":listOfStudents
                                  });
                            },
                            child: const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                "Level Three",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
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
