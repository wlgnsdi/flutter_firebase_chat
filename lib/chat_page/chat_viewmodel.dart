import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'chat_viewmodel.g.dart';

// flutter pub run build_runner build --delete-conflicting-outputs

@riverpod
class ChatViewmodel extends _$ChatViewmodel {
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;

  String chattingRoom = "";
  User? currentUser;

  @override
  void build(String roomNo) {
    initChatRoomFirestore(roomNo);
  }

  initChatRoomFirestore(String roomNo) {
    final chatRoomFirestore = FirebaseFirestore.instanceFor(
      app: Firebase.app(),
      databaseId: 'chatroom',
    );

    currentUser = _auth.currentUser;

    if (roomNo.isNotEmpty) {
      chattingRoom = roomNo;
    } else {
      chattingRoom = '${currentUser?.uid}-${DateTime.now()}';
      chatRoomFirestore.collection('chatRoom').add({'roomNo': chattingRoom});
    }
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> stremChat() {
    return _firestore
        .collection(chattingRoom)
        .orderBy('timestamp', descending: true)
        .snapshots();
  }

  void sendMessage(String message) async {
    if (message.isEmpty) return;

    try {
      await _firestore.collection(chattingRoom).add({
        'text': message,
        'senderId': currentUser?.uid ?? 'anonymous',
        'timestamp': FieldValue.serverTimestamp(),
      });
    } catch (e) {
      print('Failed to send message: $e');
    }
  }
}
