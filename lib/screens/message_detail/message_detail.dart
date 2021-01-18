import 'dart:async';
import 'dart:ui';

import 'package:chat_app/constaints.dart';
import 'package:chat_app/models/message_modal.dart';
import 'package:chat_app/screens/message_detail/components/message.dart';
import 'package:flutter/material.dart';

import 'components/header_name_image.dart';

class MessageDetail extends StatefulWidget {
  MessageDetail({Key key}) : super(key: key);

  @override
  _MessageDetailState createState() => _MessageDetailState();
}

class _MessageDetailState extends State<MessageDetail> {
  bool isLoading = true;
  void startTimer() {
    Timer.periodic(const Duration(milliseconds: 400), (t) {
      setState(() {
        isLoading = false; //set loading to false
      });
      t.cancel();
    });
  }

  @override
  void initState() {
    startTimer(); //start the timer on loading
    super.initState();
  }

  List<Message> _messages = [
    Message(
      message:
          "Dolores natus doloremque hic perspiciatis neque. Est provident perspiciatis nam ipsa voluptatem non exercitationem quia. Inventore in aut voluptatem. In officia facilis ea voluptas qui et. Autem ducimus impedit et repellendus.",
      date: "21.08",
      read: true,
      isMy: true,
    ),
    Message(
      message:
          "Dolores natus doloremque hic perspiciatis neque. Est provident perspiciatis nam ipsa voluptatem non exercitationem quia. Inventore in aut voluptatem. In officia facilis ea voluptas qui et. Autem ducimus impedit et repellendus.",
      date: "21.08",
      read: true,
      isMy: false,
    ),
    Message(
      message:
          "Dolores natus doloremque hic perspiciatis neque. Est provident perspiciatis nam ipsa voluptatem non exercitationem quia. Inventore in aut voluptatem. In officia facilis ea voluptas qui et. Autem ducimus impedit et repellendus.",
      date: "22.08",
      read: false,
      isMy: false,
    ),
    Message(
      message:
          "Dolores natus doloremque hic perspiciatis neque. Est provident perspiciatis nam ipsa voluptatem non exercitationem quia. Inventore in aut voluptatem. In officia facilis ea voluptas qui et. Autem ducimus impedit et repellendus.",
      date: "22.08",
      read: false,
      isMy: true,
    ),
    Message(
      message:
          "Dolores natus doloremque hic perspiciatis neque. Est provident perspiciatis nam ipsa voluptatem non exercitationem quia. Inventore in aut voluptatem. In officia facilis ea voluptas qui et. Autem ducimus impedit et repellendus.",
      date: "21.08",
      read: true,
      isMy: false,
    ),
    Message(
      message:
          "Dolores natus doloremque hic perspiciatis neque. Est provident perspiciatis nam ipsa voluptatem non exercitationem quia. Inventore in aut voluptatem. In officia facilis ea voluptas qui et. Autem ducimus impedit et repellendus.",
      date: "22.08",
      read: false,
      isMy: false,
    ),
    Message(
      message:
          "Dolores natus doloremque hic perspiciatis neque. Est provident perspiciatis nam ipsa voluptatem non exercitationem quia. Inventore in aut voluptatem. In officia facilis ea voluptas qui et. Autem ducimus impedit et repellendus.",
      date: "22.08",
      read: false,
      isMy: true,
    ),
  ];

  final messageController = TextEditingController();
  @override
  void dispose() {
    messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CircularProgressIndicator(
                    backgroundColor: kPrimaryColor,
                  ), //show this if state is loading
                ],
              ),
            )
          : SafeArea(
              child: Stack(
                children: [
                  buildColumnMessages(),
                  buildHeaderNameImageHeader(),
                  buildPositionedMessageTextField(),
                ],
              ),
            ),
    );
  }

  HeaderNameImage buildHeaderNameImageHeader() {
    return HeaderNameImage(
      name: "Berat",
      surname: "Eke",
      imageUrl: "assets/images/mypp.jpg",
    );
  }

  Column buildColumnMessages() {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            reverse: true,
            itemBuilder: (_, int index) => index == _messages.length - 1
                ? Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.16,
                      ),
                      _messages[index]
                    ],
                  ) // For first message padding top
                : _messages[index],
            itemCount: _messages.length,
          ),
        ),
        SizedBox(
          height: kDefaultPadding * 2,
        ),
      ],
    );
  }

  Positioned buildPositionedMessageTextField() {
    return Positioned(
      child: new Align(
        alignment: FractionalOffset.bottomCenter,
        child: Container(
          color: Colors.white.withOpacity(0.5),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  enableSuggestions: true,
                  enableInteractiveSelection: true,
                  controller: messageController,
                  decoration: new InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: kContentColor, width: 1.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                        color: kPrimaryColor,
                        width: 1.0,
                      ),
                    ),
                    hintText: 'Mesajınızı yazınız',
                  ),
                ),
              ),
              IconButton(
                icon: Icon(Icons.send),
                onPressed: () {
                  setState(
                    () => _messages.insert(
                        0,
                        Message(
                          message: messageController.text,
                          isMy: true,
                          read: false,
                          date:
                              (new DateTime.now()).toString().substring(10, 16),
                        )),
                  );
                  setState(
                    () => messageController.text = "",
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
