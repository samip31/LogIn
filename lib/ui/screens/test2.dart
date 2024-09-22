import 'package:flutter/material.dart';

class TestScreen2 extends StatefulWidget {


  @override
  _TestScreen2State createState() => _TestScreen2State();
}

class _TestScreen2State extends State<TestScreen2> {
  int _index= 0;
  List<BottomNavigationBarItem> bottomItems =[
    BottomNavigationBarItem(icon: Icon(Icons.pages),label: "1"),
    BottomNavigationBarItem(icon: Icon(Icons.pages),label: "2"),

  ];
  PageController controller= PageController(
    initialPage: 0
  );
  List<Widget> Pages=[
    Text("Content1"),
    Text("Content2")

  ];
  @override
  Widget build(BuildContext context) {
    Color ContainerColor= Colors.blue;
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: ListView(
          children: [
            // BottomNavigationBar(items:bottomItems,
            //
            // currentIndex: _index,
            // onTap: (index){
            //   setState(() {
            //     _index= index;
            //     controller.jumpToPage(index);
            //   });
            // },),
            Container(
              child: Row(

                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        _index=0;
                        controller.jumpToPage(_index);
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: _index==0?Colors.blue:Colors.white,
                      ),

                      padding: EdgeInsets.all(20),
                      margin: EdgeInsets.all(10),
                      child: Text("Page1",
                      style: TextStyle(
                        fontSize: 25
                      ),),

                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        _index=1;
                        controller.jumpToPage(_index);
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: _index==1?Colors.blue:Colors.white,
                      ),

                      padding: EdgeInsets.all(20),
                      margin: EdgeInsets.all(10),

                      child: Text("Page2",
                        style: TextStyle(
                            fontSize: 25
                        ),),

                    ),
                  )
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height,
              child: PageView(

                controller: controller,
                onPageChanged: (index){
                  setState(() {
                    _index = index;
                  });
                },
                children: Pages,
              ),
            )
          ],
        ),
      ),
    );
  }
}
