import 'package:flutter/material.dart';
import 'package:lab2/main.dart';
import 'package:lab2/resources/colors.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 50,
              ),
              Text(
                "Wishing well",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: textPurple,
                    fontWeight: FontWeight.w500,
                    fontSize: 50),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "Everything you want",
                    textAlign: TextAlign.right,
                    style: TextStyle(
                        color: textBlack,
                        fontWeight: FontWeight.w500,
                        fontSize: 28),
                  ),
                ],
              ),
              Image.asset("assets/illustration.png"),
              SizedBox(
                height: 40,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MyHomePage()));
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width - 70,
                        alignment: Alignment.center,
                        padding:
                            EdgeInsets.symmetric(horizontal: 24, vertical: 17),
                        decoration: BoxDecoration(
                            gradient: LinearGradient(colors: [
                              const Color(0xff8EA2FF),
                              const Color(0xff557AC7)
                            ]),
                            boxShadow: <BoxShadow>[
                              BoxShadow(
                                offset: Offset(5.0, 5.0),
                                blurRadius: 15.0,
                                color: Color(0xff8EA2FF).withOpacity(0.5),
                              ),
                            ],
                            borderRadius: BorderRadius.circular(6)),
                        child: Text(
                          "Explore Shop".toUpperCase(),
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MyHomePage(),
                              ));
                        },
                        child: Container(
                          child: Text(
                            "Let me see",
                            style: TextStyle(color: textPurple, fontSize: 17),
                          ),
                        ))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
