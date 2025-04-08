import 'package:clase_4_diplomado/pages/tabs_pages.dart';
import 'package:clase_4_diplomado/repository/user_repository.dart';
import 'package:clase_4_diplomado/services/new_services.dart';
import 'package:clase_4_diplomado/theme/tema.dart';
import 'package:clase_4_diplomado/ui/home_page.dart';
import 'package:clase_4_diplomado/viewmodel/user_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// void main() {
//   runApp(
//     MultiProvider(
//       providers: [
//         Provider<UserRepository>(create: (_) => FakeUserRepository()),
//         ChangeNotifierProvider<UserViewModel>(
//           create:
//               (context) =>
//                   UserViewModel(repository: context.read<UserRepository>()),
//         ),
//       ],
//       child: MyApp(),
//     ),
//   );
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(home: HomePage());
//   }
// }

// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: TabsPages(),
//     );
//   }
//
// }

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => NewsServices()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: miTema,
        debugShowCheckedModeBanner: false,
        home: TabsPages(),
      ),
    );
  }
}