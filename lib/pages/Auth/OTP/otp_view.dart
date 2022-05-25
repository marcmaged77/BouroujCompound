import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pmvvm/pmvvm.dart';
import 'package:flutter_verification_code/flutter_verification_code.dart';
import 'package:smart_city/Configurations/color.dart';
import 'package:smart_city/Configurations/page_route_name.dart';
import 'package:smart_city/Extensions/extensions.dart';
import 'otp_viewmodel.dart';

class Otp extends StatelessWidget {
  const Otp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MVVM(
      view: (_, __) => OtpView(),
      viewModel: OtpViewModel(),
    );
  }
}

class OtpView extends HookView<OtpViewModel> {
  @override
  Widget render(BuildContext context, OtpViewModel viewModel) {
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
            centerTitle: true,
            leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: Icon(
                Iconsax.close_circle,
                color: Colors.black,
                size: 30,
              ),
            ),
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: Text(
              'OTP',
              style: theme.textTheme.headline1,
            ),
          ),
          body: SingleChildScrollView(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 100,
              ),
              FadeInDown(
                  duration: const Duration(milliseconds: 500),
                  child: Text(
                    "Verification",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  )),
              const SizedBox(
                height: 30,
              ),
              FadeInDown(
                delay: const Duration(milliseconds: 500),
                duration: const Duration(milliseconds: 500),
                child: Text(
                  "Please enter the 5 digit code sent to \n +201113266564",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 16, color: Colors.grey.shade500, height: 1.5),
                ),
              ),
              const SizedBox(
                height: 30,
              ),

              // Verification Code Input
              FadeInDown(
                delay: const Duration(milliseconds: 600),
                duration: const Duration(milliseconds: 500),
                child: VerificationCode(
                  length: 5,
                  textStyle: TextStyle(fontSize: 20, color: Colors.black),
                  underlineColor: Colors.black,
                  keyboardType: TextInputType.number,
                  underlineUnfocusedColor: Colors.black,
                  onCompleted: (value) {},
                  onEditing: (value) {},
                ),
              ),

              const SizedBox(
                height: 20,
              ),
              FadeInDown(
                delay: const Duration(milliseconds: 700),
                duration: const Duration(milliseconds: 500),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Didn't receive OTP?",
                      style:
                          TextStyle(fontSize: 14, color: Colors.grey.shade500),
                    ),
                    // TextButton(
                    //     onPressed: () {
                    //       if (_isResendAgain) return;
                    //       resend();
                    //     },
                    //     child: Text(_isResendAgain ? "Try again in " + _start.toString() : "Resend", style: TextStyle(color: Colors.blueAccent),)
                    // )
                  ],
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              FadeInDown(
                delay: const Duration(milliseconds: 800),
                duration: const Duration(milliseconds: 500),
                child: MaterialButton(
                  elevation: 0,
                  onPressed: () {
                    Navigator.pushNamed(context, PageRouteName.main);
                  },
                  color:  Colors.black,
                  minWidth: MediaQuery.of(context).size.width * 0.5,
                  height: 50,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child:
                      // _isLoading ? Container(
                      //   width: 20,
                      //   height: 20,
                      //   child: CircularProgressIndicator(
                      //     backgroundColor: Colors.white,
                      //     strokeWidth: 3,
                      //     color: Colors.black,
                      //   ),
                      // ) : _isVerified ? Icon(Icons.check_circle, color: Colors.white, size: 30,) :

                      const Text(
                    "Verify",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              )
            ],
          ).setPageHorizontalPadding(context)),
        ));
  }
}
