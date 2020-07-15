import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dice game',
      home: LogIn(),
    );
  }
}

class LogIn extends StatefulWidget {
  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Log in'),
        backgroundColor: Colors.redAccent,
        centerTitle: true,
        leading: IconButton(icon: Icon(Icons.menu), onPressed: () {}),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search), onPressed: () {})
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(padding: EdgeInsets.only(top: 50)),
            Center(
              child: Image(
                image: AssetImage('image/chef.gif'),
                width: 170.0,
                height: 190.0,
              ),
            ),
            Form(
              child: Theme(
                  data: ThemeData(
                      primaryColor: Colors.teal,
                      inputDecorationTheme: InputDecorationTheme(
                          labelStyle:
                              TextStyle(color: Colors.teal, fontSize: 15.0))),
                  child: Container(
                    padding: EdgeInsets.all(40),
                    child: Column(
                      children: <Widget>[
                        TextField(
                          decoration:
                              InputDecoration(labelText: 'Enter "dice"'),
                          keyboardType: TextInputType.emailAddress,
                        ),
                        TextField(
                          decoration:
                              InputDecoration(labelText: 'Enter Password'),
                          keyboardType: TextInputType.text,
                          obscureText: true,
                        ),
                        SizedBox(height: 40.0,),
                        ButtonTheme(
                            //minwidth에 들어가면 숫자가 있을 텐데 가급적 해당 사이즈 이상으로 만들어라는 뜻임
                            minWidth: 100,
                            height: 50,
                            child: RaisedButton(
                              color: Colors.orangeAccent,
                              child: Icon(
                                Icons.arrow_forward,
                                color: Colors.white,
                                size: 35,
                              ),
                              onPressed: (){},
                            )
                        )
                      ],
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
