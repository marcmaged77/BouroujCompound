import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pmvvm/pmvvm.dart';
import 'package:smart_city/Configurations/color.dart';
import 'package:smart_city/Configurations/constants.dart';
import 'package:smart_city/Configurations/page_route_name.dart';
import 'package:smart_city/pages/Auth/register/register_view.dart';
import 'package:smart_city/widgets/widgets.dart';

import 'login_viewmodel.dart';
import 'package:smart_city/Extensions/padding_ext.dart';
import 'package:flutter/widgets.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MVVM(
      view: (_, __) => LoginView(),
      viewModel: LoginViewModel(),
    );
  }
}

class LoginView extends HookView<LoginViewModel> {
  @override
  Widget render(BuildContext context, LoginViewModel viewModel) {
    final mediaQuery = MediaQuery.of(context);
    final theme = Theme.of(context);

    return GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);

          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: Scaffold(
          backgroundColor: Color(0xff1F303D),
          // backgroundColor:Colors.white,

          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 50,
                ),
                // duration: Duration(milliseconds: 1000),

                SizedBox(
                  height: 350,
                  child: Hero(
                      tag: 'logo',
                      transitionOnUserGestures: true,
                      child: Image.asset(
                        Constants.logoUrl,
                        scale: 11,
                      )),
                ),
                FadeInDown(
                  delay: const Duration(milliseconds: 700),
                  duration: const Duration(milliseconds: 1000),
                  child: styledTextField(
                    colorHint: viewModel.black ? Colors.black.withOpacity(0.3) : Colors.black.withOpacity(0.3),
                    colorLabel:  viewModel.black ? Colors.black : Colors.white,
                    colorBorderFocus: AppColors.secondaryColor,
                    styleTextInput: viewModel.black ? Colors.black : Colors.white,
                    cursorColor: AppColors.secondaryColor,
                    colorBorderUnFocus:  viewModel.black  ? Colors.black.withOpacity(0.5) : Colors.white.withOpacity(0.5),
                    label: 'Email',
                    hintText: 'Username or e-mail',
                    controller: viewModel.emailController,
                    leadingIcon: Icon(
                      Iconsax.user,
                      color: Colors.grey,
                      size: 18,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                FadeInDown(
                  delay: const Duration(milliseconds: 700),
                  duration: const Duration(milliseconds: 1000),
                  child: styledTextField(
                    colorHint: viewModel.black ? Colors.black.withOpacity(0.3) : Colors.white.withOpacity(0.3),
                    colorLabel: viewModel.black ? Colors.black : Colors.white,
                    colorBorderFocus: AppColors.secondaryColor,
                    styleTextInput:viewModel.black ? Colors.black : Colors.white,
                    cursorColor: AppColors.secondaryColor,
                    colorBorderUnFocus: viewModel.black ? Colors.black.withOpacity(0.5) :  Colors.white.withOpacity(0.5)  ,
                    label: 'Password',
                    hintText: 'Password',
                    obscureText: true,
                    controller: viewModel.emailController,
                    leadingIcon: const Icon(
                      Iconsax.key,
                      color: Colors.grey,
                      size: 18,
                    ),
                  ),
                ),
                FadeInRight(
                  delay: Duration(milliseconds: 400),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          // Navigator.pushReplacementNamed(context, PageRouteName.initial);
                          Navigator.pushNamed(
                              context, PageRouteName.forgotPassword);
                        },
                        child: Text(
                          'Forgot Password?',
                          style: TextStyle(
                              color: viewModel.black ? Colors.black.withOpacity(0.6) : Colors.white.withOpacity(0.6) ,
                              fontSize: 14.0,
                              fontWeight: FontWeight.w400),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                FadeInUp(
                  delay: const Duration(milliseconds: 400),
                  child: MaterialButton(
                    onPressed: () {
                      Navigator.pushNamed(context, PageRouteName.otp);
                    },
                    height: 45,
                    color: AppColors.buttonColor,
                    child: const Text(
                      "Login",
                      style: TextStyle(color: Colors.white, fontSize: 16.0),
                    ),
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                FadeIn(
                  delay: const Duration(milliseconds: 400),
                  duration: const Duration(milliseconds: 2000),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don\'t have an account?',
                        style: TextStyle(
                            color: Colors.grey.shade600,
                            fontSize: 14.0,
                            fontWeight: FontWeight.w300),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, PageRouteName.register);

                          // EasyLoading.show();
                          // Future.delayed(Duration(milliseconds: 2000) , () => EasyLoading.dismiss());
                        },
                        child: const Text(
                          'Register',
                          style: TextStyle(
                              color:AppColors.primaryColor,
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ).setPageHorizontalPadding(context),
          ),
        ));
  }
}
