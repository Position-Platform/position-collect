// ignore_for_file: use_key_in_widget_constructors, file_names, deprecated_member_use, unused_import

/*
 * @Author: Boris Gautier 
 * @Date: 2022-01-09 14:51:11 
 * @Last Modified by: Boris Gautier
 * @Last Modified time: 2022-01-10 11:42:37
 */

import 'dart:io';

import 'package:android_intent/android_intent.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:positioncollect/generated/l10n.dart';
import 'package:positioncollect/src/blocs/auth/auth_bloc.dart';
import 'package:positioncollect/src/blocs/login/login_bloc.dart';
import 'package:positioncollect/src/utils/colors.dart';
import 'package:positioncollect/src/utils/tools.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _obscureText = true;
  IconData _iconVisible = Icons.visibility_off;

  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  LoginBloc? _loginBloc;

  bool get isPopulated =>
      _phoneController.text.isNotEmpty && _passwordController.text.isNotEmpty;

  bool isLoginButtonEnabled(LoginState state) {
    return state.isFormValid && isPopulated && !state.isSubmitting!;
  }

  void _toggleObscureText() {
    setState(() {
      _obscureText = !_obscureText;
      if (_obscureText == true) {
        _iconVisible = Icons.visibility_off;
      } else {
        _iconVisible = Icons.visibility;
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _loginBloc = BlocProvider.of<LoginBloc>(context);
    _phoneController.addListener(_onLoginPhoneChanged);
    _passwordController.addListener(_onLoginPasswordChanged);
  }

  @override
  void dispose() {
    _phoneController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _onLoginPhoneChanged() {
    _loginBloc!.add(
      LoginPhoneChanged(phone: _phoneController.text),
    );
  }

  void _onLoginPasswordChanged() {
    _loginBloc!.add(
      LoginPasswordChanged(password: _passwordController.text),
    );
  }

  void _onFormSubmitted() {
    _loginBloc!.add(
      LoginWithCredentialsPressed(
        phone: _phoneController.text,
        password: _passwordController.text,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    changeStatusColor(transparent);
    return Scaffold(
        backgroundColor: Colors.white,
        body: BlocListener<LoginBloc, LoginState>(
          listener: (context, state) {
            if (state.isFailure!) {
              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(
                  SnackBar(
                    content: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(S.of(context).loginFailed),
                        const Icon(Icons.error)
                      ],
                    ),
                    backgroundColor: red,
                    duration: const Duration(seconds: 5),
                  ),
                );
            }
            if (state.isSubmitting!) {
              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(
                  SnackBar(
                    content: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(S.of(context).loggin),
                        const CircularProgressIndicator(),
                      ],
                    ),
                  ),
                );
            }
            if (state.isSend!) {
              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(
                  SnackBar(
                    content: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(S.of(context).emailSend),
                        const Icon(Icons.check_circle)
                      ],
                    ),
                    backgroundColor: green,
                    duration: const Duration(seconds: 7),
                  ),
                );
            }
            if (state.isFailSend!) {
              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(
                  SnackBar(
                    content: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(S.of(context).emailNoSend),
                        const Icon(Icons.error)
                      ],
                    ),
                    backgroundColor: red,
                  ),
                );
            }
            if (state.isSuccess!) {
              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(
                  SnackBar(
                    content: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(S.of(context).loginSuccess),
                        const Icon(Icons.check_circle)
                      ],
                    ),
                    backgroundColor: green,
                    duration: const Duration(seconds: 7),
                  ),
                );
              context.read<AuthBloc>().add(AuthLoggedIn());
            }
            if (state.isDisabledAccount!) {
              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(
                  SnackBar(
                    content: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(S.of(context).disabledAccount),
                        const Icon(Icons.error)
                      ],
                    ),
                    backgroundColor: red,
                    duration: const Duration(seconds: 7),
                  ),
                );
              context.read<AuthBloc>().add(AuthLoggedOut());
            }
          },
          child: BlocBuilder<LoginBloc, LoginState>(
            builder: (context, state) {
              return AnnotatedRegion<SystemUiOverlayStyle>(
                value: Platform.isIOS
                    ? SystemUiOverlayStyle.light
                    : const SystemUiOverlayStyle(
                        statusBarIconBrightness: Brightness.light),
                child: Stack(
                  children: <Widget>[
                    // top blue background gradient
                    Container(
                      height: MediaQuery.of(context).size.height / 3.5,
                      decoration: const BoxDecoration(
                          gradient: LinearGradient(
                              colors: [accentPrimaryColor, darkPrimaryColor],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter)),
                    ),
                    // set your logo here
                    Container(
                        margin: EdgeInsets.fromLTRB(
                            0, MediaQuery.of(context).size.height / 20, 0, 0),
                        alignment: Alignment.topCenter,
                        child: Image.asset('assets/images/logo-nom.png',
                            height: 120)),
                    ListView(
                      children: <Widget>[
                        // create form login
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          elevation: 5,
                          margin: EdgeInsets.fromLTRB(
                              32,
                              MediaQuery.of(context).size.height / 3.5 - 72,
                              32,
                              0),
                          color: Colors.white,
                          child: Container(
                              margin: const EdgeInsets.fromLTRB(24, 0, 24, 20),
                              child: Column(
                                children: <Widget>[
                                  const SizedBox(
                                    height: 40,
                                  ),
                                  Center(
                                    child: Text(
                                      S.of(context).login,
                                      style: const TextStyle(
                                          color: primaryColor,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w900),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  TextFormField(
                                    controller: _phoneController,
                                    autovalidateMode: AutovalidateMode.always,
                                    keyboardType: TextInputType.number,
                                    autocorrect: false,
                                    validator: (_) {
                                      return !state.isPhoneValid!
                                          ? S.of(context).invalidPhone
                                          : null;
                                    },
                                    cursorColor: primaryColor,
                                    decoration: InputDecoration(
                                        focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.grey[600]!)),
                                        enabledBorder:
                                            const UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: greyColor),
                                        ),
                                        labelText: S.of(context).hintPhone,
                                        labelStyle:
                                            TextStyle(color: Colors.grey[700])),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  TextFormField(
                                    controller: _passwordController,
                                    autovalidateMode: AutovalidateMode.always,
                                    autocorrect: false,
                                    validator: (_) {
                                      return !state.isPasswordValid!
                                          ? S.of(context).invalidPass
                                          : null;
                                    },
                                    obscureText: _obscureText,
                                    cursorColor: primaryColor,
                                    decoration: InputDecoration(
                                      focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.grey[600]!)),
                                      enabledBorder: const UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: greyColor),
                                      ),
                                      labelText: S.of(context).password,
                                      labelStyle:
                                          TextStyle(color: Colors.grey[700]),
                                      suffixIcon: IconButton(
                                          icon: Icon(_iconVisible,
                                              color: Colors.grey[700],
                                              size: 20),
                                          onPressed: () {
                                            _toggleObscureText();
                                          }),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  /* Align(
                                    alignment: Alignment.centerRight,
                                    child: GestureDetector(
                                      onTap: () {
                                        Fluttertoast.showToast(
                                            msg: 'Click forgot password',
                                            toastLength: Toast.LENGTH_SHORT);
                                      },
                                      child: const Text(
                                        'Forgot Password?',
                                        style: TextStyle(fontSize: 13),
                                      ),
                                    ),
                                  ),*/
                                  const SizedBox(
                                    height: 40,
                                  ),
                                  SizedBox(
                                    width: double.maxFinite,
                                    child: TextButton(
                                        style: ButtonStyle(
                                          backgroundColor: isLoginButtonEnabled(
                                                  state)
                                              ? MaterialStateProperty
                                                  .resolveWith<Color>(
                                                  (Set<MaterialState> states) =>
                                                      primaryColor,
                                                )
                                              : MaterialStateProperty
                                                  .resolveWith<Color>(
                                                  (Set<MaterialState> states) =>
                                                      greyColor,
                                                ),
                                          overlayColor:
                                              MaterialStateProperty.all(
                                                  Colors.transparent),
                                          shape: MaterialStateProperty.all(
                                              RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          )),
                                        ),
                                        onPressed: isLoginButtonEnabled(state)
                                            ? _onFormSubmitted
                                            : null,
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 5),
                                          child: Text(
                                            S.of(context).connexion,
                                            style: const TextStyle(
                                                fontSize: 16,
                                                color: Colors.white),
                                            textAlign: TextAlign.center,
                                          ),
                                        )),
                                  ),
                                ],
                              )),
                        ),
                        const SizedBox(
                          height: 50,
                        ),

                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    )
                  ],
                ),
              );
            },
          ),
        ));
  }
}
