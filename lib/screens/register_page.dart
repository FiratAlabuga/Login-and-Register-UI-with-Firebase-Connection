import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:self_tracking_sys_sts/services/auth.dart';
import 'dart:async';
import 'package:self_tracking_sys_sts/screens/log_page.dart';

class Register_Screen extends StatefulWidget {
  Register_Screen({this.auth});
  final BaseAuth auth;
  @override
  State<StatefulWidget> createState() => new _RegPageState();
}

enum FormType{
  login,
  register
}
class _RegPageState extends State<Register_Screen> {
  final formKey = new GlobalKey<FormState>(); //formun durumuna göre ilerleme
  String _email;
  String _pass;
  FormType _formType=FormType.login;

  bool validateAndSave() {
    final form = formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
      //print('Form Geçerli. Email: $email,Pass: $pass');
    }
    return false;
    //print('Form Geçersiz. Email: $email,Pass: $pass');
  }

  void validateAndKayitS() async {
    if (validateAndSave()) {
      try {
       // String userId= await widget.auth.createUserWithEmailAndPassword(_email.trim(), _pass);
        FirebaseUser user = (await FirebaseAuth.instance.createUserWithEmailAndPassword(email: _email.trim(), password: _pass))as FirebaseUser;
        print('Giriş Yapıldı: ${user.uid}');
      } catch (e) {
        print('Hata:$e');
      }
    }
  }
  void goToKayitSayfasi(){
    Navigator.push(
      context,
        MaterialPageRoute(
          builder: (context) {
            return Register_Screen();
              },
        ),
    );
  }
  void goToGirisSayfasi(){
    Navigator.push(
      context,
        MaterialPageRoute(
          builder: (context) {
            return LogPage();
              },
        ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Container(
        width: double.infinity,
        height: double.infinity,
        decoration: new BoxDecoration(
          image: new DecorationImage(
            image: new AssetImage("assets/images/a1.jpg"),
            fit: BoxFit.fill,
            alignment: Alignment.topCenter,
          ),
        ),
        padding: EdgeInsets.all(16.0),
        child: new Form(
            key: formKey,
            child: SingleChildScrollView(
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  logocomponent(),
                  emailcomponent(),
                  passcomponent(),
                  buttoncomponent(),
                  checkcomponent(),

                ],
                 
              ),
            ),
          ),
      ),
    );
  }

  
  Widget logocomponent() {
    return Center(
      child: new Container(
        width: 200.0,
        height: 200.0,
        color: Colors.transparent,
        child: new Container(
          decoration: new BoxDecoration(
              color: Colors.white,
              border: new Border.all(
                  color: Colors.black, width: 5.0, style: BorderStyle.solid),
              borderRadius: BorderRadius.circular(100),
              boxShadow: [
                new BoxShadow(
                  color: Colors.lightBlue,
                  offset: new Offset(20.0, 10.0),
                  blurRadius: 20.0,
                )
              ],
              image: new DecorationImage(
                image: new AssetImage('assets/images/sts.png'),
              )),
        ),
      ),
    );
  }
  Widget checkcomponent(){
    return Row(
      children: <Widget>[
        Text("Hesabınız Var Mı ? "
          , style: TextStyle(color: Colors.grey),
        ),
        FlatButton(
          onPressed: ()=> goToGirisSayfasi(),
          child: Text(
           "GİRİŞ"
            ,style: TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ]
      );
  }

  Widget emailcomponent() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 100.0, 0.0, 0.0),
      child: new TextFormField(
        maxLines: 1,
        keyboardType: TextInputType.emailAddress,
        autofocus: false,
        decoration: new InputDecoration(
            hoverColor: Colors.amber,
            hintText: 'E-mail',
            hintStyle: TextStyle(fontSize: 10.0, color: Colors.white),
            icon: new Icon(
              Icons.mail,
              color: Colors.grey,
            )),
        validator: (value) => value.isEmpty ? 'E-mail boş geçilemez.' : null,
        onSaved: (value) => _email = value,
      ),
    );
  }

  Widget passcomponent() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
      child: new TextFormField(
        maxLines: 1,
        obscureText: true,
        autofocus: false,
        decoration: new InputDecoration(
            fillColor: Colors.amber,
            hoverColor: Colors.amber,
            focusColor: Colors.amber,
            hintText: 'Şifre',
            hintStyle: TextStyle(fontSize: 10.0, color: Colors.white),
            icon: new Icon(
              Icons.lock,
              color: Colors.grey,
            )),
        validator: (value) => value.isEmpty ? 'Şifre boş geçilemez.' : null,
        onSaved: (value) => _pass = value,
      ),
    );
  }

  Widget buttoncomponent() {
    return Container(
      margin: EdgeInsets.all(20),
      width: 200,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        gradient: LinearGradient(
          colors: [Colors.red, Colors.blue],
          begin: FractionalOffset.centerLeft,
          end: FractionalOffset.centerRight,
        ),
      ),
      child: FlatButton(
        child: Text(
          'KAYIT OL',
          style: TextStyle(color: Colors.white),
        ),
        onPressed:()=>validateAndKayitS(),
      ),
    );
  }
}

