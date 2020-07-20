import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_note_app/database/db.dart';
import 'package:flutter_note_app/database/memo.dart';
import 'package:flutter_note_app/screens/edit.dart';
import 'package:flutter_note_app/screens/view.dart';
import 'package:typed_data/typed_buffers.dart';
import 'package:meta/meta.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String deleteId = '';
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 20, top: 20, bottom: 20),
            child: Text(
              '메모메모',
              style: TextStyle(color: Colors.blue, fontSize: 36),
            ),
          ),
          Expanded(child: memoBuilder(context)),
//          memoBuilder()
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
                  context, CupertinoPageRoute(builder: (context) => EditPage()))
              .then((value) {
            setState(() {});
          });
        },
        tooltip: '노트추가',
        label: Text('메모추가'),
        icon: Icon(Icons.add),
      ),
    );
  }

  Future<List<Memo>> loadMemo() async {
    DBHelper sd = DBHelper();
    return await sd.memos();
  }

  Future<void> deleteMemo(String id) async {
    DBHelper sd = DBHelper();
    return await sd.deleteMemo(id);
  }

  void showAlertDialog(BuildContext context) async {
    String result = await showDialog(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('삭제 경고'),
          content: Text("정말 삭제하시겠습니까?\n 삭제된 메모는 복구되지 않습니다"),
          actions: <Widget>[
            FlatButton(
              child: Text('삭제'),
              onPressed: () {
                Navigator.pop(context, "삭제");
                setState(() {
                  deleteMemo(deleteId);
                });
              },
            ),
            FlatButton(
              child: Text('취소'),
              onPressed: () {
                Navigator.pop(context, "취소");
                deleteId = '';
              },
            ),
          ],
        );
      },
    );
  }

  Widget memoBuilder(BuildContext parentContext) {
    return FutureBuilder(
      builder: (context, snap) {
        if (snap.data == null) {
          return Container(
            child: Text('메모를 추가해라'),
          );
        }
        return ListView.builder(
          physics: ScrollPhysics(),
          itemCount: snap.data.length,
          itemBuilder: (context, index) {
            Memo memo = snap.data[index];
            return InkWell(
              onTap: () {
                Navigator.push(parentContext,
                    CupertinoPageRoute(builder: (context) => ViewPage(id: memo.id)));
              }, //일반 클릭
              onLongPress: () {
                //꾹누르면
                setState(() {
                  deleteId = memo.id;
                  showAlertDialog(parentContext);
//                  deleteId = '';  ////showAlertDialog가 await이기 때문에 Id반환을 받아야 실행되는데 r
                  //지금 여기서 아이디를 지웠기 때문에 아이디 지우는 것(리셋)은 취소<-에서 해주는걸로한다.
                });
              },
              child: Container(
                alignment: Alignment.center,
                margin: EdgeInsets.all(5),
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white70,
                  border: Border.all(color: Colors.blueAccent, width: 2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            memo.title,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            memo.text,
                            style: TextStyle(fontSize: 15),
                          ),
                        ]),

                    Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Text(
                            '최종 수정시간 : ' + memo.editTime.split('.')[0],
                            style: TextStyle(fontSize: 11),
                          ),
                        ])
                    // Widget to display the list of project
                  ],
                ),
              ),
            );
          },
        );
      },
      future: loadMemo(),
    );
  }
}
