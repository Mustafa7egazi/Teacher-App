import 'package:flutter/material.dart';
import 'package:teacher/database_helper.dart';


String? loggedInUser;

class LogIn extends StatefulWidget{


  @override
  State<StatefulWidget> createState() => _LogInState();
}

class _LogInState extends State<LogIn>{
  var usernameController = TextEditingController();
  var passwordController = TextEditingController();
  bool hidePass = true;

  DatabaseHelper databaseHelper = DatabaseHelper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      Container(
        height: double.infinity,
        color: Colors.deepPurpleAccent.withOpacity(.8),
        child: Padding(
          padding: const EdgeInsetsDirectional.symmetric(horizontal: 70.0 , vertical: 25.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(40))
                  ),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  width: double.infinity,
                  child:  const Image(
                    width: 300.0,
                    height: 300.0,
                    fit: BoxFit.cover,
                    image: AssetImage('assets/login.jpg'),
                  ),
                ),
                const Text(
                  'Log In',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 50.0,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Container(
                  color: Colors.white,
                  child: TextFormField(
                    controller: usernameController,
                    onFieldSubmitted: (value){
                      print(value);
                    },
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.person,),
                      hintText: "Username",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Container(
                  color: Colors.white,
                  child: TextFormField(
                    controller: passwordController,
                    onFieldSubmitted: (value){
                      print(value);
                    },
                    obscureText: hidePass,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.lock,),
                      suffixIcon: IconButton(icon : Icon(hidePass?
                      Icons.visibility : Icons.visibility_off)
                        , onPressed: (){
                           setState(() {
                             hidePass = !hidePass;
                           });
                        },
                      ),
                      hintText: "Password",
                      border: const OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Container(
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadiusDirectional.all(Radius.circular(50.0))
                  ),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  width: double.infinity,
                  child: MaterialButton(onPressed: () async{

                    bool exists = await databaseHelper.isUserExists(usernameController.text, passwordController.text);
                    if(exists){
                      loggedInUser = usernameController.text;
                      Navigator.pushReplacementNamed(context, 'home');
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("Successfully logged in!"),duration: Duration(seconds: 1) ,
                      ));
                    }else{
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("Incorrect username or password"),duration: Duration(seconds: 1) ,
                      ));
                    }
                  },
                    color: Colors.deepOrange,
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('Log In',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't have an account?",
                      style: TextStyle(
                        fontSize: 20.0,
                      ),),
                    TextButton(onPressed: (){
                      Navigator.pushReplacementNamed(context, 'register');
                    }, child: const Text("Sign Up",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic
                      ),) ,
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      )

      ,
    );
  }
}
