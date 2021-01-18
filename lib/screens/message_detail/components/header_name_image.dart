import 'package:flutter/material.dart';

import '../../../constaints.dart';

class HeaderNameImage extends StatelessWidget {
  const HeaderNameImage({
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
        SizedBox(
          width: kDefaultPadding - 10,
        ),
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
        Spacer(),
        Container(
          height: MediaQuery.of(context).size.height * 0.15,
          width: MediaQuery.of(context).size.width * 0.65,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(150),
            ),
            color: kPrimaryColor,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                "$name $surname",
                style: TextStyle(
                  color: kContentColor,
                  fontSize: 19,
                ),
              ),
              SizedBox(
                width: kDefaultPadding - 5,
              ),
              CircleAvatar(
                radius: kDefaultPadding + 10,
                backgroundColor: kContentColor,
                child: CircleAvatar(
                  backgroundImage: AssetImage(
                    imageUrl,
                  ),
                  radius: kDefaultPadding + 8,
                ),
              ),
              SizedBox(
                width: 5,
              ),
            ],
          ),
        )
      ],
    );
  }
}
