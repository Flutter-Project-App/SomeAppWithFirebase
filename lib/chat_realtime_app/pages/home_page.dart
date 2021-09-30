import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:some_app_firebase/chat_realtime_app/dao/message_dao.dart';
import 'package:some_app_firebase/chat_realtime_app/models/message_model.dart';
import 'package:some_app_firebase/chat_realtime_app/widgets/message_list_widget.dart';

class HomePage extends StatefulWidget {
  final messageDao = MessageDao();

  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _messageController = TextEditingController();
  var _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance!
        .addPostFrameCallback((timeStamp) => _scrollToBottom());
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            _getMessageList(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: TextField(
                      // keyboardType: TextInputType.text,
                      controller: _messageController,
                      onChanged: (text) {
                        setState(() {});
                      },
                      onSubmitted: (input) {
                        _sendMessage();
                      },
                      decoration:
                          InputDecoration(hintText: 'Enter new message'),
                    ),
                  ),
                ),
                IconButton(
                    onPressed: () => _sendMessage(),
                    icon: Icon(_canSendMessage()
                        ? CupertinoIcons.arrow_right_circle_fill
                        : CupertinoIcons.arrow_right_circle))
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _getMessageList() {
    return Expanded(
        child: FirebaseAnimatedList(
      controller: _scrollController,
      query: widget.messageDao.getMessageQuery(),
      itemBuilder: (context, snapshot, animation, index) {
        final json = snapshot.value as Map<dynamic, dynamic>;
        final message = MessageModel.fromJson(json);
        return MessageListWidget(message.text, message.date);
      },
    ));
  }

  void _sendMessage() {
    if (_canSendMessage()) {
      final message = MessageModel(_messageController.text, DateTime.now());
      widget.messageDao.saveMessage(message);
      _messageController.clear();
      setState(() {});
    }
  }

  bool _canSendMessage() => _messageController.text.length > 0;

  void _scrollToBottom() {
    if (_scrollController.hasClients) {
      _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
    }
  }
}
