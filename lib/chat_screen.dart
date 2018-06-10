import 'package:flutter/material.dart';
import 'package:flutter_demo/chart_message.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => new _ChatScreenState();
}



class _ChatScreenState extends State<ChatScreen> {
  TextEditingController textEditingController = new TextEditingController();
  List<ChatMessage> messages = <ChatMessage>[];


  void handleSubmitted(String text){
    textEditingController.clear();
    ChatMessage m = new ChatMessage(text);
    setState((){
      messages.insert(0, m);
    });

  }

  Widget textComposeWidget(){
    return new IconTheme(
        data: new IconThemeData(
          color: Colors.blue,

        ),
        child: new Container(
          margin: const EdgeInsets.symmetric(horizontal: 8.0),
          child: new Row(
            children: <Widget>[
              new Flexible(
                  child: new TextField(
                      decoration: new InputDecoration.collapsed(
                          hintText: "Send a message"
                      ),
                    controller: textEditingController,
                  )),
              new Container(
                margin: const EdgeInsets.symmetric(horizontal: 4.0),
                child: new IconButton(icon: new Icon(Icons.send),
                    onPressed:()=> handleSubmitted(textEditingController.text)),
              )
            ],
          ),
        )
    );
  }


  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
        new Flexible(
          child: new ListView.builder(
              padding: new EdgeInsets.all(8.0),
              reverse: true,
              itemBuilder: (context,int index) => messages[index],
              itemCount: messages.length,
          ),
          ),
        new Container(
          decoration: new BoxDecoration(
            color: Theme.of(context).cardColor,
          ),
          child: textComposeWidget(),
        ),
      ],
    );
  }
}
