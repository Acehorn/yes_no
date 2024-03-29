import 'package:flutter/material.dart';
import 'package:yes_no_app/config/helpers/get_yes_no_answer.dart';

import '../../domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  final ScrollController chatScrollController = ScrollController();
  final GetYesNoAnswer getYesNoAnswer = GetYesNoAnswer();
  List<Message> messagesList = [
   // Message(text: "Hola", fromWho: FromWho.mine),
  ];

  Future<void> sendMessage(String text) async {
    if(text.isEmpty) return;
    final newMessage = Message(text: text, fromWho: FromWho.mine);
    messagesList.add(newMessage);
if(text.endsWith("?")){
   acheronReply();
}

    notifyListeners();
    moveScrollToBottom();
  }

Future <void> acheronReply() async {
  final acheronMessage = await getYesNoAnswer.getAnswer();

  messagesList.add(acheronMessage);
  notifyListeners();

  moveScrollToBottom();
}

  void moveScrollToBottom() async{
    await Future.delayed(const Duration(milliseconds: 100));
    chatScrollController.animateTo(chatScrollController.position.maxScrollExtent, duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
  }
}
