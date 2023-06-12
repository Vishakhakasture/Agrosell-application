import 'package:agrosellapp/customer/productinfo.dart';
import 'package:agrosellapp/screens/Message.dart';
import 'package:agrosellapp/customer/cart.dart';
import 'package:agrosellapp/farmer/farmer.dart';
import 'package:agrosellapp/size_utils.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:agrosellapp/farmer/sidebar.dart';
import '../custom_image_view.dart';
import '../image_constant.dart';

class HomeScreens extends StatefulWidget {
  @override
  State<HomeScreens> createState() => _HomeScreensState();
}

class _HomeScreensState extends State<HomeScreens> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        drawer: SideBar(),
        appBar: AppBar(
          title: Text("AgroSell", style: TextStyle(color: Colors.white)),
          centerTitle: true,
          elevation: 0.0,
          backgroundColor: Colors.green,
          leading: IconButton(
              icon: Icon(Icons.menu, color: Colors.white),
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => SideBar()));
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
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: ListView(
              children: <Widget>[
                Padding(
                    padding: getPadding(top: 10),
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
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, position) {
                                      var data = snapshot.data!.docs[position]
                                          .data() as Map<String, dynamic>;
                                      return Padding(
                                        padding: getPadding(left: 0, top: 10),
                                        child: Container(
                                          width: 170,
                                          child: Card(
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            child: Stack(children: [
                                              InkWell(
                                                // onTap: () {
                                                //   Navigator.push(
                                                //       context,
                                                //       MaterialPageRoute(
                                                //         builder: (context) =>
                                                //             product_details(
                                                //                 email: data[
                                                //                     'Name']),
                                                //       )
                                                // );
                                                // },
                                                child: Container(
                                                  height: 190,
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    child: Image(
                                                      image: NetworkImage(
                                                          data['profileURL']),
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Positioned(
                                                bottom: 10,
                                                child: Padding(
                                                  padding: getPadding(
                                                    left: 5,
                                                    right: 50,
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
                                                            color:
                                                                Colors.white),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20)),
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
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
                                              )
                                            ]),
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
                    )),
                Padding(
                    padding: getPadding(top: 10),
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
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, position) {
                                      var data = snapshot.data!.docs[position]
                                          .data() as Map<String, dynamic>;
                                      return Padding(
                                        padding: getPadding(left: 1.0, top: 2),
                                        child: Container(
                                          width: 170,
                                          child: Card(
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20)),
                                            child: Stack(children: [
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
                                                  height: 190,
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    child: Image(
                                                      image: NetworkImage(
                                                          data['profileURL']),
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Positioned(
                                                bottom: 10,
                                                child: Padding(
                                                  padding: getPadding(
                                                    left: 5,
                                                    right: 20,
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
                                                            color:
                                                                Colors.white),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10)),
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
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
                                              )
                                            ]),
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
                    )),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Container(
          height: 55,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(color: Colors.green),
          // decoration: BoxDecoration(color: Color.fromARGB(255, 67, 204, 76)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: EdgeInsets.all(10),
                child: InkWell(
                  onTap: () {
                    // Navigator.of(context).push(MaterialPageRoute(
                    //     builder:c (context) => MessageScreen()));
                  },
                  child: Container(
                    child: CustomImageView(
                      svgPath: ImageConstant.imgHome,
                      height: getSize(35),
                      width: getSize(35),
                    ),
                    height: 50,
                    width: 50,
                    // decoration: BoxDecoration(border: Border.all(width: 2)),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => product_details()));
                  },
                  child: Container(
                    child: CustomImageView(
                      svgPath: ImageConstant.imgLightbulb,
                      height: getSize(35),
                      width: getSize(35),
                    ),
                    height: 50,
                    width: 50,
                    // decoration: BoxDecoration(border: Border.all(width: 2)),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => CartView()));
                  },
                  child: Container(
                    child: CustomImageView(
                      svgPath: ImageConstant.imgCart,
                      height: getSize(35),
                      width: getSize(35),
                    ),
                    height: 50,
                    width: 50,
                    // decoration: BoxDecoration(border: Border.all(width: 2)),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => Farmer()));
                  },
                  child: Container(
                    child: CustomImageView(
                      svgPath: ImageConstant.imgUser,
                      height: getSize(35),
                      width: getSize(35),
                    ),
                    height: 50,
                    width: 50,
                    // decoration: BoxDecoration(border: Border.all(width: 2)),
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

class CustomSearchDelegate extends SearchDelegate {
  List<String> searchTerms = [''];
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];
    for (var vegetables in searchTerms) {
      if (vegetables.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(vegetables);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    for (var vegetables in searchTerms) {
      if (vegetables.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(vegetables);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
  }
}
