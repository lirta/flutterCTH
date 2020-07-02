part of 'shared.dart';

const double defaultMargin = 24;
Color bgHitam = Color(0xff0D0D0D);
Color bgAbu = Color(0xff40453c);
Color bgputih = Color(0xfff7f6f1);
Color bgputihK = Color(0xffeeebdd);
Color bghitamMuda = Color(0xff17161E);
Color oren = Color(0xffF86748);

int value() => 0xF867488;

TextStyle blackTextFont = GoogleFonts.fjallaOne()
    .copyWith(color: Colors.black, fontWeight: FontWeight.w500);
TextStyle whiteTextFont =
    GoogleFonts.fjallaOne().copyWith(color: bgAbu, fontWeight: FontWeight.w500);
TextStyle orenTextFont =
    GoogleFonts.fjallaOne().copyWith(color: oren, fontWeight: FontWeight.w500);
TextStyle putihTextFont = GoogleFonts.fjallaOne()
    .copyWith(color: bgputih, fontWeight: FontWeight.w500);
TextStyle abuTextFont = GoogleFonts.fjallaOne()
    .copyWith(color: bgputihK, fontWeight: FontWeight.w500);

TextStyle blackNumFont = GoogleFonts.fjallaOne()
    .copyWith(color: Colors.black, fontWeight: FontWeight.w500);
TextStyle orenNumFont =
    GoogleFonts.fjallaOne().copyWith(color: oren, fontWeight: FontWeight.w500);
