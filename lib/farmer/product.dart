import 'dart:io';
import 'package:agrosellapp/farmer/farmer.dart';
import 'package:agrosellapp/farmer/sidebar.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

import '../custom_image_view.dart';
import '../customer/cart.dart';
import '../image_constant.dart';
import '../screens/Message.dart';
import '../size_utils.dart';

class ProductInfo extends StatefulWidget {
  @override
  State<ProductInfo> createState() => _ProductInfoState();
}

class _ProductInfoState extends State<ProductInfo> {
  var _formkey = GlobalKey<FormState>();

  var pnameController = TextEditingController();
  var priceController = TextEditingController();
  var quantityController = TextEditingController();
  var pinfoController = TextEditingController();

  File? image;
  String? downloadURl;
  final imagePicker = ImagePicker();

  void _settingModalBottomSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return bottomsheet();
        });
  }

  Widget bottomsheet() {
    return Container(
      color: Colors.green,
      height: 120,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(top: 10),
      child: Column(
        children: [
          Text(
            "Choose Profile Photo",
            // style: AppStyle.Select,
          ),
          SizedBox(
            height: 15,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            TextButton.icon(
                onPressed: () {
                  imagepick();
                },
                icon: Icon(
                  Icons.image,
                  color: Colors.white,
                ),
                label: Text(
                  "Gallery",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w800),
                ))
          ])
        ],
      ),
    );
  }

  showSnakBar(String snaktext, Duration d) {
    final snakBar = SnackBar(content: Text(snaktext), duration: d);
    ScaffoldMessenger.of(context).showSnackBar(snakBar);
  }

  Future imagepick() async {
    final pick = await imagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pick != null) {
        image = File(pick.path);
      } else {
        showSnakBar("No file selected", Duration(microseconds: 400));
      }
    });
  }

  String? email;
  void initState() {
    super.initState();
    try {
      var currentUser = FirebaseAuth.instance.currentUser;
      if (currentUser != null) {
        email = currentUser.email;
      }
    } catch (e) {}
  }

  Future uploadimages(String name) async {
    var db = FirebaseFirestore.instance;
    final postID = DateTime.now().millisecondsSinceEpoch.toString();
    Reference ref =
        FirebaseStorage.instance.ref().child("/image").child("post_$postID");
    await ref.putFile(image!);
    downloadURl = await ref.getDownloadURL();
    var userr = db.collection("users");

    userr
        .doc(email)
        .collection("products")
        .doc(name)
        .update({'profileURL': downloadURl});
    var products = db.collection("Products");
    products.doc(name).update({'profileURL': downloadURl});
  }

  Future addProductDetails(
      String pname, String price, String quantity, String pInfo) async {
    var db = FirebaseFirestore.instance;
    var userr = db.collection("users").doc(email).collection("products");
    var products = db.collection("Products");
    final data1 = <String, dynamic>{
      "Name": pname,
      "price": price,
      "quantity": quantity,
      "pinfo": pInfo,
      "profileURL": "",
    };
    products.doc(pname).set(data1);
    userr.doc(pname).set(data1).then((value) => uploadimages(pname));
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formkey,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        drawer: SideBar(),
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text("Product Details", style: TextStyle(color: Colors.white)),
          centerTitle: true,
          elevation: 0.0,
          backgroundColor: Colors.green,
          leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => Farmer()));
              }),
        ),
        body: Container(
          padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.1,
              right: 60,
              left: 60),
          child: Column(
            children: [
              TextFormField(
                controller: pnameController,
                cursorColor: Colors.black,
                decoration: InputDecoration(
                    // labelText: 'Name',
                    hintText: 'Enter product name',
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green),
                        borderRadius: BorderRadius.circular(10))),
              ),
              SizedBox(
                height: 15,
              ),
              TextFormField(
                controller: priceController,
                cursorColor: Colors.black,
                decoration: InputDecoration(
                    // labelText: 'Name',
                    hintText: 'Enter Price',
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green),
                        borderRadius: BorderRadius.circular(10))),
              ),
              SizedBox(
                height: 15,
              ),
              TextFormField(
                controller: quantityController,
                cursorColor: Colors.black,
                decoration: InputDecoration(
                    hintText: 'Enter quantity',
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green),
                        borderRadius: BorderRadius.circular(10))),
              ),
              SizedBox(
                height: 15,
              ),
              TextFormField(
                controller: pinfoController,
                cursorColor: Colors.black,
                decoration: InputDecoration(
                    hintText: 'Enter product information',
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green),
                        borderRadius: BorderRadius.circular(10))),
              ),
              Container(
                color: Colors.white,
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.all(15),
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                        border: Border.all(color: Colors.white),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            offset: Offset(2, 2),
                            spreadRadius: 2,
                            blurRadius: 1,
                          ),
                        ],
                      ),
                      child: CircleAvatar(
                        radius: 50,
                        backgroundColor: Color.fromARGB(255, 255, 255, 255),
                        child: CircleAvatar(
                          radius: 47.0,
                          backgroundImage: image == null
                              ? AssetImage("assets/images/img1.jpg")
                              : FileImage(image!) as ImageProvider,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    MaterialButton(
                      // minWidth: double.infinity,
                      onPressed: () {
                        _settingModalBottomSheet(context);
                      },
                      child: Text(
                        'Upload Image',
                        style: TextStyle(fontSize: 20),
                      ),
                      color: Colors.green,
                      textColor: Colors.white,
                    ),
                    MaterialButton(
                      // minWidth: double.infinity,
                      onPressed: () {
                        addProductDetails(
                            pnameController.text.trim(),
                            priceController.text.trim(),
                            quantityController.text.trim(),
                            pinfoController.text.trim());
                      },
                      child: Text(
                        'Upload Details',
                        style: TextStyle(fontSize: 20),
                      ),
                      color: Colors.green,
                      textColor: Colors.white,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
