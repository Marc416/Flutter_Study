import 'package:flutter/material.dart';
import 'package:flutter_note_app/database/db.dart';
import 'package:flutter_note_app/database/memo.dart';
import 'package:crypto/crypto.dart';
import 'dart:convert'; // for the utf8.encode method

class EditPage extends StatelessWidget {
  String title = '';
  String text = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.save),
            onPressed: saveDB,

          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            TextField(
              obscureText: false,
              onChanged: (String title) {
                this.title = title;
              },
              style: TextStyle(fontSize: 37, fontWeight: FontWeight.w800),
              decoration: InputDecoration(
//              border: OutlineInputBorder(),
//              labelText: '제목을 적어주세요',////보조 설명으로 위로 올라가는 글자임
                hintText: '제목을 적어주세요', ////뭐를 적게 할 때는 주로 힌트 텍스트를 씀

              ),
            ),
            Padding(
              padding: EdgeInsets.all(20),
            ),
            TextField(
              //텍스트필드에서 string으로 전달 된 것을 edit의 this.text 변수에 변하는 순간 저장
              onChanged: (String text) {
                this.text = text;
              },
              //글자를 아래쪽으로 내리고 싶다면 keyboardType을 아래와 같이 정해주고
              //꼭 max Line을 정해줘야 함. 지금 현재는 null상태로 무제한이라는 뜻임
              keyboardType: TextInputType.multiline,
              maxLines: null,

              decoration: InputDecoration(
//              border: OutlineInputBorder(),
//              labelText: '제목을 적어주세요',////보조 설명으로 위로 올라가는 글자임
                hintText: '내용을 적어주세요', ////뭐를 적게 할 때는 주로 힌트 텍스트를 씀
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> saveDB() async {
    DBHelper sd = DBHelper();

    var fido = Memo(
      id: Str2sha512(DateTime.now().toString()),
      title: this.title,
      text: this.text,
      createTime: DateTime.now().toString(),
      editTime: DateTime.now().toString(),
    );
    await sd.insertMemo(fido);

    print(await sd.memos());
  }

  String Str2sha512(String text) {
    var bytes = utf8.encode(text); // data being hashed

    var digest = sha512.convert(bytes);

    return digest.toString();
  }
}
