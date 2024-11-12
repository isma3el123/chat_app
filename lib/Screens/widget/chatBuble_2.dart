import 'package:chat_app/models/messages_model.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ChatbubleSecondry extends StatelessWidget {
  ChatbubleSecondry({super.key, required this.msessagesModels});
  MsessagesModels msessagesModels;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.bottomRight,
              child: Container(
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 60, 57, 209),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    )),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    msessagesModels.messages!,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
