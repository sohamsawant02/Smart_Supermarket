import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:dynamiclist/sign_in_scr.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController namet=TextEditingController();
  TextEditingController usert = TextEditingController();
  TextEditingController passt = TextEditingController();
  final _formkeyy = GlobalKey<FormState>();
  String name = "";
  bool passenable = true;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Form(
            key: _formkeyy,
            child: SingleChildScrollView(
              child: Column(
                  children: [

                    SizedBox(
                      height: .0,
                    ),
                    Text(
                        "Welcome to FSAP",
                        style: TextStyle(
                          fontSize: 27,
                          fontWeight: FontWeight.bold,
                            fontFamily: 'Poppins-reg'
                        )
                    ),
                    Text("${name}",
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Poppins-reg'
                        )
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      controller: namet,
                      decoration: InputDecoration(
                          hintStyle: TextStyle(fontSize: 20,fontFamily: 'Poppins-reg'),
                          prefixIcon: Icon(
                            Icons.person_outlined,

                          ),
                          hintText: "Enter Name",
                          labelText: "Name",
                          filled: true,
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          fillColor: Colors.deepPurpleAccent.withOpacity(0.3),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0)
                          )
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Name cannot be empty";
                        }
                        else {
                          return null;
                        }
                      },
                      onChanged: (value) {
                        name = value;
                        setState(() {

                        });
                      },
                    ),



                    SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      controller: usert,
                      decoration: InputDecoration(
                          hintStyle: TextStyle(fontSize: 20,fontFamily: 'Poppins-reg'),
                          prefixIcon: Icon(
                            Icons.email_outlined,

                          ),
                          hintText: "Enter emailid",
                          labelText: "EmailId",
                          filled: true,
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          fillColor: Colors.deepPurpleAccent.withOpacity(0.3),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0)
                          )
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "emailId cannot be empty";
                        }
                        else {
                          return null;
                        }
                      },

                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      controller: passt,
                      obscureText: passenable,
                      decoration: InputDecoration(
                        hintStyle: TextStyle(fontSize: 20,fontFamily: 'Poppins-reg'),
                        prefixIcon: Icon(
                          Icons.lock_outline,
                        ),
                        hintText: "Enter password",
                        labelText: "Password",
                        filled: true,
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        fillColor: Colors.deepPurpleAccent.withOpacity(0.3),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0)
                          )
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Password cannnot be empty";
                        }
                        else if (value.length < 6) {
                          return "lenght must be greater than 6";
                        }
                        else {
                          return null;
                        }
                      },
                    ),
                    SizedBox(
                      height: 10.0,
                    ),


                    ElevatedButton(
                      child: Text("Sign In",style: TextStyle(fontSize: 20,fontFamily: 'Poppins-reg'),),
                      style: TextButton.styleFrom(minimumSize: Size(120, 40),backgroundColor: Colors.deepPurpleAccent),
                      onPressed: () {
                        if (_formkeyy.currentState!.validate()) {
                          FirebaseAuth.instance.createUserWithEmailAndPassword(
                              email: usert.text, password: passt.text)
                              .then((value) {
                            Text("Successful");
                          }).onError((error, stackTrace) {
                            Text("Incorrect ${error.toString()}");
                          });
                        }
                        // var user=usert.text;
                        // var pass=passt.text;

                        // Navigator.pushNamed(context, MyRoutes.homeRoute);
                      },
                    ),
                    signInOption()

                  ]
              ),
            ),
          )
      ),


    );
  }
  Row signInOption(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("have an account?",
            style: TextStyle(fontSize:20 ,color:Colors.black,fontFamily: 'Poppins-reg')
        ),
        GestureDetector(
          onTap: (){
            Navigator.push(context,
                MaterialPageRoute(builder: (context)=> SignIn())
            );
          },
          child: Text("Sign In",
            style: TextStyle(fontSize: 18,color: Colors.black, fontWeight:FontWeight.bold,fontFamily: 'Poppins-reg'),
          ),
        )
      ],
    );
  }
}