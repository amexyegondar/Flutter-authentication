import 'package:daily_exercise_app/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:daily_exercise_app/utils/color_utils.dart';
import 'package:daily_exercise_app/reusable_widget/reusable_widget.dart';
import 'package:daily_exercise_app/signup_screen.dart';
class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController _passwordTextController=TextEditingController();
  TextEditingController _emailTextController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: 
         [hexStringToColor("CB2B93"),
          hexStringToColor("9546C4"),
          hexStringToColor("5E61F4"),
           ],
           begin:Alignment.topCenter,end: Alignment.bottomCenter,
           
        ), ) ,
      child:SingleChildScrollView(
     child:Padding(padding: 
        EdgeInsets.fromLTRB(20,10,20,0),
        child:Column(
          children:<Widget>[
            logowidget('images/logo1.png'),
            SizedBox(
              height: 30,
            ),
            reusableTextField('Enter Email', Icons.person_outline, false, _emailTextController),
             SizedBox(
              height: 30,
            ),
            reusableTextField('Enter password', Icons.lock_outline, true, _passwordTextController),
          SizedBox(
              height: 10,
            ),
          firebaseUIButton(context,"LOG IN",(){
        FirebaseAuth.instance.signInWithEmailAndPassword(
          
          email: _emailTextController.text, password:  _passwordTextController.text).then((value) {
            print('Logged in');
            Navigator.push(context, MaterialPageRoute(builder: 
            ((context) => HomeScreen()
            )));

          } ).onError((error, stackTrace) {
            print("Error ${error.toString()}");
          }
          
          );

          }),
          signUpOption(),
          ]
         
        ),
     ),
      ),
     ),

    );
  }
  Row signUpOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Don't have account?",
            style: TextStyle(color: Colors.white70)),
        GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => SignUpScreen()));
          },
          child: const Text(
            " Sign Up",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}



