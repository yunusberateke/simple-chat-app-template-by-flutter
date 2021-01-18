import 'package:flutter/material.dart';

import '../../../constaints.dart';

class NameSurnameAndImageArea extends StatelessWidget {
  const NameSurnameAndImageArea({
    Key key,
    this.name,
    this.surname,
    this.imageUrl,
  }) : super(key: key);

  final String name;
  final String surname;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Spacer(),
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Merhaba,",
                  style: TextStyle(
                    color: kBackgroundColor,
                    fontSize: 14,
                  ),
                ),
                Text(
                  "$name $surname",
                  style: TextStyle(
                    color: kBackgroundColor,
                    fontSize: 24,
                  ),
                ),
              ],
            ),
            SizedBox(
              width: 10,
            ),
            CircleAvatar(
              radius: kDefaultPadding + 10,
              backgroundColor: kContentColor,
              child: CircleAvatar(
                backgroundImage: AssetImage(
                  "$imageUrl",
                ),
                radius: kDefaultPadding + 8,
              ),
            )
          ],
        ),
        SizedBox(
          width: kDefaultPadding,
        )
      ],
    );
  }
}
