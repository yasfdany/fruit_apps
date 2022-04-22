import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fruit_apps/ui/components/ripple_button.dart';
import 'package:fruit_apps/ui/home_screen.dart';
import 'package:get/get.dart';

import '../data/controillers/user_controller.dart';

class LoginScreen extends StatefulWidget {
  static const route = "/login";

  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final UserController userController = Get.put(UserController());
  final RxBool loading = RxBool(false);

  @override
  void initState() {
    super.initState();
    userController.getUser();
    SchedulerBinding.instance?.addPostFrameCallback((_) async {
      if (userController.user != null) {
        Navigator.pushReplacementNamed(context, HomeScreen.route);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Login",
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.all(32),
            child: Obx(
              () => loading.value
                  ? const Center(child: CircularProgressIndicator())
                  : RippleButton(
                      radius: 4,
                      enableShadow: true,
                      color: Theme.of(context).primaryColor,
                      onTap: () {
                        loading.value = true;
                        userController.login(
                          onFinish: (credential) {
                            Fluttertoast.showToast(msg: "Successfull Loged in");
                            Navigator.pushReplacementNamed(
                                context, HomeScreen.route);
                          },
                          onFailed: (error) {
                            Fluttertoast.showToast(msg: error.toString());
                          },
                        );
                      },
                      text: "Login",
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
