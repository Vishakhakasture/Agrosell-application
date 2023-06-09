import 'package:agrosellapp/farmer/farmersign.dart';
import 'package:agrosellapp/farmer/product.dart';
import 'package:agrosellapp/screens.dart';
import 'package:agrosellapp/customer/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class FarmerLogIn extends StatefulWidget {
  @override
  _FarmerLogInState createState() => _FarmerLogInState();
}

class _FarmerLogInState extends State<FarmerLogIn> {
  var _formkey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  loginuser() async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: emailController.text.trim(),
              password: passwordController.text.trim())
          .then(
        (value) {
          if (FirebaseAuth.instance.currentUser?.uid == null) {
            Fluttertoast.showToast(msg: "user not found");
          } else {
            Navigator.push(
                context, MaterialPageRoute(builder: (_) => ProductInfo()));
          }
        },
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Fluttertoast.showToast(msg: "user not found");
      } else if (e.code == 'wrong-password') {
        Fluttertoast.showToast(msg: "password is wrong");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formkey,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 200,
              height: 150,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    "https://www.greenbiz.com/sites/default/files/images/articles/featured/rowcrop.jpg",
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              child: Text(
                'Welcome to AgroSell',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.1,
                  right: 60,
                  left: 60),
              child: Column(
                children: [
                  TextFormField(
                    controller: emailController,
                    cursorColor: Colors.black,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        // labelText: 'Email',
                        hintText: 'Enter email',
                        prefixIcon: Icon(
                          Icons.email,
                          color: Colors.black,
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.green),
                            borderRadius: BorderRadius.circular(10))),
                    onChanged: (String value) {},
                    validator: (value) {
                      return value!.isEmpty ? 'Please enter email' : null;
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: passwordController,
                    cursorColor: Colors.black,
                    obscureText: true,
                    decoration: InputDecoration(
                        // labelText: 'Password',
                        hintText: 'Enter password',
                        prefixIcon: Icon(Icons.password, color: Colors.black),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.green),
                            borderRadius: BorderRadius.circular(10))),
                    onChanged: (String value) {},
                    validator: (value) {
                      return value!.isEmpty ? 'Please enter password' : null;
                    },
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: EdgeInsets.only(right: 20.0),
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          'Forgot password',
                          style: TextStyle(color: Colors.green, fontSize: 15),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  MaterialButton(
                    minWidth: double.infinity,
                    onPressed: () {
                      loginuser();
                    },
                    child: Text(
                      'Login',
                      style: TextStyle(fontSize: 20),
                    ),
                    color: Colors.green,
                    textColor: Colors.white,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: <Widget>[
                      const Text('Does not have account?'),
                      TextButton(
                        child: const Text(
                          'Sign in',
                          style: TextStyle(color: Colors.green, fontSize: 15),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => FarmerSignIn()));
                        },
                      ),
                    ],
                    mainAxisAlignment: MainAxisAlignment.center,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
