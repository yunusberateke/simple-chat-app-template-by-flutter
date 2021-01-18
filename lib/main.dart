import 'package:chat_app/screens/friends_list/friends_list_screen.dart';
import 'package:chat_app/screens/message_detail/message_detail.dart';
import 'package:chat_app/screens/onboarding/OnBoardingScreen.dart';
import 'package:chat_app/screens/profile/profile_screen.dart';
import 'package:chat_app/screens/splash/SplashScreen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Map<String, WidgetBuilder> routes = {
      "/": (context) => OnBoardingPage(),
      "message_detail": (context) => MessageDetail(),
      "friend_list_screen": (context) => FriendListScreen(),
      "profile": (context) => ProfileScreen()
    };
    return MaterialApp(
      title: 'Material App',
      routes: routes,
      debugShowCheckedModeBanner: false,
    );
  }
}
