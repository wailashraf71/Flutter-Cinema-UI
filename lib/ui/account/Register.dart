import 'package:cached_network_image/cached_network_image.dart';
import 'package:cinema/ui/account/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:easy_localization/easy_localization.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController _emailController;
  TextEditingController _nameController;
  TextEditingController _passwordController;
  TextEditingController _passwordConfirmationController;

  @override
  void initState() {
    _emailController = TextEditingController();
    _nameController = TextEditingController();
    _passwordController = TextEditingController();
    _passwordConfirmationController = TextEditingController();

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    String hintTextEmail =  tr("hintEmail");
    String hintTextName =  tr("hintName");
    String hintTextPassword =  tr("hintPassword");
    String hintTextPasswordConfirm =  tr("hintPasswordConfirm");
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: <Widget>[
            Container(
              height: 220,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: CachedNetworkImageProvider(
                    'https://cdn.technadu.com/wp-content/uploads/2017/12/The-Best-Free-Movie-Websites-Featured-696x398.jpg'
                  ),
                  fit: BoxFit.cover
                )
              ),
              child: Container(
                color: Colors.black38,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 180),
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20))
                ),
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 50),
                        child: Text(
                          'Register',
                          style: TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.bold
                          ),
                        ).tr(context: context),
                      ),
                      Center(
                        child: Container(
                          height: 400,
                          width: MediaQuery.of(context).size.width * 0.85,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                height: 290,
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      height: 47,
                                      padding: EdgeInsets.symmetric(horizontal: 20),
                                      decoration: BoxDecoration(
                                        color: Theme.of(context).textTheme.title.color,
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                      child: TextField(
                                        style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor),
                                        decoration: InputDecoration(
                                            border: InputBorder.none,
                                            hintText: hintTextEmail,
                                          hintStyle: TextStyle(
                                            height: 1,
                                            color: Theme.of(context).scaffoldBackgroundColor.withOpacity(0.4),
                                          )
                                        ),
                                        controller: _emailController,
                                      ),
                                    ),
                                    Spacer(),

                                    Container(
                                      height: 47,
                                      padding: EdgeInsets.symmetric(horizontal: 20),
                                      decoration: BoxDecoration(
                                        color: Theme.of(context).textTheme.title.color,
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                      child: TextField(
                                        style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor),
                                        decoration: InputDecoration(
                                            border: InputBorder.none,
                                            hintText: hintTextName,
                                            hintStyle: TextStyle(
                                              height: 1,
                                              color: Theme.of(context).scaffoldBackgroundColor.withOpacity(0.4),
                                            )
                                        ),
                                        controller: _nameController,
                                      ),
                                    ),
                                    Spacer(),

                                    Container(
                                      height: 47,
                                      padding: EdgeInsets.symmetric(horizontal: 20),
                                      decoration: BoxDecoration(
                                        color: Theme.of(context).textTheme.title.color,
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                      child: TextField(
                                        style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor),
                                        decoration: InputDecoration(
                                            border: InputBorder.none,
                                            hintText: hintTextPassword,
                                            hintStyle: TextStyle(
                                              height: 1,
                                              color: Theme.of(context).scaffoldBackgroundColor.withOpacity(0.4),
                                            )
                                        ),
                                        controller: _passwordController,
                                      ),
                                    ),
                                    Spacer(),
                                    Container(
                                      height: 47,
                                      padding: EdgeInsets.symmetric(horizontal: 20),
                                      decoration: BoxDecoration(
                                        color: Theme.of(context).textTheme.title.color,
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                      child: TextField(
                                        style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor),
                                        decoration: InputDecoration(
                                            border: InputBorder.none,
                                            hintText: hintTextPasswordConfirm,
                                            hintStyle: TextStyle(
                                              height: 1,
                                              color: Theme.of(context).scaffoldBackgroundColor.withOpacity(0.4),
                                            )
                                        ),
                                        controller: _passwordConfirmationController,
                                      ),
                                    ),
                                    Spacer(),
                                    Container(
                                      width: double.infinity,
                                      height: 47,
                                      child: FlatButton(
                                        child: Text('Sign in', style: TextStyle(
                                          color: Theme.of(context).textTheme.title.color,
                                        ),).tr(context: context),
                                        onPressed: (){},
                                        padding: EdgeInsets.symmetric(horizontal: 20),
                                        color: Theme.of(context).accentColor,
                                        shape: RoundedRectangleBorder(
                                            borderRadius: new BorderRadius.circular(30.0),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),


                            ],
                          ),
                        ),
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text("Do you have an account? ", style: TextStyle(
                              color: Theme.of(context).textTheme.title.color.withOpacity(0.4),
                            )).tr(context: context),
                            Container(
                              child: GestureDetector(
                                onTap: () => Get.to(Login()),
                                  child: Text("Sign In", style: TextStyle(
                                      color: Theme.of(context).accentColor,
                                      fontWeight: FontWeight.bold)).tr(context: context),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        )
      ),
    );
  }
}
