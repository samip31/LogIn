import 'package:flutter/material.dart';

class TestScreen extends StatefulWidget {
  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
int _index=0;
PageController controller = PageController(


initialPage: 0
);

  @override
  Widget build(BuildContext context) {

    List<Widget> Screens=[
      Center(
       child: Text("Home"),
      ),
      Center(
        child: Text("Carts"),
      ),
      Center(
        child: Text("Profile"),
      ),
      Center(
        child: Text("Us"),
      )
    ];
    return Scaffold(
      appBar: AppBar(

      ),
      body: SafeArea(
        child:PageView(
          controller: controller,
          onPageChanged: (page){
            setState(() {
              _index=page;
            });
          },
          children: Screens,
        )
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.blue,
        selectedIconTheme:
        Theme.of(context).iconTheme.copyWith(size: 30, color: Colors.blue),
        iconSize: 30,
        unselectedItemColor: Colors.black54,
        showUnselectedLabels: true,
        showSelectedLabels: true,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 12,
        onTap: (index) {
         setState(() {
           controller.jumpToPage(index);
           _index = index;


         });
        },
        currentIndex: _index,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: "Your Cart",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: "About Us",
          ),
        ],
      )
    );
  }
}
