import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Appbar',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.red),
      home: MyPage(),
    );
  }
}

class MyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Appbar icon menu'),
        centerTitle: true,
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              print('Shopping Cart Button is clicked');
            },
          ),
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              print('Search is clicked');
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              //햄버거 클릭시 메뉴부분을 이야기함
              //currentAccountPicture-> 현재 사용자의 어카운트를 알려줌
              otherAccountsPictures: <Widget>[
                CircleAvatar(
                  backgroundImage: AssetImage('assets/boss.png'),
                  backgroundColor: Colors.white,
                ),
//                CircleAvatar(
//                  backgroundImage: AssetImage('assets/boss.png'),
//                  backgroundColor: Colors.white,
//                ),
              ],
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('assets/boss.png'),
                backgroundColor: Colors.white,
              ),
              accountEmail: Text('dreamrunner416@gmail.com'),
              accountName: Text('Jooni'),
              onDetailsPressed: () {
                print('Detail pressed');
              },
              //디테일을 보여주는 밑으로 펼쳐지는 기능

              decoration: BoxDecoration(
                  color: Colors.red[600],
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40.0),
                    bottomRight: Radius.circular(40.0),
                  )
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.home,
                color: Colors.grey[850],
              ),
              title: Text('Home'),
              onTap: (){
                print('Home is clicked');
              },
              trailing: Icon(Icons.add),
            ),
            ListTile(
              leading: Icon(
                Icons.settings,
                color: Colors.grey[850],
              ),
              title: Text('Setting'),
              onTap: (){
                print('Setting is clicked');
              },
              trailing: Icon(Icons.add),
            ),
            ListTile(
              leading: Icon(
                Icons.question_answer,
                color: Colors.grey[850],
              ),
              title: Text('Q&A'),
              onTap: (){
                print('Q&A is clicked');
              },
              trailing: Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}
