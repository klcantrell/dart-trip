import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';

import '../widgets/auth/auth_form.dart';

enum LoadingState {
  Idle,
  Loading,
}

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _auth = FirebaseAuth.instance;
  LoadingState _loadingState = LoadingState.Idle;

  void _onAuthSubmit({
    @required String email,
    @required String password,
    @required String username,
    @required File userImage,
    @required bool isLoggedIn,
    @required BuildContext buildContext,
  }) async {
    AuthResult authResult;

    try {
      setState(() {
        _loadingState = LoadingState.Loading;
      });
      if (isLoggedIn) {
        authResult = await _auth.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
      } else {
        authResult = await _auth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );

        final storage = FirebaseStorage.instance
            .ref()
            .child('user_image')
            .child(authResult.user.uid + '.jpg');

        await storage.putFile(userImage).onComplete;

        final url = await storage.getDownloadURL() as String;

        await Firestore.instance
            .collection('users')
            .document(authResult.user.uid)
            .setData(
          {
            'username': username,
            'email': email,
            'image_url': url,
          },
        );
      }
    } on PlatformException catch (err) {
      var message =
          err.message ?? 'An error occurred, please check your credentials.';

      setState(() {
        _loadingState = LoadingState.Idle;
      });

      Scaffold.of(buildContext).showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: Theme.of(buildContext).errorColor,
        ),
      );
    } catch (err) {
      setState(() {
        _loadingState = LoadingState.Idle;
      });
      print(err);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: AuthForm(
        onAuthSubmit: _onAuthSubmit,
        loadingState: _loadingState,
      ),
    );
  }
}
