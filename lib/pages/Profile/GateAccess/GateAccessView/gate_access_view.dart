import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pmvvm/pmvvm.dart';
import 'package:smart_city/Configurations/appTheme.dart';
import 'package:smart_city/Configurations/color.dart';
import 'package:smart_city/Configurations/smart_icon_icons.dart';
import 'package:smart_city/Extensions/extensions.dart';
import 'package:smart_city/pages/Profile/GateAccess/GateAccessDetails/gate_access_detail_view.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:smart_city/widgets/styledTextField.dart';

import 'gate_access_viewmodel.dart';




class GateAccess extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MVVM(view: (_, __) => ProfileView(), viewModel: GateAccessViewModel());
  }
}

class ProfileView extends HookView<GateAccessViewModel> {
  @override
  Widget render(BuildContext context, GateAccessViewModel viewModel) {
    final mediaQuery = MediaQuery.of(context);
    final textTheme = AppTheme.lightThemeData.textTheme;

    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              showBarModalBottomSheet(
                context: context,
                bounce: true,
                builder: (context) => GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () {
                    FocusScopeNode currentFocus = FocusScope.of(context);
                    if (!currentFocus.hasPrimaryFocus) {
                      currentFocus.unfocus();
                    }
                  },
                  child: Container(
                    padding: MediaQuery.of(context).viewInsets,
                    height: mediaQuery.size.height * 0.7,
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const SizedBox(height: 20,),
                          Text('Add New Visitor', style: textTheme.headline1,),
                       Divider(),
                         const SizedBox(height: 10,),
                          styledTextField(
                              leadingIcon: Icon(SmartIcon.personalcard,color: AppColors.primaryColor,),
                              padding: 15,
                              controller: viewModel.emailController,
                              inputType: TextInputType.name,
                              label: 'Visit Type',
                              hintText: 'Visit Type'),
                          styledTextField(
                            leadingIcon: Icon(SmartIcon.personalcard,color: AppColors.primaryColor,),
                            padding: 15,
                              controller: viewModel.emailController,
                              inputType: TextInputType.name,
                              label: 'Visitor Name',
                              hintText: 'Full name'),
                          styledTextField(
                            padding: 15,
                              leadingIcon: Icon(SmartIcon.mobile,color: AppColors.primaryColor,),
                              controller: viewModel.emailController,
                              label: 'Visitor Phone Number',
                              inputType:TextInputType.number ,
                              hintText: 'Phone Number'),
                          styledTextField(
                              padding: 15,
                              leadingIcon: Icon(Icons.email_rounded,color: AppColors.primaryColor,),
                              controller: viewModel.emailController,
                              inputType: TextInputType.emailAddress,
                              label: 'Visitor Email',
                              hintText: 'Email Address'),
                          styledTextField(
                              padding: 15,
                              leadingIcon: Icon(SmartIcon.car,color: AppColors.primaryColor,),
                              controller: viewModel.emailController,
                              label: 'Vehicle Plate Number',
                              hintText: ''),
                          styledTextField(
                              padding: 30,
                              leadingIcon: Icon(SmartIcon.people,color: AppColors.primaryColor,),
                              controller: viewModel.emailController,
                              inputType: TextInputType.number,
                              label: 'Number of Guest',
                              hintText: 'Number of guest With the visitor'),

                          FadeInUp(
                            child: MaterialButton(
                              onPressed: () {},
                              height: 45,
                              color: Color(0xff112C47),
                              child: Text(
                                "Add Visitor",
                                style: TextStyle(color: Colors.white, fontSize: 16.0),
                              ),
                              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 70),
                              shape: RoundedRectangleBorder(
                                borderRadius:  BorderRadius.circular(10.0),
                              ),
                            ),
                          ),

                        ],
                      ).setPageHorizontalPadding(context),
                    ),
                  ),
                ),
              );
            },
            backgroundColor: AppColors.secondaryColor,
            child: Icon(SmartIcon.user_add, color: Colors.white,),
          ),
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
              icon: Icon(
                SmartIcon.arrow_left_1,
                color: Colors.black,
                size: 30,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            title: Text('Manage visitors', style: textTheme.headline1),

          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hello, Amr',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  Text(
                    'Smart-Access Management To Your Compound',
                    style: TextStyle(color: Colors.grey),
                  )
                ],
              ),
              Padding(
                padding:const  EdgeInsets.only(top: 10, bottom: 10),
                child: CupertinoSearchTextField(
                  prefixIcon: Icon(SmartIcon.search_normal),
                  padding:const  EdgeInsets.all(15),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TabBar(

                tabs: [
                  Tab(
                      icon: Text(
                        'Upcoming Visits',
                        style: TextStyle(color: Colors.black, fontSize: 17),
                      )),
                  Tab(
                      icon: Text(
                        'Past Visits',
                        style: TextStyle(color: Colors.black, fontSize: 17),
                      )),
                ],
              ),

              Expanded(
                child: TabBarView(
                  children: [
                    ListView.separated(
                      padding: EdgeInsets.only(top: 10, bottom: 30),
                        shrinkWrap: true,
                        // physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return FadeInUp(
                            duration: Duration(milliseconds: 700),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Material(
                                color: Colors.transparent,
                                child: ListTile(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                GateAccessDetail()));
                                  },
                                  leading: Container(
                                      padding: const EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.circular(10),
                                          color: Colors.blue.withOpacity(0.3)),
                                      child: Icon(
                                        Icons.timelapse,
                                        color: Colors.blue,
                                        size: 35,
                                      )),
                                  title: Text('julien Sengierko'),
                                  subtitle: Text('3/2/2022'),

                                  trailing: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('Available for',style: TextStyle(fontSize: 12),),

                                      Container(
                                        padding: const EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                            color:  Colors.blue.withOpacity(0.3),
                                            borderRadius: BorderRadius.circular(10)

                                          ),
                                          child: Text('3${index++} min', )),

                                    ],
                                  ),
                                  // Icon(SmartIcon.arrow_right, color: theme.primaryColor ,),
                                ),
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return const SizedBox(
                            height: 10,
                          );
                        },
                        itemCount: 10),
                    ListView.separated(
                        shrinkWrap: true,
                        padding: EdgeInsets.only(top: 10, bottom: 30),

                        // physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return FadeInUp(
                            duration: Duration(milliseconds: 700),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Material(
                                color: Colors.transparent,
                                child: ListTile(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                GateAccessDetail()));
                                  },
                                  leading: Container(
                                      padding: const EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.circular(10),
                                          color: Colors.green.withOpacity(0.3)),
                                      child: Icon(
                                        SmartIcon.verify,
                                        color: Colors.green,
                                        size: 35,
                                      )),
                                  title: Text('julien Sengierko'),
                                  subtitle: Text('3/2/2022'),
                                  trailing: Icon(
                                    SmartIcon.arrow_right,
                                    color: Colors.grey.shade600,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return const SizedBox(
                            height: 10,
                          );
                        },
                        itemCount: 10),
                  ],
                ),
              ),
            ],
          ).setPageHorizontalPadding(context),
        ),
      ),
    );
  }}

