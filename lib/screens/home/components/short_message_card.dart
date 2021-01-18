import 'package:flutter/material.dart';

import '../../../constaints.dart';

class ShortMessageCard extends StatelessWidget {
  const ShortMessageCard({
    Key key,
    this.imageUrl,
    this.name,
    this.surname,
    this.date,
    this.shortMessage,
    this.unreadMessageCount,
    this.online,
  }) : super(key: key);

  final String imageUrl;
  final String name;
  final String surname;
  final String date;
  final String shortMessage;
  final int unreadMessageCount;
  final bool online;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, "message_detail");
      },
      child: Container(
        child: Row(
          children: [
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 10, bottom: 10),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: online
                          ? Colors.green.withOpacity(0.7)
                          : Colors.red.withOpacity(0.7),
                    ),
                    padding: EdgeInsets.all(2),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        "$imageUrl",
                        height: kDefaultPadding * 2,
                        width: kDefaultPadding * 2,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  right: 0,
                  bottom: 0,
                  child: Container(
                    width: 25,
                    height: 25,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                      color: Colors.green.withOpacity(0.8),
                    ),
                    child: Center(
                      child: Text(
                        unreadMessageCount > 9 ? "9+" : "$unreadMessageCount",
                        style: TextStyle(
                          color: kBackgroundColor,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              width: 8,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.77,
              decoration: BoxDecoration(
                color: kContentColor.withOpacity(0.7),
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    spreadRadius: 1,
                    blurRadius: 2,
                    offset: Offset(2, 4),
                  )
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(kDefaultPadding - 20),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "$name $surname",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text("$shortMessage"),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                    Spacer(),
                    Column(
                      children: [
                        SizedBox(
                          height: 3,
                        ),
                        Text(
                          "$date",
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
