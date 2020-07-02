part of 'pages.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isEmailValid = false;
  bool isPassword = false;
  bool isSignIn = false;

  @override
  Widget build(BuildContext context) {
    context
        .bloc<ThemeBloc>()
        .add(ChangeTheme(ThemeData().copyWith(primaryColor: oren)));
    return WillPopScope(
      onWillPop: () {
        context.bloc<PageBloc>().add(GoToSplashPage());
        return;
      },
      child: Scaffold(
        backgroundColor: bgputih,
        body: Container(
            padding: EdgeInsets.symmetric(horizontal: defaultMargin),
            child: ListView(children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    height: 70,
                    child: Image.asset("assets/cxb.png"),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 70, bottom: 40),
                    child: Text(
                      "Welcome Back,\nExplorer",
                      style: blackTextFont.copyWith(fontSize: 20),
                    ),
                  ),
                  TextField(
                    onChanged: (text) {
                      setState(() {
                        isEmailValid = EmailValidator.validate(text);
                      });
                    },
                    controller: emailController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: new BorderSide(color: oren)),
                      labelText: "Email Address",
                      labelStyle: whiteTextFont,
                      hintText: "Email Address",
                      // hintStyle: whiteTextFont,
                    ),
                  ),
                  SizedBox(
                    height: 13,
                  ),
                  TextField(
                    onChanged: (text) {
                      setState(() {
                        isPassword = text.length >= 6;
                      });
                    },
                    controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: new BorderSide(color: oren)),
                      labelText: "Password",
                      labelStyle: whiteTextFont,
                      hintText: "Password",
                      // hintStyle: whiteTextFont,
                    ),
                  ),
                  SizedBox(
                    height: 13,
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        "Forget Password?",
                        style: blackTextFont.copyWith(
                            fontSize: 12, fontWeight: FontWeight.w400),
                      ),
                      Text(
                        "Get New",
                        style: orenTextFont.copyWith(fontSize: 12),
                      )
                    ],
                  ),
                  Center(
                    child: Container(
                      width: 50,
                      height: 50,
                      margin: EdgeInsets.only(top: 40, bottom: 30),
                      child: isSignIn
                          ? SpinKitFadingCircle(
                              color: oren,
                            )
                          : FloatingActionButton(
                              elevation: 0,
                              child: Icon(
                                Icons.arrow_forward,
                                color: isEmailValid && isPassword
                                    ? Colors.white
                                    : Color(0xFFBEBEBE),
                              ),
                              backgroundColor: isEmailValid && isPassword
                                  ? oren
                                  : Color(0xffE4E4E4),
                              onPressed: isEmailValid && isPassword
                                  ? () async {
                                      setState(() {
                                        isSignIn = true;
                                      });
                                      SignInSignUpResult result =
                                          await AuthServices.signIn(
                                              emailController.text,
                                              passwordController.text);
                                      if (result.user == null) {
                                        setState(() {
                                          isSignIn = false;
                                        });
                                        Flushbar(
                                          duration: Duration(seconds: 4),
                                          flushbarPosition:
                                              FlushbarPosition.TOP,
                                          backgroundColor: Color(0xFFFF5c83),
                                          message: result.message,
                                        )..show(context);
                                      }
                                    }
                                  : null),
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        "Start Fresh Now?",
                        style:
                            blackTextFont.copyWith(fontWeight: FontWeight.w400),
                      ),
                      Text(
                        "Sing Up",
                        style: orenTextFont,
                      )
                    ],
                  )
                ],
              ),
            ])),
      ),
    );
  }
}

// part of 'pages.dart';

// class SignInPage extends StatefulWidget {
//   @override
//   _SignInPageState createState() => _SignInPageState();
// }

// class _SignInPageState extends State<SignInPage> {
//   TextEditingController emailController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();

//   bool isEmailValid = false;
//   bool isPassword = false;
//   bool isSignIn = false;

