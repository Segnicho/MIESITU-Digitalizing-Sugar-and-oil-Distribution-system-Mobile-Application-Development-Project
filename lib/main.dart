// import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:go_router/go_router.dart';
import 'package:labpract/application/auth/bloc/auth_bloc.dart';
import 'package:labpract/application/auth/bloc/status_bloc.dart';
import 'package:labpract/application/auth/events/status_events.dart';
// import 'package:labpract/application/auth/events/auth_events.dart';
// import 'package:labpract/application/auth/states/auth_state.dart';
// import 'package:labpract/application/products/bloc/bloc.dart';
// import 'package:labpract/domain/auth/entity/auth_model.dart';
// import 'package:labpract/domain/poducts/models/product.dart';
import 'package:labpract/gloabl/routes.dart';
import 'package:labpract/infra/auth/repository/auth_repository.dart';
// import 'package:labpract/infra/products/data_provider/product_data.dart';
// import 'package:labpract/infra/products/repository/product_repository.dart';
// // import 'package:labpract/gloabl/adminhome.dart';
// import 'package:labpract/presentation/auth/Login_screen.dart';
// import 'package:labpract/presentation/auth/sign_up_page.dart';
// import 'package:labpract/presentation/products/screens/add_product.dart';
// // import 'package:labpract/presentation/products/screens/announcement_admin.dart';
// import 'package:labpract/presentation/products/screens/product_route.dart';
// import 'package:labpract/gloabl/userhome.dart';
// import 'package:labpract/test.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final rotr = MiesituRouter.router;
  AuthRepository? repo;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: MultiBlocProvider(
          providers: [
            BlocProvider<AuthBloc>(
              create: (context) => AuthBloc(AuthRepository()),
            ),
            // BlocProvider(
            //   create: (context) =>
            //       CurrentStatusBloc(context.read<AuthRepository>())
            //         ..add(CheckAuthenticationEvent())),
          ],
          child: MaterialApp.router(
            routerDelegate: rotr.routerDelegate,
            routeInformationParser: rotr.routeInformationParser,
            // initialRoute: '/',
            // routes:{

            // }
          ),
        ));
  }
}

// final GoRouter _router = GoRouter(
//   initialLocation: '/',
//   routes: <GoRoute>[
//     GoRoute(
//         path: '/',
//         builder: (BuildContext context, GoRouterState state) => SignUp(),
//         routes: <GoRoute>[
//           GoRoute(
//             path: 'login',
//             name: 'login',
//             builder: (context, state) => LoginScreen(),
//           ),

//           // routes: <GoRoute>[
//           // GoRoute(
//           //   path: 'home',
//           //   builder: (BuildContext context, GoRouterState state) =>
//           //       MyHomePage(title: "My Home"),
//           // )
//           // ]),
//           // GoRoute(
//           //   path: 'home',
//           //   builder: (BuildContext context, GoRouterState state) =>
//           //       MyHomePage(title: "My Home"),
//           // ),
//           // GoRoute(
//           //   path: 'adminhome',
//           //   name: 'adminhome',
//           //   builder: (BuildContext context, GoRouterState state) => AdminHome(),
//           // )
//         ]),
//     GoRoute(
//         path: '/home',
//         name: 'userhome',
//         builder: (BuildContext context, GoRouterState state) =>
//             MyHomePage(title: "My Home")),
//     // routes: <GoRoute>[
//     // GoRoute(path: 'contact',
//     // // builder: (context, state) =>ContactPage()
//     // ) ,
//     // GoRoute(path: 'announce',
//     // // builder: (context, state) =>UserAnnouncementPage()
//     // ) ,

//     // GoRoute(
//     //   path: 'profile',
//     // // builder: (context, state) =>UserProfile()
//     // )
//     // ]
//     // ),
//     GoRoute(
//       path: '/adminhome',
//       name: "adminhome",
//       builder: (context, state) => AdminHome(),
//       // routes: <GoRoute>[
//       //   GoRoute(path: 'announce',
//       //   builder: (context, state) => Announcement(),
//       //   ),
//       //   GoRoute(path: 'product',
//       //   builder: (context, state) =>    ProductPage)

//       // GoRoute(
//       //   path: 'profile',
//       // builder: (context, state) =>AdminProfile()
//       // )
//       // ]),

//       //   GoRoute(
//       //       path: '/login',
//       //       builder: (BuildContext context, GoRouterState state) =>
//       //           const LoginScreen(),
//       //       routes: <GoRoute>[
//       //         GoRoute(
//       //           path: 'home',
//       //           builder: (BuildContext context, GoRouterState state) => UserHome(),
//       //         ),
//       //         GoRoute(
//       //           path: 'adminhome',
//       //           builder: (BuildContext context, GoRouterState state) => AdminHome(),
//       //         ),
//       //       ]),
//     )
//   ],
// );

// // BlocListener<AuthBloc, AuthState>(listener: ((context, state) {
// //           if (state is InitState) {
// //             GoRouter.of(context).push('/signup');
// //           } else if (state is Registering) {
// //             CircularProgressIndicator();
// //           } else if (state is RegisterSuccess) {
// //             GoRouter.of(context).push('/login');
// //           }
// //         }))

// // import 'package:flutter/material.dart';
// // import 'package:labpract/student.dart';

// // void main() {
// //   runApp(const MyApp());
// // }

// // class MyApp extends StatelessWidget {
// //   const MyApp({Key? key}) : super(key: key);

// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       title: 'Connect Flutter with Django',
// //       theme: ThemeData(
// //         primarySwatch: Colors.blue,
// //       ),
// //       home: const MyHomePage(title: 'Connect Flutter with Django'),
// //     );
// //   }
// // }

// // class MyHomePage extends StatefulWidget {
// //   const MyHomePage({Key? key, required this.title}) : super(key: key);

// //   final String title;

// //   @override
// //   State<MyHomePage> createState() => _MyHomePageState();
// // }

// // class _MyHomePageState extends State<MyHomePage> {
// //   Student studentService = Student();
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //         appBar: AppBar(
// //           title: Text("Faaccko"),
// //         ),
// //         body: Container(
// //           child: FutureBuilder<List>(
// //             future: studentService.getAllStudent(),
// //             builder: (context, snapshot) {
// //               print(snapshot);
// //               // print(snapshot.data![1]['user_name']);
// //               // print(snapshot.data.length);
// //               if (snapshot.hasData) {
// //                 return Container(
// //                   height: 80,
// //                   child: new ListView.builder(
// //                       itemCount: snapshot.data?.length,
// //                       itemBuilder: (context, i) {
// //                         return new Card(
// //                           child: ListTile(
// //                             leading: Text(snapshot.data![i]['user_name']),
// //                             title: Text(
// //                               snapshot.data![i]['email'],
// //                               style: TextStyle(fontSize: 30.0),
// //                             ),
// //                             subtitle: Text(
// //                               snapshot.data![i]['first_name'],
// //                               style: TextStyle(fontSize: 30.0),
// //                             ),
// //                             trailing: Text(
// //                               snapshot.data![i]['last_name'],
// //                               style: TextStyle(fontSize: 30.0),
// //                             ),
// //                           ),
// //                         );
// //                       }),
// //                 );
// //               } else {
// //                 return const Center(
// //                   child: Text('Noo Data Found'),
// //                 );
// //               }
// //             },
// //           ),
// //         ));
// //   }
// // }
