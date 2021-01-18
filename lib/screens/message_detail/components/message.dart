import 'package:flutter/material.dart';

import '../../../constaints.dart';

class Message extends StatelessWidget {
  const Message({
    Key key,
    this.message,
    this.date,
    this.read,
    this.isMy,
  }) : super(key: key);

  final String message;
  final String date;
  final bool read;
  final bool isMy;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isMy ? Alignment.bottomLeft : Alignment.bottomRight,
      child: Padding(
        padding: const EdgeInsets.only(
          left: kDefaultPadding - 7,
          bottom: kDefaultPadding,
        ),
        child: Container(
          width: MediaQuery.of(context).size.width * 0.7,
          decoration: BoxDecoration(
            color: kContentColor.withOpacity(0.8),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(
              kDefaultPadding - 10,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(message),
                SizedBox(
                  height: kDefaultPadding - 10,
                ),
                Row(
                  children: [
                    Text(date),
                    Spacer(),
                    Icon(
                      read ? Icons.check : Icons.close,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
