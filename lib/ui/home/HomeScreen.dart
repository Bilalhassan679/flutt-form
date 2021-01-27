import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login_screen/constants.dart';
import 'package:flutter_login_screen/model/User.dart';
import 'package:flutter_login_screen/ui/auth/AuthScreen.dart';
import 'package:flutter_login_screen/ui/formpage/formpage.dart';
import 'package:flutter_login_screen/ui/services/Authenticate.dart';
import 'package:flutter_login_screen/ui/utils/helper.dart';
// import 'package:simple_slider/simple_slider.dart';

import '../../main.dart';

FireStoreUtils _fireStoreUtils = FireStoreUtils();

class HomeScreen extends StatefulWidget {
  final User user;

  HomeScreen({Key key, @required this.user}) : super(key: key);

  @override
  State createState() {
    print(user.toString());
    return _HomeState(user);
  }
}

class _HomeState extends State<HomeScreen> {
  final User user;

  _HomeState(this.user);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text(
                'Drawer Header',
                style: TextStyle(color: Colors.white),
              ),
              decoration: BoxDecoration(
                color: Color(COLOR_PRIMARY),
              ),
            ),
            ListTile(
              title: Text(
                'Logout',
                style: TextStyle(color: Colors.black),
              ),
              leading: Transform.rotate(
                  angle: pi / 1,
                  child: Icon(Icons.exit_to_app, color: Colors.black)),
              onTap: () async {
                user.active = false;
                user.lastOnlineTimestamp = Timestamp.now();
                _fireStoreUtils.updateCurrentUser(user, context);
                await FirebaseAuth.instance.signOut();
                MyAppState.currentUser = null;
                pushAndRemoveUntil(context, AuthScreen(), false);
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text(
          'Home',
          style: TextStyle(color: Colors.black),
        ),
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Image.asset('assets/images/ic_best_food_2.jpeg'),
            // Image(
            //   image: AssetImage('assets/images/placeholder.jpg'),
            // ),
            // ImageSliderWidget(),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.network(
                    'https://pbs.twimg.com/profile_images/572395168905457664/lCtqj0ak.jpeg',
                    height: 200,
                    width: 165,
                  ),
                  Image.network(
                    'https://images.squarespace-cdn.com/content/v1/540f9f10e4b04f85eb69113d/1541286147844-I233LOBHEL0FHBA0OE6H/ke17ZwdGBToddI8pDm48kLkXF2pIyv_F2eUT9F60jBl7gQa3H78H3Y0txjaiv_0fDoOvxcdMmMKkDsyUqMSsMWxHk725yiiHCCLfrh8O1z4YTzHvnKhyp6Da-NYroOW3ZGjoBKy3azqku80C789l0iyqMbMesKd95J-X4EagrgU9L3Sa3U8cogeb0tjXbfawd0urKshkc5MgdBeJmALQKw/The+Bench+Burger.jpg',
                    height: 200,
                    width: 250,
                  ),
                ],
              ),
            ),
            Wrap(
              children: [
                Text(
                  'knclknkmasmlkc',
                ),
              ],
            ),
            RaisedButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/pageForm');
              },
            ),
          ],
        ),
      ),
      // body: Center(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     mainAxisSize: MainAxisSize.max,
      //     crossAxisAlignment: CrossAxisAlignment.center,
      //     children: <Widget>[
      //       displayCircleImage(user.profilePictureURL, 125, false),
      //       Padding(
      //         padding: const EdgeInsets.all(8.0),
      //         child: Text(user.firstName),
      //       ),
      //       Padding(
      //         padding: const EdgeInsets.all(8.0),
      //         child: Text(user.email),
      //       ),
      //       Padding(
      //         padding: const EdgeInsets.all(8.0),
      //         child: Text(user.phoneNumber),
      //       ),
      //       Padding(
      //         padding: const EdgeInsets.all(8.0),
      //         child: Text(user.userID),
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}
