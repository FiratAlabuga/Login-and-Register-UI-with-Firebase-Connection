import 'auth.dart';
import 'package:flutter/material.dart';
import 'package:self_tracking_sys_sts/screens/log_page.dart';

class RootPage extends StatefulWidget {
  RootPage ({this.auth});
  final BaseAuth auth;
  @override
  _RootPageState createState() => _RootPageState();
}

enum AuthStatus{
  notGiris,
  giris
}

class _RootPageState extends State<RootPage> {
  AuthStatus _authStatus=AuthStatus.notGiris;
  
  @override
  void initState(){
    super.initState();
    widget.auth.currentUser().then((userId){
      setState(() {
        //_authStatus = userId == null ? AuthStatus.notGiris : AuthStatus.giris;
      });
    }).catchError((onError){
      _authStatus=AuthStatus.notGiris;
    });
  }
  void _giris(){
    setState(() {
      _authStatus=AuthStatus.giris;
    });
  }

  @override
  Widget build(BuildContext context) {
    switch(_authStatus){
      case AuthStatus.notGiris:
        return new LogPage(
          auth:widget.auth,
          onGiris: _giris,
          );
      case AuthStatus.giris:
      return new Scaffold(
        body: new Container(
        child:  new Text('Hosgeldiniz'),
      )
      );
    }
  }
}
