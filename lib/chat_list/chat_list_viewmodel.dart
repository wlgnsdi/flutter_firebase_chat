import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'chat_list_viewmodel.freezed.dart';
part 'chat_list_viewmodel.g.dart';

@freezed
class ChatRoom with _$ChatRoom {
  const factory ChatRoom({
    required String roomNo,
    required String lastMessage,
    required DateTime lastMessageTime,
  }) = _ChatRoom;

  factory ChatRoom.fromFirestore(Map<String, dynamic> data) {
    return ChatRoom(
      roomNo: data['roomNo'] as String,
      lastMessage: data['lastMessage'] as String? ?? '',
      lastMessageTime: (data['lastMessageTime'] as Timestamp).toDate(),
    );
  }
}

@riverpod
class ChatListViewModel extends _$ChatListViewModel {
  late FirebaseFirestore _firestore;
  
  @override
  AsyncValue<List<ChatRoom>> build() {
    _firestore = FirebaseFirestore.instance;
    loadChatRoomList();
    return const AsyncValue.loading();
  }

  Future<void> loadChatRoomList() async {
    try {
      state = const AsyncValue.loading();
      final snapshot = await _firestore.collection('chatRoom').get();
      
      final chatRooms = snapshot.docs.map((doc) => 
        ChatRoom.fromFirestore(doc.data())).toList();
      
      state = AsyncValue.data(chatRooms);
    } catch (e, stack) {
      state = AsyncValue.error(e, stack);
    }
  }

  Future<void> createChatRoom(String roomName) async {
    try {
      await _firestore.collection('chatRoom').add({
        'roomNo': roomName,
        'lastMessage': '',
        'lastMessageTime': Timestamp.now(),
      });
      loadChatRoomList();
    } catch (e) {
      rethrow;
    }
  }
}
