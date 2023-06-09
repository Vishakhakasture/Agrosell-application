import 'package:agrosellapp/customer/login.dart';
import 'package:agrosellapp/farmer/farmer.dart';
import 'package:agrosellapp/farmer/product.dart';
import 'package:agrosellapp/screens.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'farmerlogin.dart';

class FarmerSignIn extends StatefulWidget {
  @override
  _FarmerSignInState createState() => _FarmerSignInState();
}

class _FarmerSignInState extends State<FarmerSignIn> {
  var _formkey = GlobalKey<FormState>();

  var nameController = TextEditingController();
  var mobileController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var addressController = TextEditingController();

  Createuser() async {
    try {
      var user = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: emailController.text.trim(),
              password: passwordController.text.trim())
          .then((value) => {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => Farmer()))
              });

      addUserDetails(
          nameController.text.trim(),
          emailController.text.trim(),
          mobileController.text.trim(),
          passwordController.text.trim(),
          addressController.text.trim());
    } on FirebaseAuthException catch (e) {
      if (e.code == "weak-password") {
        Fluttertoast.showToast(msg: "password is weak");
      } else if (e.code == "email-already-in-use") {
        Fluttertoast.showToast(msg: "email already exists");
      }
    }
  }

  Future addUserDetails(String name, String email, String number,
      String password, String address) async {
    var db = FirebaseFirestore.instance;
    var farmer = db.collection("Farmers");
    final data1 = <String, dynamic>{
      "Name": name,
      "Email": email,
      "Number": number,
      "password": password,
      "Address": address,
    };
    farmer.doc(email).set(data1);
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
                'Register to AgroSell',
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
                    controller: nameController,
                    cursorColor: Colors.black,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                        // labelText: 'Name',
                        hintText: 'Enter name',
                        prefixIcon: Icon(Icons.person, color: Colors.black),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.green),
                            borderRadius: BorderRadius.circular(10))),
                    onChanged: (String value) {},
                    validator: (value) {
                      return value!.isEmpty ? 'Please enter name' : null;
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: mobileController,
                    cursorColor: Colors.black,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                        // labelText: 'Mobile',
                        hintText: 'Enter Mobile',
                        prefixIcon: Icon(Icons.phone, color: Colors.black),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.green),
                            borderRadius: BorderRadius.circular(10))),
                    onChanged: (String value) {},
                    validator: (value) {
                      return value!.isEmpty ? 'Please enter Mobile' : null;
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: addressController,
                    cursorColor: Colors.black,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                        // labelText: 'Mobile',
                        hintText: 'Enter address',
                        prefixIcon: Icon(Icons.directions, color: Colors.black),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.green),
                            borderRadius: BorderRadius.circular(10))),
                    onChanged: (String value) {},
                    validator: (value) {
                      return value!.isEmpty ? 'Please enter address' : null;
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: emailController,
                    cursorColor: Colors.black,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        // labelText: 'Email',
                        hintText: 'Enter valid email',
                        prefixIcon: Icon(Icons.email, color: Colors.black),
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
                        hintText: 'Enter strong password',
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
                    height: 20,
                  ),
                  MaterialButton(
                    minWidth: double.infinity,
                    onPressed: () {
                      Createuser();
                    },
                    child: Text(
                      'Register',
                      style: TextStyle(fontSize: 20),
                    ),
                    color: Colors.green,
                    textColor: Colors.white,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: <Widget>[
                      const Text('Already have an account'),
                      TextButton(
                        child: const Text(
                          'Login here',
                          style: TextStyle(color: Colors.green, fontSize: 15),
                        ),
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) => FarmerLogIn()));
                        },
                      )
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
