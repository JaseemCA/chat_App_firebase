import 'package:cloud_firestore/cloud_firestore.dart';

class ChatService {
  // insteancw of firestore
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
// user stream

  Stream<List<Map<String, dynamic>>> getUsersStream() {
    return _firestore.collection('users').snapshots().map(
      (snapshot) {
        return snapshot.docs.map((doc) => doc.data()).toList();
      },
    );
  }

  Future<void> sendMessage(String chatId, String userId, String message) async {
    try {
      await _firestore
          .collection('chats')
          .doc(chatId)
          .collection('messages')
          .add({
        'userId': userId,
        'message': message,
        'timestamp': FieldValue.serverTimestamp(),
      });
    } catch (e) {
      print('Error sending message: $e');
    }
  }

  Stream<QuerySnapshot> getMessages(String chatId) {
    return _firestore
        .collection('chats')
        .doc(chatId)
        .collection('messages')
        .orderBy('timestamp', descending: true)
        .snapshots();
  }
}
