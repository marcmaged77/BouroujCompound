import 'package:animate_do/animate_do.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pmvvm/pmvvm.dart';
import 'package:smart_city/Configurations/color.dart';
import 'package:smart_city/Extensions/extensions.dart';
import 'package:smart_city/widgets/widgets.dart';
import 'forgot_password_viewmodel.dart';
import 'package:flutter/material.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MVVM(
      view: (_, __) => ForgotPasswordView(),
      viewModel: ForgotViewModel(),
    );
  }
}

class ForgotPasswordView extends HookView<ForgotViewModel> {
  @override
  Widget render(BuildContext context, ForgotViewModel viewModel) {
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
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: Icon(
                Iconsax.close_circle,
                color: Colors.black,
                size: 30,
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                FadeInDown(
                    duration: Duration(milliseconds: 300),
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Reset Password",
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),),),
                SizedBox(
                  height: 20,
                ),
                FadeInDown(
                    duration: Duration(milliseconds: 400),
                    child: Text(
                      "Enter the Email or PhoneNumber Associated with your account and we will send the instructions to reset your password ",
                      style: TextStyle(fontSize: 18, color: Colors.black),
                    ),),
                SizedBox(
                  height: 30,
                ),
                FadeInDown(
                    duration: Duration(milliseconds: 500),
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Email or Phone Number ",
                          style: TextStyle(
                              fontSize: 18, color: Colors.black),
                        ),),),
                SizedBox(
                  height: 10,
                ),
                FadeInDown(
                    delay: Duration(milliseconds: 600),
                    child: CustomContainer(
                        child: styledTextField(
                            // leadingIcon: Icon(
                            //   Icons.info_rounde,
                            //   size: 18,
                            //   color: Colors.black,
                            // ),
                            controller: viewModel.phoneNumberEmail,
                            label: '',
                            hintText: ''),),),
                SizedBox(
                  height: 30,
                ),
                FadeInUp(
                  delay: Duration(milliseconds: 400),
                  child: MaterialButton(
                    onPressed: () {
                      // Navigator.pushNamed(context, PageRouteName.otp);
                    },
                    height: 45,
                    color:  Colors.black,
                    child: Text(
                      "Send Instructions",
                      style: TextStyle(color: Colors.white, fontSize: 16.0),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal:70),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),

              ],
            ).setPageHorizontalPadding(context),
          ),
        ));
  }
}
class CustomContainer extends StatelessWidget {
  Widget child;
  CustomContainer({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white38,
        // borderRadius: BorderRadius.circular(8),
        borderRadius: BorderRadius.circular(15.0),

        boxShadow: [
          BoxShadow(
            color: Color(0xffeeeeee),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: child,
    );
  }
}
