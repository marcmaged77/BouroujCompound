import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:pmvvm/pmvvm.dart';
import 'package:smart_city/Configurations/appTheme.dart';
import 'package:smart_city/Configurations/color.dart';
import 'package:smart_city/Configurations/smart_icon_icons.dart';
import 'package:smart_city/Extensions/extensions.dart';
import 'package:smart_city/Models/services.dart';

import 'services_viewmodel.dart';

class Service extends StatelessWidget {
  const Service({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MVVM(
      view: (_, __) => ServiceView(),
      viewModel: ServiceViewModel(),
    );
  }
}

class ServiceView extends HookView<ServiceViewModel> {
  @override
  Widget render(BuildContext context, ServiceViewModel viewModel) {
    final mediaQuery = MediaQuery.of(context);
    final textTheme = AppTheme.lightThemeData.textTheme;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Which service do \nyou need?',
                    style: TextStyle(
                      fontSize: 30,
                      // color: Colors.grey.shade900,
                      // fontWeight: FontWeight.bold,
                    ),
                  ),
                  Column(
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            SmartIcon.setting_5,
                            color: AppColors.primaryColor,
                            size: 30,
                          )),
                      SizedBox(
                          width: 70,
                          child: Text('In Progress Services', textAlign: TextAlign.center,))
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1.0,
                    crossAxisSpacing: 20.0,
                    mainAxisSpacing: 20.0,
                  ),
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: servicesFull.length,
                  itemBuilder: (BuildContext context, int index) {
                    return FadeInUp(
                        child:serviceContainer(servicesFull[index].imageURL,
                        servicesFull[index].name, index, ));
                  }),
              SizedBox(
                height: 50,
              ),
            ],
          ).setPageHorizontalPadding(context),
        ),
      ),
    );
  }
}


class ServiceContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

serviceContainer(String image, String name, int index, ) {
  final textTheme = AppTheme.lightThemeData.textTheme;

  return InkWell(
    onTap: () {},
    child: Container(
      // duration: Duration(milliseconds: 300),
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Colors.white70,
        border:
        Border.all(
            width: 0.7,
            color:Colors.black.withOpacity(0.2)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
          ),
        ],
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.network(image, height: 80),
            SizedBox(
              height: 20,
            ),
            Text(
              name,
              style: TextStyle(fontSize: 20),
            )
          ]),
    ),
  );
}
