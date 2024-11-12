import 'package:chat_app/Screens/widget/chatBuble_2.dart';
import 'package:chat_app/Screens/widget/chatbuble.dart';
import 'package:chat_app/models/messages_model.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// ignore: must_be_immutable
class ChatScreenBody extends StatelessWidget {
  ChatScreenBody({super.key});
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference messages =
      FirebaseFirestore.instance.collection('messages');
  TextEditingController controller = TextEditingController();

  // دالة لإرسال الرسالة إلى قاعدة البيانات
  void sendMessage(var email) {
    final messageText = controller.text;
    if (messageText.isNotEmpty) {
      messages.add({
        'messages': messageText,
        'createdAt': DateTime.now(),
        'id': email,
      });
      controller.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    var email = ModalRoute.of(context)!.settings.arguments;
    return StreamBuilder<QuerySnapshot>(
      stream: messages.orderBy('createdAt', descending: true).snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<MsessagesModels> messageList = [];
          for (int i = 0; i < snapshot.data!.docs.length; i++) {
            messageList.add(MsessagesModels.fromJson(snapshot.data!.docs[i]));
          }
          return Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              title: Row(
                children: [
                  Image.asset(
                    "assets/images/scholar.png",
                    height: 50,
                  ),
                  Text(
                    " chat",
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
              backgroundColor: const Color.fromARGB(255, 38, 92, 136),
            ),
            body: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    reverse: true,
                    itemCount: messageList.length,
                    itemBuilder: (context, index) {
                      return messageList[index].id == email
                          ? Chatbuble(
                              msessagesModels: messageList[index],
                            )
                          : ChatbubleSecondry(
                              msessagesModels: messageList[index],
                            );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextField(
                    controller: controller,
                    decoration: InputDecoration(
                      hintText: "Send Message",
                      suffixIcon: IconButton(
                        icon: Icon(
                          Icons.send,
                          color: Colors.blue,
                        ),
                        onPressed: () => sendMessage(email),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide(color: Colors.amber),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide(
                          color: const Color.fromARGB(255, 5, 7, 105),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        } else if (snapshot.hasError) {
          return Center(child: Text("Error loading messages"));
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }
}
