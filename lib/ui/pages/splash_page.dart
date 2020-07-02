part of 'pages.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgputih,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: defaultMargin),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 180,
              decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage("assets/cxb.png"))),
            ),
            Container(
              margin: EdgeInsets.only(top: 70, bottom: 16),
              child: Text(
                "Enjoy Your Time",
                style: blackTextFont.copyWith(fontSize: 20),
              ),
            ),
            Container(
              width: 250,
              height: 46,
              margin: EdgeInsets.only(top: 90, bottom: 19),
              child: RaisedButton(
                  color: bgAbu,
                  child: Text(
                    "Get Started",
                    style: putihTextFont.copyWith(fontSize: 20),
                  ),
                  onPressed: () {
                    context
                        .bloc<PageBloc>()
                        .add(GoToRegistrationPage(RegistrationData()));
                  }),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Already have account?",
                    style: blackTextFont.copyWith(fontWeight: FontWeight.w400)),
                GestureDetector(
                  onTap: () {
                    context.bloc<PageBloc>().add(GoToLoginPage());
                  },
                  child: Text(
                    "Sign In",
                    style: orenTextFont.copyWith(fontWeight: FontWeight.w400),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
