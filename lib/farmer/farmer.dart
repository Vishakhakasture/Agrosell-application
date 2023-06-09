import 'package:agrosellapp/farmer/sidebar.dart';
import 'package:agrosellapp/screens.dart';
import 'package:agrosellapp/farmer/product.dart';
import 'package:agrosellapp/farmer/view.dart';
import 'package:flutter/material.dart';

import '../custom_image_view.dart';
import '../customer/cart.dart';
import '../image_constant.dart';
import '../screens/Message.dart';
import '../size_utils.dart';

class Farmer extends StatefulWidget {
  const Farmer({super.key});

  @override
  State<Farmer> createState() => _FarmerState();
}

class _FarmerState extends State<Farmer> {
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
        ),
        body: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 15,
            ),
            Container(
              child: Text(
                'Sell Your products',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(),
            Container(
              width: 300,
              height: 150,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    "https://t3.ftcdn.net/jpg/03/88/54/50/360_F_388545000_s4RsrD79y9GA04jkCsM8SX3wOaO9nSOW.jpg",
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    MaterialButton(
                      // minWidth: double.infinity,
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ProductInfo()));
                      },
                      child: Text(
                        ' Add ',
                        style: TextStyle(fontSize: 20),
                      ),
                      color: Colors.green,
                      textColor: Colors.white,
                    ),
                  ],
                ),
                Column(
                  children: [
                    MaterialButton(
                      // minWidth: double.infinity,
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ViewProduct()));
                      },
                      child: Text(
                        ' View ',
                        style: TextStyle(fontSize: 20),
                      ),
                      color: Colors.green,
                      textColor: Colors.white,
                    ),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    MaterialButton(
                      // minWidth: double.infinity,
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ProductInfo()));
                      },
                      child: Text(
                        'Update',
                        style: TextStyle(fontSize: 20),
                      ),
                      color: Colors.green,
                      textColor: Colors.white,
                    ),
                  ],
                ),
                Column(
                  children: [
                    MaterialButton(
                      // minWidth: double.infinity,
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ProductInfo()));
                      },
                      child: Text(
                        'Delete',
                        style: TextStyle(fontSize: 20),
                      ),
                      color: Colors.green,
                      textColor: Colors.white,
                    ),
                  ],
                ),
              ],
            ),
          ],
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
                        builder: (context) => MessageScreen()));
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
