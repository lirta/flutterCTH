part of 'pages.dart';

class SignUpPage extends StatefulWidget {
  final RegistrationData registrationData;
  SignUpPage(this.registrationData);
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController namaController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController retypePasswordController = TextEditingController();

  @override
  void initStation() {
    super.initState();
    namaController.text = widget.registrationData.name;
    emailController.text = widget.registrationData.email;
  }

  @override
  Widget build(BuildContext context) {
    context
        .bloc<ThemeBloc>()
        .add(ChangeTheme(ThemeData().copyWith(primaryColor: bgputihK)));
    return WillPopScope(
        onWillPop: () async {
          context.bloc<PageBloc>().add(GoToSplashPage());

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
                      margin: EdgeInsets.only(top: 20, bottom: 22),
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
                              "Create New\nAccount",
                              style: blackTextFont.copyWith(fontSize: 20),
                              textAlign: TextAlign.center,
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: 90,
                      height: 104,
                      child: Stack(
                        children: <Widget>[
                          Container(
                              height: 90,
                              width: 90,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image: (widget.registrationData.profile ==
                                              null)
                                          ? AssetImage("assets/user_pic.png")
                                          : FileImage(widget
                                              .registrationData.profile)))),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: GestureDetector(
                              onTap: () async {
                                //todo: gambar
                                if (widget.registrationData.profile == null) {
                                  widget.registrationData.profile =
                                      await getImage();
                                } else {
                                  widget.registrationData.profile = null;
                                }

                                setState(() {});
                              },
                              child: Container(
                                height: 28,
                                width: 28,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                        image: AssetImage(
                                            (widget.registrationData.profile ==
                                                    null)
                                                ? "assets/btn_add_photo.png"
                                                : "assets/btn_del_photo.png"),
                                        fit: BoxFit.cover)),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 36,
                    ),
                    TextField(
                      controller: namaController,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: new BorderSide(color: oren)),
                          labelText: "Full Name",
                          labelStyle: whiteTextFont,
                          hintText: "Full Name"),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: new BorderSide(color: oren)),
                          labelText: "Email",
                          labelStyle: whiteTextFont,
                          hintText: "Email"),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    TextField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          labelText: "Password",
                          labelStyle: whiteTextFont,
                          hintText: "Password"),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    TextField(
                      controller: retypePasswordController,
                      obscureText: true,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: new BorderSide(color: oren)),
                          labelText: "Confirm Password",
                          labelStyle: whiteTextFont,
                          hintText: "Confirm Password"),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    FloatingActionButton(
                        child: Icon(Icons.arrow_forward),
                        backgroundColor: oren,
                        elevation: 0,
                        onPressed: () {
                          if (!(namaController.text.trim() != "" &&
                              emailController.text.trim() != "" &&
                              passwordController.text.trim() != "" &&
                              retypePasswordController.text.trim() != "")) {
                            Flushbar(
                              duration: Duration(milliseconds: 1500),
                              flushbarPosition: FlushbarPosition.TOP,
                              backgroundColor: Color(0xFFFF5C83),
                              message: "Please fill all the fields",
                            )..show(context);
                          } else if (passwordController.text !=
                              retypePasswordController.text) {
                            Flushbar(
                              duration: Duration(milliseconds: 1500),
                              flushbarPosition: FlushbarPosition.TOP,
                              backgroundColor: Color(0xFFFF5C83),
                              message:
                                  "Mismatch password and confirmed password",
                            )..show(context);
                          } else if (passwordController.text.length < 6) {
                            Flushbar(
                              duration: Duration(milliseconds: 1500),
                              flushbarPosition: FlushbarPosition.TOP,
                              backgroundColor: Color(0xFFFF5C83),
                              message: "Password's length min 6 characters",
                            )..show(context);
                          } else if (!EmailValidator.validate(
                              emailController.text)) {
                            Flushbar(
                              duration: Duration(milliseconds: 1500),
                              flushbarPosition: FlushbarPosition.TOP,
                              backgroundColor: Color(0xFFFF5C83),
                              message: "Wrong formatted email address",
                            )..show(context);
                          } else {
                            widget.registrationData.name = namaController.text;
                            widget.registrationData.email =
                                emailController.text;
                            widget.registrationData.password =
                                passwordController.text;

                            context.bloc<PageBloc>().add(
                                GoToAccounConfirmationPage(
                                    widget.registrationData));
                          }
                        })
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
