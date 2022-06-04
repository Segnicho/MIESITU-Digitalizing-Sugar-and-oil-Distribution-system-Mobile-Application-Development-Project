import 'dart:js';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:labpract/application/auth/bloc/auth_bloc.dart';
import 'package:labpract/application/auth/states/auth_state.dart';
import 'package:labpract/domain/announcement/announcement_model.dart';
import 'package:labpract/domain/poducts/models/product.dart';
import 'package:labpract/gloabl/route_name_constants.dart';
import 'package:labpract/gloabl/user_profile.dart';
import 'package:labpract/presentation/adminhome.dart';
import 'package:labpract/presentation/announcement/announce_admin.dart';
import 'package:labpract/presentation/announcement/user_announcement.dart';
import 'package:labpract/presentation/auth/Login_screen.dart';
import 'package:labpract/presentation/auth/sign_up_page.dart';
import 'package:labpract/presentation/products/screens/screens.dart';
import 'package:labpract/presentation/userhome.dart';

class MiesituRouter {
  // final AdminLoginSuccess adminLoginState;
  // final LoginSuccess loginState;
  // MiesituRouter(this.loginState, this.adminLoginState);
  // MiesituRouter();

  static final router = GoRouter(
// refreshListenable: ,
// refreshListenable : GoRouterRefreshStream(AuthBloc.stream),

      routes: <GoRoute>[
        GoRoute(
            name: loginRoute,
            path: '/login',
            pageBuilder: (context, state) =>
                const MaterialPage<void>(child: LoginScreen()),
            routes: <GoRoute>[
              GoRoute(
                  name: registerRoute,
                  path: '/signup',
                  pageBuilder: (context, state) =>
                      MaterialPage<void>(child: SignUp())),
            ]),
        GoRoute(
            name: userHomeRoute,
            path: '/userhome',
            pageBuilder: (context, state) =>
                MaterialPage<void>(child: UserHome()),
            routes: <GoRoute>[
              // GoRoute(
              //     name: userAnnouncement,
              //     path: 'userannouncement',
              //     pageBuilder: (context, state) =>
              //         const MaterialPage<void>(child: UserAnnouncementPage())),
              // GoRoute(
              //     name: userProfile,
              //     path: 'userprofile',
              //     pageBuilder: (context, state) =>
              //         const MaterialPage<void>(child: UserProfilePage()))
            ]),

        // GoRoute(
        //     name: userAnnouncement,
        //     path: '/userAnnouncement',
        //     pageBuilder: (context, state) =>
        //         MaterialPage<void>(child: )),

        GoRoute(
            name: adminHomeRoute,
            path: '/adminHome',
            pageBuilder: (context, state) =>
                MaterialPage<void>(child: AdminHome()),
            routes: <GoRoute>[
              GoRoute(
                name: adminAnnounce,
                path: 'adminAnnounce',
                pageBuilder: (context, state) =>
                    const MaterialPage<void>(child: const AdminAnnounce()),
              ),
              GoRoute(
                name: adminAnnounce,
                path: 'adminAnnounce',
                pageBuilder: (context, state) =>
                    const MaterialPage<void>(child: const AdminAnnounce()),
              ),
              GoRoute(
                name: adminProfile,
                path: 'adminProfile',
                pageBuilder: (context, state) =>
                    const MaterialPage<void>(child: const AdminAnnounce()),
              ),
              GoRoute(
                name: adminProduct,
                path: 'adminProduct',
                pageBuilder: (context, state) =>
                    const MaterialPage<void>(child: AdminAnnounce()),
              ),
            ]),

        // GoRoute(
        //     name: adminHomeRoute,
        //     path: '/adminHome',
        //     pageBuilder: (context, state) =>
        //         MaterialPage<void>(child: AdminHome())),

        // GoRoute(
        //     name: adminHomeRoute,
        //     path: '/user-home/:param(announncement|productsView|profile)',
        //     pageBuilder: (context, state) => MaterialPage(child: UserHome()),
        //     routes: <GoRoute>[
        //       GoRoute(
        //         path: 'product-detail',
        //         // pageBuilder: (context, state)=>MaterialPage(child:  ProductDetail();
        //       ),
        //       GoRoute(
        //         path: 'product-detail',
        //         // pageBuilder: (context, state)=>MaterialPage(child:  ProductDetail();
        //       ),
        //     ]),
        //   GoRoute(
        //       name: adminHomeRoute,
        //       path: '/admin-home/:param(announce|productsPost|adminProfile)',
        //       pageBuilder: (context, state) => MaterialPage(child: UserHome()),
        //       routes: <GoRoute>[]),

        // GoRoute(path: '/announcement',

        // redirect: (state) => state.namedLocation(userHomeRoute, params: {'param':'announcement'})

        // ),
        // GoRoute(
        // path: '/productsView',

        // redirect: (state) => state.namedLocation(userHomeRoute, params: {'param':'productsView'})

        // ),
        // GoRoute(path: '/profile',

        // redirect: (state) => state.namedLocation(userHomeRoute, params: {'param':'profile'})

        // ),

        // GoRoute(path: '/announce',

        // redirect: (state) => state.namedLocation(adminHomeRoute, params: {'param':'announce'})

        // ),
        // GoRoute(
        // path: '/productsPost',

        // redirect: (state) => state.namedLocation(adminHomeRoute, params: {'param':'productsPost'})

        // ),
        // GoRoute(path: '/adminProfile',

        // redirect: (state) => state.namedLocation(adminHomeRoute, params: {'param':'adminProfile'})

        // )
      ]
      // redirect: (state){
      //   final isLogedin =
      // }

      );
}
