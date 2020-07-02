// part of 'pages.dart';

part of 'pages.dart';

// class MainPage extends StatefulWidget {
//   @override
//   _MainPageState createState() => _MainPageState();
// }

// class _MainPageState extends State<MainPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Main Page"),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             BlocBuilder<UserBloc, UserState>(
//                 builder: (_, userState) => (userState is UserLoaded)
//                     ? Text(userState.user.name)
//                     : SizedBox(
//                         child: Text("kosong"),
//                       )),
//             RaisedButton(
//                 child: Text("Sign Out"),
//                 onPressed: () {
//                   AuthServices.signOut();
//                 }),
//           ],
//         ),
//       ),
//     );
//   }
// }

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int bottomNavBarIndex;
  PageController pageController;

  @override
  void initState() {
    super.initState();
    bottomNavBarIndex = 0;
    pageController = PageController(initialPage: bottomNavBarIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            color: bgHitam,
          ),
          SafeArea(
              child: Container(
            color: bgputihK,
          )),
          PageView(
            controller: pageController,
            onPageChanged: (index) {
              setState(() {
                bottomNavBarIndex = index;
              });
            },
            children: <Widget>[
              MenuPage(),
              Center(
                child: Text("order"),
              )
            ],
          ),
          createCustomBottomNavBar(),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 46,
              width: 46,
              margin: EdgeInsets.only(bottom: 42),
              child: FloatingActionButton(
                  elevation: 0,
                  backgroundColor: oren,
                  child: SizedBox(
                    height: 26,
                    width: 26,
                    child: Icon(
                      Icons.add_circle_outline,
                      color: bghitamMuda.withOpacity(0.54),
                    ),
                  ),
                  onPressed: () {
                    context.bloc<UserBloc>().add(SignOut());
                    AuthServices.signOut();
                  }),
            ),
          )
        ],
      ),
    );
  }

  Widget createCustomBottomNavBar() => Align(
        alignment: Alignment.bottomCenter,
        child: ClipPath(
          clipper: BottumNavBarClipper(),
          child: Container(
            height: 70,
            decoration: BoxDecoration(
                color: bgputih,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20))),
            child: BottomNavigationBar(
                elevation: 0,
                backgroundColor: Colors.transparent,
                selectedItemColor: bghitamMuda,
                unselectedItemColor: bgputihK,
                currentIndex: bottomNavBarIndex,
                onTap: (index) {
                  setState(() {
                    bottomNavBarIndex = index;
                    pageController.jumpToPage(index);
                  });
                },
                items: [
                  BottomNavigationBarItem(
                      title: Text(
                        "Menu",
                        style: GoogleFonts.fjallaOne(
                            fontSize: 13, fontWeight: FontWeight.w600),
                      ),
                      icon: Container(
                        margin: EdgeInsets.only(bottom: 6),
                        height: 20,
                        child: Image.asset((bottomNavBarIndex == 0)
                            ? "assets/ic_movie.png"
                            : "assets/ic_movie_grey.png"),
                      )),
                  BottomNavigationBarItem(
                      title: Text(
                        "Orders",
                        style: GoogleFonts.fjallaOne(
                            fontSize: 13, fontWeight: FontWeight.w600),
                      ),
                      icon: Container(
                        margin: EdgeInsets.only(bottom: 6),
                        height: 20,
                        child: Image.asset((bottomNavBarIndex == 1)
                            ? "assets/ic_tickets.png"
                            : "assets/ic_tickets_grey.png"),
                      ))
                ]),
          ),
        ),
      );
}

class BottumNavBarClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(size.width / 2 - 28, 0);
    path.quadraticBezierTo(size.width / 2 - 28, 33, size.width / 2, 33);
    path.quadraticBezierTo(size.width / 2 + 28, 33, size.width / 2 + 28, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
