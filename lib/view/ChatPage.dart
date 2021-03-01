import 'package:flutter/material.dart';
import 'package:drugstore_io/controller/ChatManager.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key key}) : super(key: key);
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  ChatManager chatManager;
  final List<Widget> _messages = <Widget>[
    new ChatMessage(
      text:
          "Hi! I am Dr. Virtual, your virtual medical diagnosis chatbot to assist with your checkup. " +
              "May I know what concerns you about your health? " +
              "Please describe your symptoms to me :)",
      name: "Dr. Virtual",
      type: false,
    ),
  ];
  final TextEditingController _textController = new TextEditingController();

  @override
  void initState() {
    super.initState();
    chatManager = ChatManager.setMessageListener(sendMessageListener);
  }

  void sendMessageListener(Widget msg) {
    setState(() {
      _messages.insert(0, msg);
    });
  }

  void _handleSubmitted(String text) {
    if (text == "" || text.trim().isEmpty) {
      return;
    }
    _textController.clear();
    ChatMessage message = new ChatMessage(
      text: text,
      name: "Me",
      type: true,
    );
    setState(() {
      _messages.insert(0, message);
    });
    chatManager.generateVirtualResponse(text);
    //response(text);
  }

  @override
  Widget build(BuildContext context) {
    if (_messages.length < 2)
      _messages.insert(0, ChatOption(["option1"], _handleSubmitted));
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(
          '',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      body: new Column(children: <Widget>[
        new Flexible(
          child: _buildChatBody(),
        ),
        new Divider(height: 1.0),
        new Container(
          decoration: new BoxDecoration(color: Theme.of(context).cardColor),
          child: _buildTextComposer(),
        ),
      ]),
    );
  }

  void response(text) {
    _textController.clear();
    ChatMessage message;
    if (text == "Yes" || text == "yes") {
      message = new ChatMessage(
        text:
            "Awesome! Your status has been updated. We look forward to seeing you!",
        name: "Dr. Virtual",
        type: false,
      );
    } else if (text == "No" || text == "no") {
      message = new ChatMessage(
        text:
            "So sorry to hear that you can't join the event! Do look out for our other events. Hope to see you soon!",
        name: "Dr. Virtual",
        type: false,
      );
    } else if (text == "What are badges?") {
      message = new ChatMessage(
        text:
            "Badges are a way to show your friends what you are most passionate about! You can earn badges by volunteering in relevant projects. Head over to the main page to see your progress towards getting the badges as well as which volunteering events can help you achieve certain badges!",
        name: "Dr. Virtual",
        type: false,
      );
    } else {
      message = new ChatMessage(
        text: "Sorry, I did not understand that.",
        name: "Dr. Virtual",
        type: false,
      );
    }
    setState(() {
      _messages.insert(0, message);
    });
  }

  Widget _buildChatBody() {
    return new Container(
      height: 498,
      width: 400,
      child: new ListView.builder(
        padding: new EdgeInsets.all(8.0),
        reverse: true,
        itemBuilder: (_, int index) => _messages[index],
        itemCount: _messages.length,
      ),
      decoration: BoxDecoration(
        color: const Color(0xffffffff),
        image: DecorationImage(
            image: AssetImage("images/rafiki.png"),
            colorFilter: new ColorFilter.mode(
                Colors.white.withOpacity(0.3), BlendMode.dstATop),
            fit: BoxFit.fitWidth,
            alignment: Alignment.topCenter),
      ),
    );
  }

  Widget _buildTextComposer() {
    return new IconTheme(
      data: new IconThemeData(color: Theme.of(context).accentColor),
      child: new Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        child: new Row(
          children: <Widget>[
            new Flexible(
              child: new TextField(
                controller: _textController,
                onSubmitted: _handleSubmitted,
                decoration:
                    new InputDecoration.collapsed(hintText: "Send a message"),
              ),
            ),
            new Container(
              margin: new EdgeInsets.symmetric(horizontal: 4.0),
              child: new IconButton(
                  icon: new Icon(Icons.send),
                  onPressed: () => _handleSubmitted(_textController.text)),
            ),
          ],
        ),
      ),
    );
  }
}

