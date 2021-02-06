import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../widgets/chat/message_bubble.dart';

class Messages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: FirebaseAuth.instance.currentUser(),
      builder: (ctx, userSnapshot) {
        if (userSnapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        return StreamBuilder(
          stream: Firestore.instance
              .collection('chat')
              .orderBy('createdAt', descending: true)
              .snapshots(),
          builder: (ctx, chatSnapshot) {
            if (chatSnapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            final userData = userSnapshot.data as FirebaseUser;
            final chatData = chatSnapshot.data as QuerySnapshot;

            return ListView.builder(
              reverse: true,
              itemCount: chatData.documents.length,
              itemBuilder: (ctx, i) {
                final chatDocument = chatData.documents[i];
                return MessageBubble(
                  message: chatDocument['text'],
                  username: chatDocument['username'],
                  isCurrentUser: chatDocument['userId'] == userData.uid,
                  userImage: chatDocument['userImage'],
                  key: ValueKey(chatDocument.documentID),
                );
              },
            );
          },
        );
      },
    );
  }
}
