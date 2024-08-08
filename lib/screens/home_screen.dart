// import 'package:comanda/screens/signin_screen.dart';
import 'package:comanda/utils/color_utils.dart';
// import 'package:comanda/widgets/reusable_widgets.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PageController pageController = PageController();
  int currentPage = 0;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    pageController.dispose();
  }

  changePage(int page) {
    pageController.jumpToPage(page);
    setState(() {
      currentPage = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          hexStringToColor("060061"),
          hexStringToColor("000500")
        ], begin: Alignment.topRight, end: Alignment.bottomLeft)),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
                20, MediaQuery.of(context).size.height * 0.08, 20, 0),
            child: const Column(
              children: [
                Text("Menù"),
                Row(
                  children: [
                    Text("Panino 1"),
                    Text("Panino 2"),
                    Text("Panino 3")
                  ],
                ),
                Text("panino 4"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
