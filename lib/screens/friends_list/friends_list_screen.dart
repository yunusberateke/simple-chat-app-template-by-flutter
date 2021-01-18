import 'package:flutter/material.dart';

import '../../constaints.dart';

class FriendListScreen extends StatefulWidget {
  FriendListScreen({Key key}) : super(key: key);

  @override
  _FriendListScreenState createState() => _FriendListScreenState();
}

class _FriendListScreenState extends State<FriendListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            buildColumnFriends(),
            buildRowHeader(context),
          ],
        ),
      ),
    );
  }

  Column buildColumnFriends() {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: 30,
            itemBuilder: (_, int index) => index == 0
                ? SizedBox(
                    height: kDefaultPadding * 4,
                  )
                : ListTile(
                    onTap: () {
                      Navigator.pushNamed(context, "message_detail");
                    },
                    leading: CircleAvatar(),
                    title: Text("Berat Ark"),
                    subtitle: Text("Açıklama"),
                  ),
          ),
        ),
      ],
    );
  }

  Row buildRowHeader(BuildContext context) {
    return Row(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.15,
          width: MediaQuery.of(context).size.width * 0.65,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(150),
            ),
            color: kPrimaryColor,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: kDefaultPadding - 5,
              ),
              Text(
                "Arkadaşlarım",
                style: TextStyle(
                  color: kContentColor,
                  fontSize: 19,
                ),
              ),
              SizedBox(
                width: 5,
              ),
            ],
          ),
        ),
        Spacer(),
        Container(
          decoration: BoxDecoration(
            color: Colors.black12,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(1),
            child: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: kPrimaryColor,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ),
        SizedBox(
          width: kDefaultPadding - 10,
        ),
      ],
    );
  }
}
