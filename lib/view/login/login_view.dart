import 'package:fitness/common/colo_extension.dart';
import 'package:fitness/common_widget/round_button.dart';
import 'package:fitness/common_widget/round_textfield.dart';
import 'package:fitness/view/login/complete_profile_view.dart';
import 'package:fitness/view/login/controller/login_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginView extends ConsumerStatefulWidget {
  const LoginView({super.key});

  @override
  ConsumerState<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends ConsumerState<LoginView> {
  bool isCheck = false;
  
  @override
  initState() {
    super.initState();

    
  }
  @override
  void dispose() {
  // I want dispose the controller
    ref.watch(loginProvider).nameController.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: TColor.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            height: media.height * 0.9,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Hey there,",
                  style: TextStyle(color: TColor.grey, fontSize: 16),
                ),
                Text(
                  "Welcome Back",
                  style: TextStyle(
                      color: TColor.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w700),
                ),
                // const Spacer(),
                SizedBox(
                  height: media.width * 0.65,
                ),
                Consumer(
                  builder: (context, ref, child) => RoundTextField(
                    hitText: "Name",
                    controller: ref.read(loginProvider).nameController,
                    icon: "assets/img/p_personal.png",
                    keyboardType: TextInputType.name,
                  ),
                ),
                // SizedBox(height: media.width * 0.04),
                // RoundTextField(
                //   hitText: "Password",
                //   icon: "assets/img/lock.png",
                //   obscureText: true,
                //   rigtIcon: TextButton(
                //       onPressed: () {},
                //       child: Container(
                //           alignment: Alignment.center,
                //           width: 20,
                //           height: 20,
                //           child: Image.asset(
                //             "assets/img/show_password.png",
                //             width: 20,
                //             height: 20,
                //             fit: BoxFit.contain,
                //             color: TColor.grey,
                //           ))),
                // ),
                SizedBox(height: media.width * 0.03),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Forgot your password?",
                      style: TextStyle(
                          color: TColor.grey,
                          fontSize: 10,
                          decoration: TextDecoration.underline),
                    ),
                  ],
                ),
                // const Spacer(),
                SizedBox(height: media.width * 0.06),
                Consumer(
                  builder: (context, ref, child) => RoundButton(
                      title: "Login",
                      onPressed: () {
                        if (ref
                            .read(loginProvider)
                            .nameController
                            .text
                            .isEmpty) {
                          return;
                        }
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const CompleteProfileView()));
                      }),
                ),
                SizedBox(height: media.width * 0.04),

                SizedBox(
                  height: media.width * 0.04,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
