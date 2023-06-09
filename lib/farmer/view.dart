import 'package:agrosellapp/screens.dart';
import 'package:agrosellapp/farmer/farmer.dart';
import 'package:agrosellapp/size_utils.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ViewProduct extends StatefulWidget {
  // const ViewProduct({super.key});

  @override
  State<ViewProduct> createState() => _ViewProductState();
}

class _ViewProductState extends State<ViewProduct> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("View", style: TextStyle(color: Colors.white)),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.green,
        leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => Farmer()));
            }),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search, color: Colors.white),
            onPressed: () {
              showSearch(
                context: context,
                delegate: CustomSearchDelegate(),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.symmetric(vertical: 10),
          child: ListView(
            children: <Widget>[
              Padding(
                padding: getPadding(top: 15),
                child: StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection("Products")
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              height: 290.0,
                              child: ListView.builder(
                                itemCount: snapshot.data!.docs.length,
                                scrollDirection: Axis.vertical,
                                itemBuilder: (context, position) {
                                  var data = snapshot.data!.docs[position]
                                      .data() as Map<String, dynamic>;
                                  return Padding(
                                    padding: getPadding(
                                        left: 40, top: 10, right: 40),
                                    child: Container(
                                      width: 170,
                                      child: Card(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        child: Stack(
                                          children: [
                                            InkWell(
                                              // onTap: () {
                                              //   Navigator.push(
                                              //       context,
                                              //       MaterialPageRoute(
                                              //         builder: (context) =>
                                              //             doctorData(
                                              //                 email: data[
                                              //                     'name']),
                                              //       )
                                              // );
                                              // },
                                              child: Container(
                                                height: 230,
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  child: Image(
                                                    image: NetworkImage(
                                                        data['profileURL']),
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Positioned(
                                              bottom: 1.0,
                                              child: Padding(
                                                padding: getPadding(
                                                  left: 70,
                                                ),
                                                child: Container(
                                                  height: 60,
                                                  width: 160,
                                                  decoration: BoxDecoration(
                                                      boxShadow: [
                                                        BoxShadow(
                                                          color: Colors.grey,
                                                          blurRadius: 5.0,
                                                        ),
                                                      ],
                                                      color: Colors.white,
                                                      border: Border.all(
                                                          width: 0,
                                                          color: Colors.white),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15)),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Padding(
                                                        padding: getPadding(
                                                            top: 13,
                                                            right: 40,
                                                            left: 10),
                                                        child: Text(
                                                          data['Name'],
                                                          style: TextStyle(
                                                              fontSize: 15,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w900,
                                                              fontFamily:
                                                                  "Poppins"),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding: getPadding(
                                                            top: 3,
                                                            right: 50,
                                                            left: 10),
                                                        child: Text(
                                                          data['price'],
                                                          style: TextStyle(
                                                              fontSize: 10,
                                                              color:
                                                                  Colors.grey,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w900,
                                                              fontFamily:
                                                                  "Poppins"),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding: getPadding(
                                                            top: 3,
                                                            right: 50,
                                                            left: 10),
                                                        child: Text(
                                                          data['quantity'],
                                                          style: TextStyle(
                                                              fontSize: 10,
                                                              color:
                                                                  Colors.grey,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w900,
                                                              fontFamily:
                                                                  "Poppins"),
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
                                },
                              ))
                        ],
                      );
                    } else {
                      return SizedBox();
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
