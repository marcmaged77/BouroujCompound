import 'package:animate_do/animate_do.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:pmvvm/pmvvm.dart';
import 'package:smart_city/Configurations/appTheme.dart';
import 'package:smart_city/Configurations/color.dart';
import 'package:smart_city/Configurations/smart_icon_icons.dart';
import 'package:smart_city/Extensions/extensions.dart';
import 'gate_access_detail_viewmodel.dart';

class GateAccessDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MVVM(
      view: (_, __) => GateAccessDetailView(),
      viewModel: GateAccessDetailViewModel(),
    );
  }
}

class GateAccessDetailView extends HookView<GateAccessDetailViewModel> {
  @override
  Widget render(BuildContext context, GateAccessDetailViewModel viewModel) {
    final mediaQuery = MediaQuery.of(context);
    final textTheme = AppTheme.lightThemeData.textTheme;

    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.red,
          onPressed: () {}, label: Text('Cancel Visit', style: TextStyle(color: Colors.white),)),
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.transparent,
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
      ),
      body: SingleChildScrollView(
        child: Stack(children: [
          Container(
            height: mediaQuery.size.height * 0.25,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50)),
                color: Colors.blueGrey.withOpacity(0.2)),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                 SizedBox(
                  height: mediaQuery.size.height * 0.1,
                ),
              SizedBox(
                width: mediaQuery.size.width * 0.6,
                child: const  Text(
                    'An email has been sent to your visitor',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
              ),
                const SizedBox(
                  height: 20,
                ),
                FadeInUp(
                  child: Container(
                    // height: 550,
                    width: mediaQuery.size.width,
                    padding: EdgeInsets.only(top: 10, bottom: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          spreadRadius: 2,
                          blurRadius: 9,
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/images/barcode.png',
                          scale: 3,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Visit Details',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 17),
                            ),
                            Container(
                                padding: const EdgeInsets.all(7),
                                decoration: BoxDecoration(
                                    color: AppColors.primaryColor,
                                    borderRadius: BorderRadius.circular(20)),
                                child: Text(
                                  'Normal visit',
                                  style:
                                      TextStyle(fontSize: 14, color: Colors.white),
                                ))
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        _DetailsContainer(
                          title: 'Full Name',
                          value: 'Marc Maged',
                        ),
                        _DetailsContainer(
                          title: 'Phone',
                          value: '01113266564',
                        ),
                        _DetailsContainer(
                          title: 'Email',
                          value: 'marcmgedbaky@hotmail.com',
                        ),
                        _DetailsContainer(
                          title: 'Vehicle Number',
                          value: 'سصد ٨٦١',
                        ),
                        _DetailsContainer(
                          title: 'Pass Id',
                          value: 'A1234567890A',
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        DottedLine(),
                        SizedBox(
                          height: 5,
                        ),
                        _DetailsContainer(
                          title: 'Department',
                          value: '1C',
                        ),
                        _DetailsContainer(
                          title: 'Owner',
                          value: 'Amr Khalifa',
                        ),
                        _DetailsContainer(
                          title: 'Pass Availaible for ',
                          value: '30 min',
                        ),
                      ],
                    ).setPageHorizontalPadding(context),
                  ),
                ),
              ],
            ).setPageHorizontalPadding(context),
          ),
        ]),
      ),
    );
  }
}

class _DetailsContainer extends StatelessWidget {
  String title;
  String value;

  _DetailsContainer({Key? key, required this.title, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 15, color: Colors.grey),
          ),
          Text(
            value,
            style: TextStyle(fontSize: 14, color: Colors.black),
          )
        ],
      ),
    );
  }
}
