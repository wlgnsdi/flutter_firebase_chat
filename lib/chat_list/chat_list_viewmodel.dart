import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'chat_list_viewmodel.g.dart';

// flutter pub run build_runner build --delete-conflicting-outputs

@riverpod
class ChatListViewMdoel extends _$ChatListViewMdoel {
  late FirebaseFirestore _firestore;
  List<String> chatRoomList = [];
  bool isLoading = true;

  @override
  List<String> build() {
    _firestore = FirebaseFirestore.instanceFor(
        app: Firebase.app(), databaseId: 'chatroom');
    loadChatRoomList();
    return [];
  }

  loadChatRoomList() async {
    QuerySnapshot<Map<String, dynamic>> list =
        await _firestore.collection('chatRoom').get();

    chatRoomList = [
      ...list.docs.map((element) {
        return element['roomNo'] as String;
      })
    ];
    state = chatRoomList;
    isLoading = false;
  }

}
