import 'dart:io';

import 'package:flutter/material.dart';

import '../../screens/auth_screen.dart';
import '../pickers/user_image_picker.dart';

enum LoginState {
  Login,
  Signup,
}

class AuthForm extends StatefulWidget {
  final void Function({
    @required String email,
    @required String username,
    @required String password,
    @required bool isLoggedIn,
    @required File userImage,
    @required BuildContext buildContext,
  }) onAuthSubmit;
  final LoadingState loadingState;

  AuthForm({
    @required this.onAuthSubmit,
    @required this.loadingState,
  });

  @override
  _AuthFormState createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _formKey = GlobalKey<FormState>();

  var _loginState = LoginState.Login;

  var _email = '';
  var _username = '';
  var _password = '';
  File _userImageFile;

  void _onImagePicked(File pickedImage) {
    _userImageFile = pickedImage;
  }

  void _trySubmit() {
    final isValid = _formKey.currentState.validate();
    FocusScope.of(context).unfocus();

    if (_userImageFile == null && _loginState == LoginState.Signup) {
      Scaffold.of(context).showSnackBar(
        SnackBar(
          content: Text('Please pick an image'),
          backgroundColor: Theme.of(context).errorColor,
        ),
      );
      return;
    }

    if (isValid) {
      _formKey.currentState.save();

      widget.onAuthSubmit(
        email: _email.trim(),
        password: _password.trim(),
        username: _username.trim(),
        userImage: _userImageFile,
        isLoggedIn: _loginState == LoginState.Login,
        buildContext: context,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        margin: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (_loginState == LoginState.Signup)
                    UserImagePicker(onImagePicked: _onImagePicked),
                  TextFormField(
                    key: ValueKey('email'),
                    validator: (value) {
                      if (value.isEmpty || !value.contains('@')) {
                        return 'Please enter a valid email address.';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: 'Email address',
                    ),
                    onSaved: (value) {
                      _email = value;
                    },
                  ),
                  if (_loginState != LoginState.Login)
                    TextFormField(
                      key: ValueKey('username'),
                      validator: (value) {
                        if (value.isEmpty || value.length < 4) {
                          return 'Username must be at least 4 characters long.';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: 'Username',
                      ),
                      onSaved: (value) {
                        _username = value;
                      },
                    ),
                  TextFormField(
                    key: ValueKey('password'),
                    validator: (value) {
                      if (value.isEmpty || value.length < 7) {
                        return 'Password must be at least 7 characters long.';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: 'Password',
                    ),
                    obscureText: true,
                    onSaved: (value) {
                      _password = value;
                    },
                  ),
                  SizedBox(height: 12),
                  if (widget.loadingState == LoadingState.Loading)
                    CircularProgressIndicator(),
                  if (widget.loadingState != LoadingState.Loading)
                    RaisedButton(
                      child: Text(
                        _loginState == LoginState.Login ? 'Login' : 'Signup',
                      ),
                      onPressed: _trySubmit,
                    ),
                  if (widget.loadingState != LoadingState.Loading)
                    FlatButton(
                      child: Text(
                        _loginState == LoginState.Login
                            ? 'Create new account'
                            : 'I already have an account',
                      ),
                      onPressed: () {
                        setState(() {
                          switch (_loginState) {
                            case LoginState.Login:
                              _loginState = LoginState.Signup;
                              break;
                            case LoginState.Signup:
                              _loginState = LoginState.Login;
                              break;
                          }
                        });
                      },
                      textColor: Theme.of(context).primaryColor,
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
