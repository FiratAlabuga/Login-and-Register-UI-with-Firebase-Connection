import 'package:flutter/material.dart';
import 'package:self_tracking_sys_sts/components/account_acheck.dart';
import 'package:self_tracking_sys_sts/components/rounded_button.dart';
import 'package:self_tracking_sys_sts/components/rounded_input.dart';
import 'package:self_tracking_sys_sts/components/rounded_pass.dart';
import 'package:self_tracking_sys_sts/screens/home_page.dart';
import 'package:self_tracking_sys_sts/screens/register_page.dart';
import 'package:validators/validators.dart';

class Login_Screen extends StatelessWidget {
  const Login_Screen({
    Key key,
    
  }) : super(key: key);

  void validateandSave() {

  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return new Scaffold(
      resizeToAvoidBottomPadding: false,
        body: new Stack(
          children: <Widget>[
            new Container(
              
              decoration: new BoxDecoration(
                image: new DecorationImage(image: new AssetImage("assets/images/a1.jpg"), fit: BoxFit.cover,),
              ),
            ),
            Positioned(
              top: 250,
              left: 80,
              width: 265,
              height: 200,
              child: Center(
                child: Text("Login", style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),),
              ),
            ),
            SizedBox(height: size.height * 0.03),
            Positioned(
              left: 100,
              top: 100,
              width:210,
              height: 200,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    image: DecorationImage(
                        colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.7), BlendMode.dstATop),
                        image: AssetImage('assets/images/sts.png')
                    )
                ),
              ),
            ),
            SizedBox(height: size.height * 0.08),
            Positioned(
              left: 50,
              top: 380,
              width:300,
              height: 75,
            child:RoundedInputField(
             
              hintText: "E-Mail",
              onChanged: (value) {},
            ),
            ),
            Positioned(
              left: 50,
              top: 450,
              width:300,
              height: 75,
            child:RoundedPasswordField(
              onChanged: (value) {},
            ),
            ),
            Positioned(

              left: 75,
              top: 530,
              width:250,
              height: 75,
            child:RoundedButton(
              text: "LOGIN",
              press: () {
                Navigator.push(context,
                MaterialPageRoute(builder: (context) {
                  return Homepage_Screen();
                },)
                );
              },
            ),
            ),
            SizedBox(height: size.height * 0.03),
            Positioned(
            child:AlreadyHaveAnAccountCheck(
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return Register_Screen();
                    },
                  ),
                );
              },
            ),
            ),

          ],
        )
    );
  }
}