//   @override
//   Widget build(BuildContext context) {
//     context
//         .bloc<ThemeBloc>()
//         .add(ChangeTheme(ThemeData().copyWith(primaryColor: oren)));
//     return WillPopScope(
//       onWillPop: () {
//         context.bloc<PageBloc>().add(GoToSplashPage());
//         return;
//       },
//       child: Scaffold(
//         backgroundColor: bgputih,
//         body: Container(
//             padding: EdgeInsets.symmetric(horizontal: defaultMargin),
//             child: ListView(children: <Widget>[
//               Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: <Widget>[
//                   SizedBox(
//                     height: 30,
//                   ),
//                   SizedBox(
//                     height: 70,
//                     child: Image.asset("assets/cxb.png"),
//                   ),
//                   Container(
//                     margin: EdgeInsets.only(top: 70, bottom: 40),
//                     child: Text(
//                       "Welcome Back,\nExplorer",
//                       style: blackTextFont.copyWith(fontSize: 20),
//                     ),
//                   ),
//                   TextField(
//                     onChanged: (text) {
//                       setState(() {
//                         isEmailValid = EmailValidator.validate(text);
//                       });
//                     },
//                     controller: emailController,
//                     decoration: InputDecoration(
//                       border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10),
//                           borderSide: new BorderSide(color: oren)),
//                       labelText: "Email Address",
//                       labelStyle: whiteTextFont,
//                       hintText: "Email Address",
//                       // hintStyle: whiteTextFont,
//                     ),
//                   ),
//                   SizedBox(
//                     height: 13,
//                   ),
//                   TextField(
//                     onChanged: (text) {
//                       setState(() {
//                         isPassword = text.length >= 6;
//                       });
//                     },
//                     controller: passwordController,
//                     obscureText: true,
//                     decoration: InputDecoration(
//                       border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10),
//                           borderSide: new BorderSide(color: oren)),
//                       labelText: "Password",
//                       labelStyle: whiteTextFont,
//                       hintText: "Password",
//                       // hintStyle: whiteTextFont,
//                     ),
//                   ),
//                   SizedBox(
//                     height: 13,
//                   ),
//                   Row(
//                     children: <Widget>[
//                       Text(
//                         "Forget Password?",
//                         style: blackTextFont.copyWith(
//                             fontSize: 12, fontWeight: FontWeight.w400),
//                       ),
//                       Text(
//                         "Get New",
//                         style: orenTextFont.copyWith(fontSize: 12),
//                       )
//                     ],
//                   ),
//                   Center(
//                     child: Container(
//                       width: 50,
//                       height: 50,
//                       margin: EdgeInsets.only(top: 40, bottom: 30),
//                       child: isSignIn
//                           ? SpinKitFadingCircle(
//                               color: oren,
//                             )
//                           : FloatingActionButton(
//                               elevation: 0,
//                               child: Icon(
//                                 Icons.arrow_forward,
//                                 color: isEmailValid && isPassword
//                                     ? Colors.white
//                                     : Color(0xFFBEBEBE),
//                               ),
//                               backgroundColor: isEmailValid && isPassword
//                                   ? oren
//                                   : Color(0xffE4E4E4),
//                               onPressed: isEmailValid && isPassword
//                                   ? () async {
//                                       setState(() {
//                                         isSignIn = true;
//                                       });
//                                       SignInSingUpResult result =
//                                           await AuthServices.signIn(
//                                               emailController.text,
//                                               passwordController.text);
//                                       if (result.user == null) {
//                                         setState(() {
//                                           isSignIn = false;
//                                         });
//                                         Flushbar(
//                                           duration: Duration(seconds: 4),
//                                           flushbarPosition:
//                                               FlushbarPosition.TOP,
//                                           backgroundColor: Color(0xFFFF5c83),
//                                           message: result.message,
//                                         )..show(context);
//                                       }
//                                     }
//                                   : null),
//                     ),
//                   ),
//                   Row(
//                     children: <Widget>[
//                       Text(
//                         "Start Fresh Now?",
//                         style:
//                             blackTextFont.copyWith(fontWeight: FontWeight.w400),
//                       ),
//                       Text(
//                         "Sing Up",
//                         style: orenTextFont,
//                       )
//                     ],
//                   )
//                 ],
//               ),
//             ])),
//       ),
//     );
//   }
// }
