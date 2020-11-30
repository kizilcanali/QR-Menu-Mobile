import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_mobile/screens/history.dart';
import 'package:qr_mobile/screens/home_body.dart';
import 'package:qr_mobile/screens/profile.dart';
import 'package:qr_mobile/services/authentication_service.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:qr_mobile/theme/constants.dart';

class HomePage extends StatefulWidget {
  static String routeName = '/waiterHome';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static int _currentScreen = 1;
  final List<Widget> screenList = [History(), HomeBody(), Profile()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          'Cafe 236',
          style: TextStyle(
            fontFamily: 'Cinzel',
            fontSize: 28,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              context.read<AuthenticationService>().signOut();
            },
            icon: Icon(Icons.exit_to_app, color: kSecondColor),
          ),
        ],
      ),
      bottomNavigationBar: ConvexAppBar(
        backgroundColor: kSecondColor,
        items: [
          TabItem(icon: Icons.history, title: 'Geçmiş'),
          TabItem(icon: Icons.home_outlined, title: 'Anasayfa'),
          TabItem(icon: Icons.person_outline, title: 'Profil'),
        ],
        initialActiveIndex: 1,
        onTap: (int index) {
          setState(() {
            _currentScreen = index;
          });
        },
      ),
      body: screenList[_currentScreen],
    );
  }
}
