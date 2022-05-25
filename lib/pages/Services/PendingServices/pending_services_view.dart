import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:pmvvm/pmvvm.dart';
import 'package:smart_city/Configurations/appTheme.dart';
import 'package:smart_city/Configurations/color.dart';
import 'package:smart_city/Configurations/smart_icon_icons.dart';
import 'package:smart_city/Models/services.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:smart_city/Extensions/extensions.dart';
import 'pending_services_viewmodel.dart';

class PendingServices extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MVVM(
      view: (_, __) => View(),
      viewModel: PendingServiceViewModel(),
    );
  }
}

class View extends HookView<PendingServiceViewModel> {
  @override
  Widget render(BuildContext context, PendingServiceViewModel viewModel) {
    final mediaQuery = MediaQuery.of(context);
final textTheme = AppTheme.lightThemeData.textTheme;
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          backgroundColor: Colors.transparent,
          title: Text(
            'Pending Services',
            style: textTheme.headline1,
          ),
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                SmartIcon.arrow_left_1,
                color:Colors.black,
                size: 30,
              )),

        ),
        body: Column(
          children: [
            TabBar(
              tabs: [
                Tab(
                    icon: Text(
                      'Today',
                      style: TextStyle(color: Colors.black, fontSize: 17),
                    )),
                Tab(
                    icon: Text(
                      'Upcoming',
                      style: TextStyle(color: Colors.black, fontSize: 17),
                    )),
                Tab(
                    icon: Text(
                      'Completed',
                      style: TextStyle(color: Colors.black, fontSize: 17),
                    )),
              ],
            ),

            Expanded(
              child: Column(
                children: [
                  Expanded(
                    child: TabBarView(
                      children: [
                        ListView.separated(
                            padding: EdgeInsets.only(top: 10, bottom: 10),
                            itemBuilder: (context, index) {
                              return FadeInUp(
                                child: ServiceStatusContainer(
                                  onTap: () {},
                                  onMore: () {},
                                  imgUrl: servicesFull[index].imageURL,
                                  name: servicesFull[index].name,
                                  color: Colors.orangeAccent,
                                  completed: false,
                                  status: 'In Progress',
                                  time: '10:00 AM - 11:30 AM',
                                  serviceName: '${servicesFull[index].name} service',
                                ),
                              );
                            },
                            separatorBuilder: (context, index) {
                              return const SizedBox(
                                height: 10,
                              );
                            },
                            itemCount: servicesFull.length),
                        ListView.separated(
                            padding: EdgeInsets.only(top: 10, bottom: 10),
                            itemBuilder: (context, index) {
                              return FadeInUp(
                                child: ServiceStatusContainer(
                                  onTap: () {},
                                  onMore: () {},
                                  color: Colors.orangeAccent,
                                  completed: false,
                                  imgUrl: servicesFull[index].imageURL,
                                  name: servicesFull[index].name,
                                  status: 'In Progress',
                                  time: 'Monday 19/02/2022',
                                  serviceName: '${servicesFull[index].name} service',
                                ),
                              );
                            },
                            separatorBuilder: (context, index) {
                              return const SizedBox(
                                height: 10,
                              );
                            },
                            itemCount: servicesFull.length),
                        ListView.separated(
                            padding: EdgeInsets.only(top: 10, bottom: 20),
                            itemBuilder: (context, index) {
                              return FadeInUp(
                                child: ServiceStatusContainer(
                                  onTap: () {},
                                  onMore: () {},
                                  completed: true,
                                  imgUrl: servicesFull[index].imageURL,
                                  name: servicesFull[index].name,
                                  status: 'Done',
                                  time: 'Completed on Monday',
                                  serviceName: '${servicesFull[index].name} service',
                                ),
                              );
                            },
                            separatorBuilder: (context, index) {
                              return const SizedBox(
                                height: 10,
                              );
                            },
                            itemCount: servicesFull.length)
                      ],
                    ),
                  )
                ],
              ).setPageHorizontalPadding(context),
            )
          ],
        )
      ),
    );
  }
}

class ServiceStatusContainer extends StatelessWidget {
  String imgUrl;
  String name;
  String time;
  String status;
  String serviceName;
  Color? color;
  bool completed;
  VoidCallback onTap;
  VoidCallback onMore;

  ServiceStatusContainer({
    Key? key,
    required this.name,
    this.color,
    required this.imgUrl,
    required this.onTap,
    required this.completed,
    required this.serviceName,
    required this.status,
    required this.onMore,
    required this.time,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final theme = Theme.of(context);
    return Container(
        margin: EdgeInsets.only(left: 5, right: 5),
        // height: 200,
        width: mediaQuery.size.width,
        padding: EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 7,
            ),
          ],
        ),
        child: Column(
          children: [
            Material(
              color: Colors.transparent,
              child: ListTile(
                leading: Image.network(
                  imgUrl,
                  scale: 3,
                ),
                title: Text(
                  serviceName,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                trailing: IconButton(
                    onPressed: onMore, icon: Icon(Icons.more_horiz_outlined)),
              ),
            ),
            const Divider(),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      completed
                          ? Icon(
                              Icons.check_box_rounded,
                              color: Colors.green,
                              size: 30,
                            )
                          : Icon(
                              Icons.access_time,
                              color: Colors.orangeAccent,
                            ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        time,
                        style:
                            TextStyle(color: Colors.grey, letterSpacing: 0.5),
                      ),
                    ],
                  ),
                  Container(
                    padding:
                        EdgeInsets.only(left: 15, right: 15, top: 5, bottom: 5),
                    decoration: BoxDecoration(
                        color: color != null
                            ? color
                            : Colors.green.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(15)
                        // shape: BoxShape.circle
                        ),
                    child: Text(
                      status,
                      style: TextStyle(
                          fontSize: 17,
                          color: color != null ? Colors.white : Colors.green),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Divider(),
            completed
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                        // TextButton(
                        //   onPressed: () {},
                        //   child: Text(
                        //     'View Details',
                        //     style: TextStyle(
                        //       fontSize: 20,
                        //     ),
                        //   ),
                        // ),
                        RatingBar.builder(
                          itemSize: 35,
                          initialRating: 3,
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: false,
                          itemCount: 5,

                          itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
                          itemBuilder: (context, _) => Icon(
                            Icons.star_rate_rounded,
                            color: Colors.amber,
                          ),
                          onRatingUpdate: (rating) {
                            print(rating);
                          },
                        )
                      ])
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            'View Details',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.black
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            'Cancel Request',
                            style: TextStyle(fontSize: 20, color: Colors.red),
                          ),
                        ),
                      ]),

          completed ? SizedBox(height: 10,) :  SizedBox.shrink()
          ],
        ));
  }
}
