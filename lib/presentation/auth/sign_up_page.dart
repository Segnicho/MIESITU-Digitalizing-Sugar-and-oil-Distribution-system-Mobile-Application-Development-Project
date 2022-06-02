import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
// import 'package:easy_localization/easy_localization.dart';

import 'package:labpract/application/auth/bloc/auth_bloc.dart';
import 'package:labpract/application/auth/events/auth_events.dart';
import 'package:labpract/application/auth/states/auth_state.dart';
import 'package:labpract/domain/auth/entity/auth_model.dart';
import 'package:labpract/presentation/auth/Login_screen.dart';

class SignUp extends StatefulWidget {
  SignUp();

  @override
  _FarmerSignUpState createState() => _FarmerSignUpState();
}

class _FarmerSignUpState extends State<SignUp> {
  final emailController = TextEditingController();
  final usernameController = TextEditingController();
  final firstnameController = TextEditingController();
  final lastnameController = TextEditingController();
  final passwordController = TextEditingController();
  final password2Controller = TextEditingController();
  int _role = 1;
  // Locale _language = Locale('am');

  bool obscureText = true;

  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var signUpBloc = BlocProvider.of<AuthBloc>(context);

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is Registering) {
              const CircularProgressIndicator();
            }
            // else if (state is RegisterError) {
            //   ScaffoldMessenger.of(context).showSnackBar(
            //       const SnackBar(content: Text("error on registrateion")));
            // }
            else if (state is RegisterSuccess) {
              GoRouter.of(context).push('login');
            }
          },
          child: Stack(
            children: [
              /*  Positioned(
                child: Bubble(
                  height: 160.0,
                  width: 160.0,
                ),
                top: -5,
                left: -160,
              ),
              Positioned(
                child: Bubble(
                  height: 300.0,
                  width: 300,
                ),
                top: 120,
                left: 180,
              ), */
              Positioned.fill(
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // IconButton(
                              //     onPressed: () => {Navigator.pop(context)},
                              //     icon: const Icon(
                              //       FontAwesomeIcons.arrowLeft,
                              //       size: 20,
                              //       color: Color(0xff222222),
                              //     )),
                              // Column(
                              //   children: [
                              //     // Container(
                              //     //     width: 150,
                              //     //     height: 100,
                              //     //     decoration: const BoxDecoration(
                              //     //         image: const DecorationImage(
                              //     //             image:
                              //     //                 AssetImage("assets/METANE.png"),
                              //     //             fit: BoxFit.contain))),
                              //     // const Text("Mitane_ App",
                              //     //     style: TextStyle(
                              //     //         fontSize: 28.0,
                              //     //         color: Color(0xff04471a),
                              //     //         fontWeight: FontWeight.w800)),
                              //     Container(
                              //       width:
                              //           MediaQuery.of(context).size.width - 150,
                              //       child: const Text(
                              //           "Mitane_ is_ app_ for_ Famers_ Users_ and_ Traders_n_to_ facilitate_ Agriculture",
                              //           textAlign: TextAlign.center,
                              //           style: const TextStyle(
                              //               fontSize: 12.0,
                              //               color: const Color(0xffc1c1c1),
                              //               fontWeight: FontWeight.normal)),
                              //     )
                              //   ],
                              // ),
                              const SizedBox(
                                width: 50,
                              )
                            ],
                          ),
                        ),
                        const SizedBox(height: 30),
                        const Text('Create_ Account',
                            style: TextStyle(
                                fontSize: 34,
                                fontWeight: FontWeight.bold,
                                color: Color(0xff2e2e2e))),
                        const SizedBox(height: 5),
                        const Divider(
                          endIndent: 100,
                          indent: 100,
                        ),
                        const Text('WelC Come, Sign up here',
                            style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff919191))),
                        const SizedBox(height: 25),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 40),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // const Text('Language',
                              //     style: const TextStyle(
                              //         fontSize: 15,
                              //         fontWeight: FontWeight.w400,
                              //         color: Color(0xff919191))),
                              const SizedBox(height: 8),
                              Material(
                                elevation: 2,
                                borderRadius: BorderRadius.circular(5),
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 5),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  // child: DropdownButton<Locale>(
                                  //   elevation: 2,
                                  //   // value: _language,
                                  //   underline: Container(),
                                  //   onChanged: (Locale? val) {
                                  //     setState(() {
                                  //       // _language = val!;
                                  //     });
                                  //     context.setLocale(val!);
                                  //   },
                                  // items: [
                                  //   DropdownMenuItem(
                                  //     value: Locale('am'),
                                  //     child: Text("አማርኛ"),
                                  //   ),
                                  //   DropdownMenuItem(
                                  //     value: Locale('en'),
                                  //     child: Text("English"),
                                  //   ),
                                  //   DropdownMenuItem(
                                  //     value: Locale('om'),
                                  //     child: Text("Oromifa"),
                                  //   ),
                                  // ],
                                  // isExpanded: true,
                                  // ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 40),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // const Text('Select_ Role',
                              //     style: TextStyle(
                              //         fontSize: 15,
                              //         fontWeight: FontWeight.w400,
                              //         color: const Color(0xff919191))),
                              // const SizedBox(height: 8),
                              // Material(
                              //   elevation: 2,
                              //   borderRadius: BorderRadius.circular(5),
                              //   child: Container(
                              //     padding: const EdgeInsets.symmetric(
                              //         horizontal: 10, vertical: 5),
                              //     decoration: BoxDecoration(
                              //       color: Colors.white,
                              //       borderRadius: BorderRadius.circular(5),
                              //     ),
                              // child: DropdownButton(
                              //   elevation: 2,
                              //   value: _role,
                              //   underline: Container(),
                              //   items: [
                              // const DropdownMenuItem(
                              //   child: Text("User"),
                              //   value: 1,
                              // ),
                              // const DropdownMenuItem(
                              //   child: const Text("Admin"),
                              //   value: 2,
                              // ),
                              /* DropdownMenuItem(
                                        child: Text("Product Trader"),
                                        value: 3,
                                      ),
                                      DropdownMenuItem(
                                        child: Text("Tool Trader"),
                                        value: 4,
                                      ), */
                              // DropdownMenuItem(
                              //   child: Text("Users"),
                              //   value: 5,
                              // ),
                              // ],
                              //   onChanged: (int? value) {
                              //     setState(() {
                              //       _role = value!;
                              //     });
                              //   },
                              //   isExpanded: true,
                              // ),
                              // ),
                              // ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 40),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('Name',
                                  style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400,
                                      color: const Color(0xff919191))),
                              const SizedBox(height: 8),
                              Material(
                                elevation: 2,
                                borderRadius: BorderRadius.circular(5),
                                child: TextFormField(
                                  controller: usernameController,
                                  decoration: InputDecoration(
                                      fillColor: Colors.white,
                                      filled: true,
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(5),
                                        borderSide: BorderSide.none,
                                      ),
                                      hintText: 'Name'),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 40),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('First Name',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400,
                                      color: const Color(0xff919191))),
                              const SizedBox(height: 8),
                              Material(
                                elevation: 2,
                                borderRadius: BorderRadius.circular(5),
                                child: TextFormField(
                                  controller: firstnameController,
                                  decoration: InputDecoration(
                                      fillColor: Colors.white,
                                      filled: true,
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(5),
                                        borderSide: BorderSide.none,
                                      ),
                                      hintText: 'First Name'),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 40),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('Last Name',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400,
                                      color: const Color(0xff919191))),
                              const SizedBox(height: 8),
                              Material(
                                elevation: 2,
                                borderRadius: BorderRadius.circular(5),
                                child: TextFormField(
                                  controller: lastnameController,
                                  decoration: InputDecoration(
                                      fillColor: Colors.white,
                                      filled: true,
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(5),
                                        borderSide: BorderSide.none,
                                      ),
                                      hintText: 'lastName Name'),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 40),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('Email',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xff919191))),
                              const SizedBox(height: 8),
                              Material(
                                elevation: 2,
                                borderRadius: BorderRadius.circular(5),
                                child: TextFormField(
                                  controller: emailController,
                                  keyboardType: TextInputType.phone,
                                  textAlign: TextAlign.left,
                                  validator: (String? val) {
                                    if (val == null || val.isEmpty) {
                                      return "Email is required";
                                    }
                                    if (!RegExp(
                                            r"""^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+""")
                                        .hasMatch(val)) return "Invalid emial";
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    // prefix: Text('+251 '),
                                    focusedBorder: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                    errorBorder: InputBorder.none,
                                    disabledBorder: InputBorder.none,
                                    hintText: 'Email address',
                                    fillColor: Colors.white,
                                    filled: true,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5),
                                      borderSide: BorderSide.none,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 40),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('Password',
                                  style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xff919191))),
                              const SizedBox(height: 8),
                              Material(
                                elevation: 2,
                                borderRadius: BorderRadius.circular(5),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: TextFormField(
                                        controller: passwordController,
                                        obscuringCharacter: "*",
                                        obscureText: obscureText,
                                        // maxLength: 4,
                                        // maxLengthEnforcement:
                                        //     MaxLengthEnforcement
                                        //         .truncateAfterCompositionEnds,
                                        decoration: InputDecoration(
                                            fillColor: Colors.white,
                                            filled: true,
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              borderSide: BorderSide.none,
                                            ),
                                            hintText: 'Password'),
                                      ),
                                    ),
                                    IconButton(
                                      icon: Icon(obscureText
                                          ? Icons.visibility
                                          : Icons.visibility_off),
                                      onPressed: () {
                                        setState(() {
                                          obscureText = !obscureText;
                                        });
                                      },
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 40),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('Confirm_ Password',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400,
                                      color: const Color(0xff919191))),
                              const SizedBox(height: 8),
                              Material(
                                elevation: 2,
                                borderRadius: BorderRadius.circular(5),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: TextFormField(
                                        controller: password2Controller,
                                        obscuringCharacter: "*",
                                        obscureText: obscureText,
                                        // maxLength: 4,
                                        // maxLengthEnforcement:
                                        // MaxLengthEnforcement
                                        // .truncateAfterCompositionEnds,
                                        decoration: InputDecoration(
                                            fillColor: Colors.white,
                                            filled: true,
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              borderSide: BorderSide.none,
                                            ),
                                            hintText: 'Confirm_ Password'),
                                      ),
                                    ),
                                    IconButton(
                                      icon: Icon(obscureText
                                          ? Icons.visibility
                                          : Icons.visibility_off),
                                      onPressed: () {
                                        setState(() {
                                          obscureText = !obscureText;
                                        });
                                      },
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        BlocConsumer<AuthBloc, AuthState>(
                            bloc: signUpBloc,
                            builder: (context, state) {
                              if (state is Registering) {
                                return const Center(
                                    child: const SizedBox(
                                  width: 20,
                                  height: 20,
                                  child: CircularProgressIndicator(),
                                ));
                              }

                              return Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 40, vertical: 10),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text('open',
                                            style: TextStyle(
                                                fontSize: 26,
                                                fontWeight: FontWeight.bold,
                                                color:
                                                    const Color(0xff2e2e2e))),
                                        InkWell(
                                            onTap: () {
                                              if (!_formKey.currentState!
                                                  .validate()) return;
                                              final authBloc =
                                                  context.read<AuthBloc>();
                                              BlocProvider.of<AuthBloc>(context)
                                                  .add(RegisterEvent(
                                                      register: Register(
                                                username:
                                                    usernameController.text,
                                                first_name:
                                                    firstnameController.text,
                                                last_name:
                                                    lastnameController.text,
                                                email: emailController.text,
                                                password:
                                                    passwordController.text,
                                                password2:
                                                    password2Controller.text,
                                              )));
                                              // authBloc.add(RegisterEvent(
                                              //     register: (Register(
                                              //   username: usernameController.text,
                                              //   first_name:
                                              //       firstnameController.text,
                                              //   last_name: lastnameController.text,
                                              //   email: emailController.text,
                                              //   password: passwordController.text,
                                              //   password2: password2Controller.text,
                                              // ))));
                                              // role: _role.toString()))));
                                            },
                                            child: Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 30,
                                                      vertical: 20),
                                              decoration: BoxDecoration(
                                                color: const Color(0xff0a6430),
                                                borderRadius:
                                                    BorderRadius.circular(28),
                                              ),
                                              child: const Icon(
                                                FontAwesomeIcons.arrowRight,
                                                size: 15,
                                                color: Colors.white,
                                              ),
                                            )),
                                      ],
                                    ),
                                    if (state is RegisterError)
                                      Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            color: Colors.red),
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 15, vertical: 10),
                                        child: Text(state.errorMessage,
                                            style: const TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w300,
                                                color: Colors.white)),
                                      )
                                  ],
                                ),
                              );
                            },
                            listener: (context, state) {
                              if (state is RegisterSuccess) {
                                context.push('/login');
                                // GoRouter.of(context).push('/login');
                                // print("Succccccessssss");
                                // Navigator.pushAndRemoveUntil(
                                //     context,
                                //     MaterialPageRoute(
                                //         builder: (_) => const LoginScreen()),
                                //     (route) => false);
                              }
                            }),
                        const SizedBox(
                          height: 25,
                        ),
                        RichText(
                          text: TextSpan(
                              text: 'Already have an account?',
                              style: const TextStyle(
                                color: const Color(0xff222222),
                                fontSize: 15,
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                    text: ' Sign in',
                                    style: const TextStyle(
                                        color: Color(0xff0a6430), fontSize: 15),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        GoRouter.of(context).push('/login');

                                        // Navigator.pushNamed(context, '/login');
                                      })
                              ]),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
