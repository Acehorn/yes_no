import 'package:flutter/material.dart';

import '../../domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  final ScrollController chatScrollController = ScrollController();
  List<Message> messagesList = [
   // Message(text: "Hola", fromWho: FromWho.mine),
  ];

  Future<void> sendMessage(String text) async {
    if(text.isEmpty) return;
    final newMessage = Message(text: text, fromWho: FromWho.mine);
    messagesList.add(newMessage);
    notifyListeners();
    moveScrollToBottom();
  }

  void moveScrollToBottom() async{
    await Future.delayed(const Duration(milliseconds: 100));
    chatScrollController.animateTo(chatScrollController.position.maxScrollExtent, duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
  }
}
