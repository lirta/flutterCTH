part of 'pages.dart';

class AccounConfirmationPage extends StatefulWidget {
  final RegistrationData registrationData;
  AccounConfirmationPage(this.registrationData);
  @override
  _AccounConfirmationPageState createState() => _AccounConfirmationPageState();
}

class _AccounConfirmationPageState extends State<AccounConfirmationPage> {
  bool isSigninUp = false;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        context
            .bloc<PageBloc>()
            .add(GoToRegistrationPage(widget.registrationData));
        return;
      },
      child: Scaffold(
          body: Container(
        color: bgputih,
        padding: EdgeInsets.symmetric(horizontal: defaultMargin),
        child: ListView(
          children: <Widget>[
            Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 20, bottom: 90),
                  height: 56,
                  child: Stack(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.centerLeft,
                        child: GestureDetector(
                          onTap: () {
                            context.bloc<PageBloc>().add(GoToSplashPage());
                          },
                          child: Icon(
                            Icons.arrow_back,
                            color: oren,
                          ),
                        ),
                      ),
                      Center(
                        child: Text(
                          "Confirm\nNew Account",
                          style: blackTextFont.copyWith(fontSize: 20),
                          textAlign: TextAlign.center,
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  width: 150,
                  height: 150,
                  margin: EdgeInsets.only(bottom: 20),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: (widget.registrationData.profile == null)
                              ? AssetImage("assets/user_pic.png")
                              : FileImage(widget.registrationData.profile),
                          fit: BoxFit.cover)),
                ),
                Text(
                  "Welcom",
                  style: blackTextFont.copyWith(
                      fontSize: 16, fontWeight: FontWeight.w300),
                ),
                Text(
                  "${widget.registrationData.name}",
                  textAlign: TextAlign.center,
                  style: blackTextFont.copyWith(fontSize: 20),
                ),
                SizedBox(
                  height: 110,
                ),
                (isSigninUp)
                    ? SpinKitFadingCircle(
                        color: oren,
                        size: 45,
                      )
                    : SizedBox(
                        width: 250,
                        height: 45,
                        child: RaisedButton(
                            color: bgHitam,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            child: Text(
                              "Create My Accoun",
                              style: putihTextFont.copyWith(fontSize: 16),
                            ),
                            onPressed: () async {
                              setState(() {
                                isSigninUp = true;
                              });
                              imageFileToUpload =
                                  widget.registrationData.profile;
                              SignInSignUpResult result =
                                  await AuthServices.signUp(
                                      widget.registrationData.email,
                                      widget.registrationData.password,
                                      widget.registrationData.name);
                              if (result.user == null) {
                                setState(() {
                                  isSigninUp = false;
                                });
                                Flushbar(
                                  duration: Duration(milliseconds: 1500),
                                  flushbarPosition: FlushbarPosition.TOP,
                                  backgroundColor: Color(0xffff5c83),
                                  message: result.message,
                                )..show(context);
                              }
                            }))
              ],
            ),
          ],
        ),
      )),
    );
  }
}
