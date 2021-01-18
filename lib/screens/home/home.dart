import 'dart:async';

import 'package:chat_app/constaints.dart';
import 'package:flutter/material.dart';

import 'components/name_surname_and_image_area.dart';
import 'components/short_message_card.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: buildDrawer(),
      backgroundColor: kPrimaryColor,
      body: SafeArea(
        child: Stack(
          children: [
            buildContainerHeaderArea(),
            buildPositionedBody(context),
          ],
        ),
      ),
    );
  }

  Drawer buildDrawer() {
    return Drawer(
      child: SafeArea(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            ListTile(
              title: Text('Profil'),
              leading: Icon(Icons.person),
              onTap: () {
                Navigator.pushNamed(context, "profile");
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Ayarlar'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
          ],
        ),
      ),
    );
  }

  Positioned buildPositionedBody(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.78,
        decoration: BoxDecoration(
          color: kBackgroundColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
        ),
        child: Container(
          padding: EdgeInsets.only(
            left: kDefaultPadding * 0.4,
            top: kDefaultPadding * 0.4,
          ),
          child: buildSingleChildScrollViewMessageArea(context),
        ),
      ),
    );
  }

  Container buildContainerHeaderArea() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: kDefaultPadding,
            ),
            child: IconButton(
              icon: Icon(
                Icons.short_text,
                color: kBackgroundColor,
                size: kDefaultPadding * 1.2,
              ),
              onPressed: () => {_scaffoldKey.currentState.openDrawer()},
            ),
          ),
          NameSurnameAndImageArea(
            name: "Berat",
            surname: "EKE",
            imageUrl: "assets/images/mypp.jpg",
          )
        ],
      ),
    );
  }

  SingleChildScrollView buildSingleChildScrollViewMessageArea(
      BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: [
            SizedBox(
              height: kDefaultPadding - 10,
            ),
            buildContainerNewMessage(context),
            SizedBox(
              height: kDefaultPadding,
            ),
            ShortMessageCard(
              name: "Adward",
              surname: "Answi",
              date: "20.30",
              imageUrl: "assets/images/aykutelmas.jpg",
              shortMessage: "Deleniti sequi quam quia  ...",
              unreadMessageCount: 1,
              online: true,
            ),
            SizedBox(
              height: kDefaultPadding,
            ),
            ShortMessageCard(
              name: "Andree",
              surname: "Kleps",
              date: "17.41",
              imageUrl: "assets/images/pp2.jpg",
              shortMessage: "Yüzüne bakamam yüzüm ...",
              unreadMessageCount: 4,
              online: true,
            ),
            SizedBox(
              height: kDefaultPadding,
            ),
            ShortMessageCard(
              name: "Leo",
              surname: "Red",
              date: "11.22",
              imageUrl: "assets/images/pp3.jpg",
              shortMessage: "Önce emniyet sonra hoşgörü ...",
              unreadMessageCount: 2,
              online: false,
            ),
            SizedBox(
              height: kDefaultPadding,
            ),
            ShortMessageCard(
              name: "Pisko",
              surname: "Lesfi",
              date: "13.33",
              imageUrl: "assets/images/pp4.jpeg",
              shortMessage: "Exercitationem molestiae qu...",
              unreadMessageCount: 8,
              online: false,
            ),
            SizedBox(
              height: kDefaultPadding,
            ),
            ShortMessageCard(
              name: "Agenta",
              surname: "Ans",
              date: "20.30",
              imageUrl: "assets/images/pp5.jpg",
              shortMessage: "Deleniti sequi quam quia...",
              unreadMessageCount: 7,
              online: true,
            ),
            SizedBox(
              height: kDefaultPadding,
            ),
            ShortMessageCard(
              name: "Agenta",
              surname: "Ans",
              date: "20.30",
              imageUrl: "assets/images/pp5.jpg",
              shortMessage: "Deleniti sequi quam quia...",
              unreadMessageCount: 7,
              online: false,
            ),
            SizedBox(
              height: kDefaultPadding,
            ),
          ],
        ),
      ),
    );
  }

  GestureDetector buildContainerNewMessage(BuildContext context) {
    return GestureDetector(
      child: Container(
        child: Row(
          children: [
            Container(
              width: MediaQuery.of(context).size.width - kDefaultPadding + 8,
              decoration: BoxDecoration(
                color: kContentColor.withOpacity(0.7),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(kDefaultPadding - 13),
                child: Center(
                  child: Text(
                    "Yeni Mesaj Gönder",
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: kDefaultPadding - 8),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      onTap: () {
        Navigator.pushNamed(context, "friend_list_screen");
      },
    );
  }
}
