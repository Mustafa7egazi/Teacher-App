import 'package:flutter/material.dart';



import 'database_helper.dart';

class SignUp extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPassController = TextEditingController();
  var nameController = TextEditingController();

  bool hidePass = true;
  DatabaseHelper databaseHelper = DatabaseHelper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        color: Colors.deepPurpleAccent.withOpacity(.8),
        child: Padding(
          padding: const EdgeInsetsDirectional.symmetric(
              horizontal: 70.0, vertical: 25.0),
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
                  child: const Image(
                    height: 250.0,
                    width: 300.0,
                    fit: BoxFit.cover,
                    image: AssetImage('assets/register.jpg'),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    'Sign Up',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 50.0,
                      color: Colors.white,
                    ),
                  ),
                ),
                Container(
                  color: Colors.white,
                  child: TextFormField(
                    controller: nameController,
                    onFieldSubmitted: (value) {
                      print(value);
                    },
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(
                        Icons.person,
                      ),
                      hintText: "Username",
                      border: OutlineInputBorder(),
                    ),
                    validator: (value){
                      if(value == null || value.isEmpty){
                        return "Username field is required!";
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(
                  height: 8.0,
                ),
                Container(
                  color: Colors.white,
                  child: TextFormField(
                    controller: passwordController,
                    onFieldSubmitted: (value) {
                      print(value);
                    },
                    obscureText: hidePass,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(
                        Icons.lock,
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                            hidePass ? Icons.visibility : Icons.visibility_off),
                        onPressed: () {
                          setState(() {
                            hidePass = !hidePass;
                          });
                        },
                      ),
                      hintText: "Password",
                      border: const OutlineInputBorder(),
                    ), validator: (value){
                    if(value == null || value.isEmpty){
                      return "Password field is required!";
                    }
                    return null;
                  },
                  ),
                ),
                const SizedBox(
                  height: 8.0,
                ),
                Container(
                  color: Colors.white,
                  child: TextFormField(
                    controller: confirmPassController,
                    onFieldSubmitted: (value) {
                      print(value);
                    },
                    obscureText: hidePass,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(
                        Icons.lock,
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                            hidePass ? Icons.visibility : Icons.visibility_off),
                        onPressed: () {
                          setState(() {
                            hidePass = !hidePass;
                          });
                        },
                      ),
                      hintText: "Confirm Password",
                      border: const OutlineInputBorder(),
                    ),
                    validator: (value){
                      if(value == null || value.isEmpty){
                        return "Confirm password field is required!";
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(
                  height: 8.0,
                ),
                Container(
                  decoration: const BoxDecoration(
                      borderRadius:
                          BorderRadiusDirectional.all(Radius.circular(10.0))),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  width: double.infinity,
                  child: MaterialButton(
                    onPressed: () async{
                      if (nameController.text.isEmpty ||
                          passwordController.text.isEmpty ||
                          confirmPassController.text.isEmpty) {

                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text("All fields are required!"),duration: Duration(seconds: 1) ,
                        ));

                      } else {
                        if (passwordController.text !=
                            confirmPassController.text) {

                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                            content: Text("Passwords must match!"),duration: Duration(seconds: 1) ,
                          ));

                        } else {


                          int? res = await databaseHelper.getUserIdByUsername(nameController.text);
                          if(res == 0){
                            Map<String,dynamic> newUser = {
                              'username':nameController.text,
                              'password': passwordController.text
                            };
                            int response = await databaseHelper.insertUser(newUser);
                            if(response != 0){
                              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                content: Text("New user has been registered!"),duration: Duration(seconds: 1) ,
                              ));
                            }else{
                              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                content: Text("Failed to register!"),duration: Duration(seconds: 1) ,
                              ));
                            }
                          }else{
                            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                              content: Text("user already exists!"),duration: Duration(seconds: 1) ,
                            ));
                          }

                          // getUserIdByUsername(
                          //         nameController.text.toLowerCase());

                        }
                      }
                    },
                    color: Colors.deepOrange,
                    child: const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(
                  height: 10.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Already have an account?",
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, 'login');
                      },
                      child: const Text(
                        "Log In",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

