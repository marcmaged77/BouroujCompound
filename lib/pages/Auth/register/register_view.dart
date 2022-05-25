import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:pmvvm/pmvvm.dart';
import 'package:smart_city/Configurations/color.dart';
import 'package:smart_city/widgets/styledTextField.dart';

import 'register_viewmodel.dart';
import 'package:smart_city/Extensions/padding_ext.dart';

class Register extends StatelessWidget {
  const Register({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MVVM(
      view: (_, __) => RegisterView(),
      viewModel: RegisterViewModel(),
    );
  }
}

class RegisterView extends HookView<RegisterViewModel> {
  @override
  Widget render(BuildContext context, RegisterViewModel viewModel) {
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
            title: Text(
              'REGISTER',
              style: theme.textTheme.headline1
            ),
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(
                Iconsax.close_circle,
                color: Colors.black,
                size: 30,
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.center,

              children: [

                // FadeInDown(
                //   child: Align(
                //     // alignment: Alignment.center,
                //     child: Text(
                //       'REGISTER',
                //       textAlign: TextAlign.end,
                //       style: TextStyle(
                //           fontWeight: FontWeight.bold,
                //           fontSize: 24,
                //           color: Colors.grey.shade900),
                //     ),
                //   ),
                // ),
               const  SizedBox(
                  height: 30,
                ),
                FadeInDown(
                    delay: const Duration(milliseconds: 600),
                    child: CustomContainer(
                        child: styledTextField(
                            leadingIcon: Icon(
                              Iconsax.user,
                              size: 18,
                              color: Colors.black,
                            ),
                            controller: viewModel.email,
                            label: 'Email',
                            hintText: 'Email address'))),
               const  SizedBox(
                  height: 20,
                ),
                FadeInDown(
                    delay: const Duration(milliseconds: 600),
                    child:  CustomContainer(
                        child: styledTextField(
                            leadingIcon: Icon(
                              Iconsax.lock,
                              size: 18,
                              color: Colors.black,
                            ),
                            controller: viewModel.email,
                            label: 'Password',
                            hintText: 'Password'))),
             const    SizedBox(
                  height: 20,
                ),
                FadeInDown(
                    delay:const  Duration(milliseconds: 600),
                    child:  CustomContainer(

                        child: styledTextField(
                            leadingIcon: Icon(
                              Iconsax.lock,
                              size: 18,
                              color: Colors.black,
                            ),
                            controller: viewModel.email,
                            label: 'Confirm Password',
                            hintText: 'Confirm Password'))),
              const   SizedBox(
                  height: 20,
                ),
                FadeInDown(
                  delay: const Duration(milliseconds: 600),
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 15),
                    decoration:  BoxDecoration(
                      color: Colors.white38,
                      // borderRadius: BorderRadius.circular(8),
                      borderRadius: BorderRadius.circular(15.0),

                      border: Border.all(color: Colors.black.withOpacity(0.13)),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xffeeeeee),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Stack(
                      children: [
                        InternationalPhoneNumberInput(
                          onInputChanged: (PhoneNumber number) {
                            print(number.phoneNumber);
                          },
                          onInputValidated: (bool value) {
                            print(value);
                          },
                          selectorConfig: SelectorConfig(
                            selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                          ),
                          countrySelectorScrollControlled: false,
                          // selectorConfig: SelectorConfig(
                          //
                          // ),
                          ignoreBlank: false,
                          initialValue: PhoneNumber(isoCode: 'EG'),

                          autoValidateMode: AutovalidateMode.disabled,
                          // selectorTextStyle: TextStyle(color: Colors.black),
                          // textFieldController: controller,
                          // maxLength: 9,
                          keyboardType: TextInputType.number,
                          // TextInputType.numberWithOptions(signed: true, decimal: true),
                          cursorColor: Colors.black,

                          inputDecoration: InputDecoration(
                            contentPadding:
                                const EdgeInsets.only(bottom: 15, left: 0),
                            border: InputBorder.none,
                            hintText: 'Phone Number',
                            hintStyle: TextStyle(
                                color: Colors.grey.shade500, fontSize: 16),
                          ),
                          onSaved: (PhoneNumber number) {
                            print('On Saved: $number');
                          },
                        ),
                        Positioned(
                          left: 90,
                          top: 8,
                          bottom: 8,
                          child:  Container(
                            height: 40,
                            width: 1,
                            color: Colors.black.withOpacity(0.13),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const    SizedBox(
                  height: 10,
                ),
                FadeInDown(
                  delay:const Duration(milliseconds: 600),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 15.0, horizontal: 20),
                    child:  Text(
                      'If You Own a Unit Please fill these Forms Below',
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 14, color: Colors.grey.shade700),
                    ),
                  ),
                ),
                FadeInDown(
                    delay: const Duration(milliseconds: 600),
                    child: CustomContainer(
                        child : styledTextField(
                            leadingIcon: Icon(
                              Iconsax.home,
                              size: 18,
                              color: Colors.black,
                            ),
                            inputType: TextInputType.number,
                            controller: viewModel.email,
                            label: 'Unit number',
                            hintText: 'Enter Building or villa Number'))),
                const  SizedBox(
                  height: 9,
                ),
                FadeInDown(
                  delay:const Duration(milliseconds: 600),
                  child: Align(
                    alignment:  Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          bottom: 3),
                      child: Text(
                        '(Optional)',
                        textAlign: TextAlign.left,
                        style:
                        TextStyle(fontSize: 14, color: Colors.grey.shade700),
                      ),
                    ),
                  ),
                ),
                FadeInDown(
                    delay:const Duration(milliseconds: 600),
                    child: CustomContainer(
                      child: styledTextField(
                          leadingIcon: Icon(
                            Icons.apartment_rounded,

                            size: 18,
                            color: Colors.black38,

                            // color: Colors.black,
                          ),
                          inputType: TextInputType.number,
                          controller: viewModel.email,
                          label: 'floor Number',
                          hintText: 'floor Number'),
                    )),
                const SizedBox(
                  height: 25,
                ),
                FadeInDown(
                    delay:const Duration(milliseconds: 600),
                    child: CustomContainer(

                        child: styledTextField(
                            leadingIcon: Icon(
                              Icons.add_road_rounded,
                              size: 18,
                              color: Colors.black,
                            ),
                            controller: viewModel.email,
                            label: 'Street Name',
                            hintText: 'Street Name'))),
                const    SizedBox(
                  height: 9,
                ),
                FadeInDown(
                  delay: Duration(milliseconds: 600),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          bottom: 3),
                      child: Text(
                        '(Optional)',
                        textAlign: TextAlign.left,
                        style:
                        TextStyle(fontSize: 14, color: Colors.grey.shade700),
                      ),
                    ),
                  ),
                ),
                FadeInDown(
                    delay: const Duration(milliseconds: 600),
                    child: CustomContainer(
                        child: styledTextField(
                            leadingIcon: Icon(
                              Icons.description_rounded,
                              size: 18,
                              // color: Colors.black,
                            ),
                            controller: viewModel.email,
                            label: 'Description',
                            hintText: 'Description'))),
                const SizedBox(
                  height: 40,
                ),
                FadeInUp(
                  delay: Duration(milliseconds: 400),
                  child: MaterialButton(
                    onPressed: () {},
                    height: 45,
                    color:  Colors.black,
                    child: Text(
                      "Register",
                      style: TextStyle(color: Colors.white, fontSize: 16.0),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 120),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),

                const SizedBox(
                  height: 50,
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
        decoration:  BoxDecoration(
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
