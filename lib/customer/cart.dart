import "package:agrosellapp/customer/homepage.dart";
import "package:flutter/material.dart";

class CartView extends StatefulWidget {
  @override
  _CartViewState createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text("Your Cart", style: TextStyle(color: Colors.white)),
          centerTitle: true,
          elevation: 0.0,
          backgroundColor: Colors.green,
          leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => HomeScreens()));
              }),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Cart items",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                CartItem(),
                CartItem(),
                CartItem(),
                CartItem(),
                CartItem(),
                SizedBox(
                  height: 21.0,
                ),
                Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Total",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      ),
                    ),
                    Text(
                      "2,50,000",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 4.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Delivery charges ",
                      style: TextStyle(
                        fontSize: 14.0,
                      ),
                    ),
                    Text(
                      "200",
                      style: TextStyle(
                        fontSize: 14.0,
                      ),
                    ),
                  ],
                ),
                Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Sub Total ",
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "200",
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 18,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        width: 100.0,
                        child: Text(
                          "mangoes",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          Container(
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(1.0),
                            ),
                            child: Icon(
                              Icons.add,
                              color: Colors.white,
                              size: 15.0,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(
                              "1",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(1.0),
                            ),
                            child: Icon(
                              Icons.add,
                              color: Colors.red,
                              size: 15.0,
                            ),
                          ),
                          Spacer(),
                          Text(
                            "\u20b9 fjsfhs jsfb jsdjls ",
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
                      MaterialButton(
                        onPressed: () {},
                        color: Colors.lightGreen,
                        height: 50.0,
                        minWidth: double.infinity,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        child: Text(
                          "Make A Deal",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 18.0,
                      ),
                    ],
                  ),
                )
              ]),
        ),
      ),
    );
  }
}

class CartItem extends StatelessWidget {
  const CartItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: Row(children: <Widget>[
        Container(
          width: 120.0,
          height: 120.0,
          decoration: BoxDecoration(
              color: Color.fromARGB(255, 102, 230, 106),
              borderRadius: BorderRadius.circular(10.0)),
          padding: EdgeInsets.all(4.0),
          child: Center(
            child: Container(
              width: 100.0,
              height: 100.0,
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 102, 230, 106),
                  image: DecorationImage(
                      fit: BoxFit.scaleDown, image: NetworkImage("")),
                  borderRadius: BorderRadius.circular(10.0)),
            ),
          ),
        ),
      ]),
    );
  }
}

// import 'package:flutter/material.dart';
// import '../custom_image_view.dart';
// import '../image_constant.dart';
// import '../screens.dart';
// import '../size_utils.dart';
// import '../screens/Message.dart';
// import '../farmer/farmer.dart';

// class AddCart extends StatefulWidget {
//   const AddCart({super.key});

//   @override
//   State<AddCart> createState() => _AddCartState();
// }

// class _AddCartState extends State<AddCart> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       appBar: AppBar(
//         title: Text("Your Cart", style: TextStyle(color: Colors.white)),
//         centerTitle: true,
//         elevation: 0.0,
//         backgroundColor: Colors.green,
//         leading: IconButton(
//             icon: Icon(Icons.arrow_back, color: Colors.white),
//             onPressed: () {
//               Navigator.push(
//                   context, MaterialPageRoute(builder: (_) => HomeScreens()));
//             }),
//         actions: <Widget>[
//           IconButton(
//             icon: Icon(Icons.notification_add, color: Colors.white),
//             onPressed: () {
//               showSearch(
//                 context: context,
//                 delegate: CustomSearchDelegate(),
//               );
//             },
//           ),
//         ],
//       ),
//       bottomNavigationBar: Container(
//         height: 55,
//         width: MediaQuery.of(context).size.width,
//         decoration: BoxDecoration(color: Colors.green),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           children: [
//             Padding(
//               padding: EdgeInsets.all(10),
//               child: InkWell(
//                 onTap: () {
//                   Navigator.of(context).push(
//                       MaterialPageRoute(builder: (context) => HomeScreens()));
//                 },
//                 child: Container(
//                   child: CustomImageView(
//                     svgPath: ImageConstant.imgHome,
//                     height: getSize(35),
//                     width: getSize(35),
//                   ),
//                   height: 50,
//                   width: 50,
//                   // decoration: BoxDecoration(border: Border.all(width: 2)),
//                 ),
//               ),
//             ),
//             Padding(
//               padding: EdgeInsets.all(10),
//               child: InkWell(
//                 onTap: () {
//                   Navigator.of(context).push(
//                       MaterialPageRoute(builder: (context) => MessageScreen()));
//                 },
//                 child: Container(
//                   child: CustomImageView(
//                     svgPath: ImageConstant.imgLightbulb,
//                     height: getSize(35),
//                     width: getSize(35),
//                   ),
//                   height: 50,
//                   width: 50,
//                   // decoration: BoxDecoration(border: Border.all(width: 2)),
//                 ),
//               ),
//             ),
//             Padding(
//               padding: EdgeInsets.all(10),
//               child: InkWell(
//                 onTap: () {
//                   Navigator.of(context)
//                       .push(MaterialPageRoute(builder: (context) => AddCart()));
//                 },
//                 child: Container(
//                   child: CustomImageView(
//                     svgPath: ImageConstant.imgCart,
//                     height: getSize(35),
//                     width: getSize(35),
//                   ),
//                   height: 50,
//                   width: 50,
//                   // decoration: BoxDecoration(border: Border.all(width: 2)),
//                 ),
//               ),
//             ),
//             Padding(
//               padding: EdgeInsets.all(10),
//               child: InkWell(
//                 onTap: () {
//                   Navigator.of(context)
//                       .push(MaterialPageRoute(builder: (context) => Farmer()));
//                 },
//                 child: Container(
//                   child: CustomImageView(
//                     svgPath: ImageConstant.imgUser,
//                     height: getSize(35),
//                     width: getSize(35),
//                   ),
//                   height: 50,
//                   width: 50,
//                   // decoration: BoxDecoration(border: Border.all(width: 2)),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
