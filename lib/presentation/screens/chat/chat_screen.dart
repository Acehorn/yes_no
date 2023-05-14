import 'package:flutter/material.dart';
import 'package:yes_no_app/presentation/widgets/shared/message_field_box.dart';

import '../../widgets/chat/ace_mesagge.dart';
import '../../widgets/chat/my_message_bubble.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(6.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage("https://avatars.githubusercontent.com/u/53038393?s=96&v=4"),
          ),
        ),
        title: const Text("acheron"),
        centerTitle: false,
      ),

      body:  _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(child: ListView.builder(
              itemCount: 100,
             itemBuilder: (context, index) {
               return (index % 2 == 0) ?
                const MessageBubbleChat() :
                const AceMessageBubble();


           
             },
           
            )
            ),
            const MessageFieldBox(),
          ],
        ),
      ),
    );
  }
}