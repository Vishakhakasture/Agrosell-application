import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../size_utils.dart';
import 'cart.dart';

class product_details extends StatelessWidget {
  // const product_details({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
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
                                    itemBuilder: (context, position) {
                                      var data = snapshot.data!.docs[position]
                                          .data() as Map<String, dynamic>;
                                      return Padding(
                                        padding: getPadding(left: 5, top: 10),
                                        child: Stack(children: [
                                          InkWell(
                                            child: Container(
                                              height: 190,
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
                                        ]),
                                        child: Container(
                                          width: 170,
                                          child: Align(
                                            alignment: Alignment.bottomCenter,
                                            child: Container(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.6,
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  40),
                                                          topRight:
                                                              Radius.circular(
                                                                  40)),
                                                  boxShadow: [
                                                    BoxShadow(
                                                        color: Colors.black
                                                            .withOpacity(0.2),
                                                        offset: Offset(0, -4),
                                                        blurRadius: 8),
                                                  ]),
                                              child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                        left: 20,
                                                        right: 30,
                                                        top: 30,
                                                      ),
                                                      child: Expanded(
                                                        child: Text(
                                                          data['Name'],
                                                          style: TextStyle(
                                                              fontSize: 25,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w900,
                                                              fontFamily:
                                                                  "Poppins"),
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: getPadding(
                                                          top: 3,
                                                          right: 50,
                                                          left: 20),
                                                      child: Text(
                                                        data['price'],
                                                        style: TextStyle(
                                                            fontSize: 20,
                                                            color: Colors.grey,
                                                            fontWeight:
                                                                FontWeight.w900,
                                                            fontFamily:
                                                                "Poppins"),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: getPadding(
                                                          top: 3,
                                                          right: 50,
                                                          left: 20),
                                                      child: Text(
                                                        data['quantity'],
                                                        style: TextStyle(
                                                            fontSize: 20,
                                                            color: Colors.grey,
                                                            fontWeight:
                                                                FontWeight.w900,
                                                            fontFamily:
                                                                "Poppins"),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: getPadding(
                                                          top: 3,
                                                          right: 50,
                                                          left: 20),
                                                      child: Text(
                                                        data['pinfo'],
                                                        style: TextStyle(
                                                            fontSize: 20,
                                                            color: Colors.grey,
                                                            fontWeight:
                                                                FontWeight.w900,
                                                            fontFamily:
                                                                "Poppins"),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                        top: 15,
                                                        left: 30,
                                                        right: 30,
                                                      ),
                                                      child: Container(
                                                        padding:
                                                            const EdgeInsets
                                                                    .symmetric(
                                                                vertical: 4,
                                                                horizontal: 8),
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors.green,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5),
                                                        ),
                                                        child: Text(
                                                          "Shipped directly from Farmers",
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 14,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Spacer(),
                                                    Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                              .size
                                                              .width,
                                                      padding: const EdgeInsets
                                                              .symmetric(
                                                          vertical: 10,
                                                          horizontal: 30),
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius.only(
                                                            topLeft:
                                                                Radius.circular(
                                                                    20),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    20),
                                                          ),
                                                          boxShadow: [
                                                            BoxShadow(
                                                                color: Colors
                                                                    .black
                                                                    .withOpacity(
                                                                        0.07),
                                                                offset: Offset(
                                                                    0, -3),
                                                                blurRadius: 12),
                                                          ]),
                                                      child: Row(children: [
                                                        Expanded(
                                                          child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                'Total',
                                                                style:
                                                                    TextStyle(
                                                                  fontSize: 20,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  color: Colors
                                                                      .black,
                                                                ),
                                                              ),
                                                              Text(
                                                                "45000",
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        20,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    color: Colors
                                                                        .black),
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                        Material(
                                                          color: Colors.green,
                                                          child: InkWell(
                                                            onTap: () {
                                                              Navigator.push(
                                                                  context,
                                                                  MaterialPageRoute(
                                                                      builder:
                                                                          (_) =>
                                                                              CartView()));
                                                            },
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10),
                                                            child: Container(
                                                              padding: const EdgeInsets
                                                                      .symmetric(
                                                                  vertical: 10,
                                                                  horizontal:
                                                                      20),
                                                              decoration: BoxDecoration(
                                                                  color: Colors
                                                                      .white,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10)),
                                                              child: Text(
                                                                "Add to Cart",
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        20,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    color: Colors
                                                                        .white),
                                                              ),
                                                            ),
                                                          ),
                                                        )
                                                      ]),
                                                    ),
                                                  ]),
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
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
