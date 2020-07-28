import 'package:flutter/material.dart';
import 'package:self_tracking_sys_sts/components/rounded_button.dart';
import 'package:self_tracking_sys_sts/screens/login_page.dart';
import 'package:self_tracking_sys_sts/screens/register_page.dart';
import 'package:self_tracking_sys_sts/screens/log_page.dart';

class WelcomePage  extends StatelessWidget {//stles
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: new Stack(
          children: <Widget>[
            new Container(
              decoration: new BoxDecoration(
                image: new DecorationImage(image: new AssetImage("assets/images/a1.jpg"), fit: BoxFit.cover,),
              ),
            ),
            Positioned(
              top: 250,
              left: 70,
              width: 265,
              height: 200,
                child: Center(
                  child: Text("WELCOME TO STS", style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),),
                ),
            ),
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
            Positioned(
              left: 100,
              top: 450,
              width:210,
              height: 75,
              child:RoundedButton(
                text: "LOGIN",
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return LogPage();
                      },
                    ),
                  );
                },
              ),
            ),
            Positioned(
              left: 100,
              top: 550,
              width:210,
              height: 75,
              child:RoundedButton(
                text: "REGISTER",
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
            )

          ],
        )
    );
  }
}
