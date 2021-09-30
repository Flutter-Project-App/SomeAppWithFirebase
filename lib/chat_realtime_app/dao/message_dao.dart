import 'package:firebase_database/firebase_database.dart';
import 'package:some_app_firebase/chat_realtime_app/models/message_model.dart';

class MessageDao {
  final DatabaseReference _messageRef =
      FirebaseDatabase.instance.reference().child('message');

  void saveMessage(MessageModel message) {
    _messageRef.push().set(message.toJson());
  }

  Query getMessageQuery() {
    return _messageRef;
  }
}