class ChatMessage extends StatelessWidget {
  ChatMessage({this.text, this.name, this.type});

  final String text;
  final String name;
  final bool type;

  List<Widget> otherMessage(context) {
    return <Widget>[
      new Container(
        margin: const EdgeInsets.only(right: 16.0),
        child: new CircleAvatar(
          radius: 30.0,
          backgroundImage: NetworkImage(
              'https://thumbs.dreamstime.com/b/smiling-woman-vector-illustration-young-happy-student-happy-girl-adult-beauty-person-healthy-71801962.jpg'),
          backgroundColor: Colors.transparent,
        ),
      ),
      new Expanded(
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Text(this.name,
                style:
                    new TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            new Container(
                margin: const EdgeInsets.only(top: 5.0),
                child: _buildMessageBubble(text, false)),
          ],
        ),
      ),
    ];
  }

  List<Widget> myMessage(context) {
    return <Widget>[
      new Expanded(
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            new Text(this.name,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            new Container(
                margin: const EdgeInsets.only(top: 5.0),
                child: _buildMessageBubble(text, true)),
          ],
        ),
      ),
      new Container(
        margin: const EdgeInsets.only(left: 16.0),
        child: new CircleAvatar(
          radius: 30.0,
          backgroundImage: NetworkImage(
              'https://www.straitstimes.com/sites/default/files/styles/medium/public/articles/2017/09/10/st_20170910_cyyoungashley_3408138.jpg?itok=2ZyC_nAZ'),
          backgroundColor: Colors.transparent,
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: new Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: this.type ? myMessage(context) : otherMessage(context),
      ),
    );
  }
}

Widget _buildMessageBubble(msgText, user) {
  return new Material(
    borderRadius: BorderRadius.only(
      bottomLeft: Radius.circular(20),
      topLeft: user ? Radius.circular(20) : Radius.circular(0),
      bottomRight: Radius.circular(20),
      topRight: user ? Radius.circular(0) : Radius.circular(20),
    ),
    color: user ? Colors.blue : Colors.grey[200],
    elevation: 5,
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: Text(
        msgText,
        style: TextStyle(
          color: user ? Colors.white : Color(0xFF333333),
          fontFamily: 'Poppins',
          fontSize: 15,
        ),
      ),
    ),
  );
}

class ChatOption extends StatefulWidget {
  ChatOption(this.options, this.sendChatMessage);

  final List<String> options;
  final sendChatCallback sendChatMessage;

  @override
  _ChatOptionState createState() => _ChatOptionState();
}

class _ChatOptionState extends State<ChatOption> {
  int selectedIndex = -1;

  @override
  Widget build(BuildContext buildContext) {
    return new Wrap(
        alignment: WrapAlignment.end,
        runAlignment: WrapAlignment.end,
        crossAxisAlignment: WrapCrossAlignment.end,
        direction: Axis.horizontal,
        spacing: 5,
        children: <Widget>[
          for (int index = 0; index < widget.options.length; index++)
            ChoiceChip(
              label: Text(
                widget.options[index],
                style: TextStyle(
                  fontFamily: 'Poppin',
                  fontWeight: FontWeight.bold,
                  color: selectedIndex == index ? Colors.white : Colors.blue,
                ),
              ),
              backgroundColor: Color(0xFFFFFFFF),
              selected: selectedIndex == index,
              selectedColor: Colors.blue,
              onSelected: (bool selected) {
                setState(() {
                  selectedIndex = selected ? index : selectedIndex;
                  widget.sendChatMessage(widget.options[index]);
                });
              },
              shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.all(new Radius.circular(20.0)),
                side: BorderSide(
                  width: 1,
                  color: Colors.blue,
                ),
              ),
            )
        ]);
  }
}

typedef sendChatCallback = void Function(String text);
