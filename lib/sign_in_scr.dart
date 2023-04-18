import 'package:dynamiclist/Tabtry.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:dynamiclist/login_scr.dart';
import 'package:dynamiclist/main.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController usert= TextEditingController();
  TextEditingController passt=TextEditingController();
  final _formkey=GlobalKey<FormState>();
  String name="";
  bool passenable = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Form(
            key:_formkey,
            child: Column(
                children: [

                  SizedBox(
                    height: 150.0,
                  ),
                  Text(
                      "Welcome to FSAP",
                      style: const TextStyle(fontSize: 30,fontFamily: 'Poppins-reg',fontWeight:FontWeight.bold ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    controller: usert,
                    decoration: InputDecoration(
                      hintStyle: TextStyle(fontSize: 20,fontFamily: 'Poppins-reg'),
                      prefixIcon: Icon(
                          Icons.person_outlined,

                      ),
                        hintText: "Enter username",
                        labelText: "Username",
                        filled: true,
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        fillColor: Colors.deepPurpleAccent.withOpacity(0.3),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0)
                        )
                    ),
                    validator: (value){
                      if(value!.isEmpty){
                        return "Username cannot be empty";
                      }
                      else{
                        return null;
                      }
                    },
                    onChanged: (value){
                      name=value;
                      setState(() {

                      });
                    },
                  ),
                  SizedBox(
                    height: 30.0,
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
                        ),
                    ),
                      validator: (value){
                      if(value!.isEmpty){
                        return "Password cannnot be empty";
                      }
                      else if(value.length<6){
                        return "lenght must be greater than 6";
                      }
                      else{
                        return null;
                      }


                    },
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  // Material(
                  //   color: Colors.deepPurple,
                  //   borderRadius: BorderRadius.circular(changeButton ? 20:8),
                  //   child:InkWell(
                  //     onTap:  () async{
                  //       setState((){
                  //         changeButton=true;
                  //       });
                  //       await Future.delayed(Duration(milliseconds:30));
                  //       // await Navigator.pushNamed(context, MyRoutes.homeRoute);
                  //       setState((){
                  //         changeButton=false;
                  //       });
                  //
                  //     },
                  //
                  //     child:AnimatedContainer(
                  //       duration: Duration(milliseconds: 30),
                  //       width: changeButton? 50:150,
                  //       height: 50,
                  //       alignment: Alignment.center,
                  //       child:changeButton?Icon(
                  //           Icons.done,
                  //           color: Colors.white
                  //       ) : Text(
                  //         "Login",
                  //         style: TextStyle(
                  //             color: Colors.white,
                  //             fontWeight: FontWeight.bold,
                  //             fontSize: 18),
                  //       ),
                  //
                  //       decoration : BoxDecoration(
                  //           color: Colors.deepPurple,
                  //           borderRadius: BorderRadius.circular(changeButton ? 20:8)
                  //       ),
                  //
                  //     ),
                  //
                  //   ),
                  // )






            ElevatedButton(
                child: Text("Login",style: TextStyle(fontSize: 20,fontFamily: 'Poppins-reg'),),
                style: TextButton.styleFrom(minimumSize: Size(120, 40),backgroundColor: Colors.deepPurpleAccent),
                      onPressed: (){
                        if(_formkey.currentState!.validate()){
                          FirebaseAuth.instance.signInWithEmailAndPassword(email: usert.text, password: passt.text)
                              .then((value){
                            Text("Successful");
                                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>TabTry()));
                          }).onError((error, stackTrace){
                            print("Error ${error.toString()}");
                          });

                        }
                      // var user=usert.text;
                      // var pass=passt.text;

                  // Navigator.pushNamed(context, MyRoutes.homeRoute);
                },
              ),


                  signUpOption()


                ]
            ),
          )
      ),


    );
  }
  Row signUpOption(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Dont have an account?",
          style: TextStyle(fontSize: 20,fontFamily: 'Poppins-reg'),
        ),
        GestureDetector(
          onTap: (){
            Navigator.push(context,
                MaterialPageRoute(builder: (context)=> SignUpScreen())
            );
          },
          child: Text("Sign Up",
            style: TextStyle(fontSize: 20,fontFamily: 'Poppins-reg',fontWeight:FontWeight.bold),
          ),
        )


      ],
    );
  }
}
