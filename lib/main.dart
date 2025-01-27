import 'package:chatterboxadmin/services/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import 'blocs/blocs.dart';
import 'ui/pages/pages.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider.value(
        value: AuthServices.userStream,
        child: MultiBlocProvider(
            providers: [
              BlocProvider(create: (_) => PageBloc()),
              BlocProvider(create: (_) => UserBloc()),
              BlocProvider(create: (_) => ThemeBloc()),
            ],
            child: BlocBuilder<ThemeBloc, ThemeState>(
              builder: (_, themeState) => MaterialApp(
                  theme: themeState.themeData,
                  debugShowCheckedModeBanner: false,
                  home: Wrapper()),
            )));
  }
}

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return StreamProvider.value(
//         value: AuthServices.userStream,
//         child: MultiProvider(
//             providers: [
//               BlocProvider(create: (_) => PageBloc()),
//               BlocProvider(create: (_) => UserBloc()),
//               BlocProvider(create: (_) => ThemeBloc()),
//             ],
//             child: BlocBuilder<ThemeBloc, ThemeState>(
//               builder: (_, themeState) => MaterialApp(
//                   theme: themeState.themeData,
//                   debugShowCheckedModeBanner: false,
//                   home: Wrapper()),
//             )));
//   }
// }
