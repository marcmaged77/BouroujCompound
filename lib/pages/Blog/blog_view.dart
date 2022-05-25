import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pmvvm/pmvvm.dart';
import 'package:smart_city/Models/posts.dart';
import 'package:smart_city/Extensions/extensions.dart';
import 'blog_viewmodel.dart';

class Blog extends StatelessWidget {
  const Blog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MVVM(
      view: (_, __) => BlogView(),
      viewModel: BlogViewModel(),
    );
  }
}

class BlogView extends HookView<BlogViewModel> {
  @override
  Widget render(BuildContext context, BlogViewModel viewModel) {
    final mediaQuery = MediaQuery.of(context);
    final theme = Theme.of(context);

    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: Color(0xffF7F7F7),
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          title: Text(
            'Community',
            style: theme.textTheme.headline1?.copyWith(color: Colors.black),
          ),
        ),
        body: Column(
          children: [
            Divider(height: 0.1,color: Colors.grey,),
            Material(
              color: Colors.white,
              child: TabBar(
isScrollable: true,
                tabs: [
                  Tab(
                      icon: Text(
                        'All',
                        style: GoogleFonts.poppins(color: Colors.black, fontSize: 17),
                      )),
                  Tab(
                      icon: Text(
                        'Developer',
                        style: GoogleFonts.poppins(color: Colors.black, fontSize: 17),
                      )),
                  Tab(
                      icon: Text(
                        'Community Management',
                        style: GoogleFonts.poppins(color: Colors.black, fontSize: 17),
                      )),
                  Tab(
                      icon: Text(
                        'Facility Management',
                        style: GoogleFonts.poppins(color: Colors.black, fontSize: 17),
                      )),
                ],
              ),
            ),


            Expanded(
              child: ListView.builder(

                  itemCount: postsBlog.length,
                  shrinkWrap: true,
                  // physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return PostContainer(
                      photo: postsBlog[index].photos!,
                      arabic: postsBlog[index].arabic!,
                            name: postsBlog[index].name!,
                            caption: postsBlog[index].caption!,
                            timeAgo: postsBlog[index].timeAgo!,
                            imgUrl: postsBlog[index].imgUrl!,

                      photos: postsBlog[index].photos != null ? postsBlog[index].photos! : '' ,
                    )
                        .setOnlyPadding(context,
                            bottom: index + 1 == postsBlog.length ? 10 : 0,
                            enableMediaQuery: false);
                  }),
            ),
          ],
        ),
      ),
    );
  }
}

class PostContainer extends StatelessWidget {
  PostContainer({
    Key? key,
    // required this.mediaQuery,
    required this.name,
    required this.caption,
    required this.timeAgo,
    required this.imgUrl,
    required this.photos,
    required this.arabic,
    required this.photo,
  }) : super(key: key);

  // final MediaQueryData mediaQuery;
  String name;
  String caption;
  String timeAgo;
  String imgUrl;
  String photos;
  String photo;
  bool arabic;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final theme = Theme.of(context);

    return Container(
      // padding: EdgeInsets.only(top: 10, bottom: 10),
      margin: const EdgeInsets.only(top: 5, bottom: 5),
      color: Colors.white,
      // height: 150,
      width: mediaQuery.size.width,
      child: Column(
        children: [
          ListTile(
            leading: Icon(Icons.account_circle_rounded, color: Colors.grey, size: 30,),
            title: Text(name),
            subtitle: Text(timeAgo),
          ),
          const Divider(
            color: const Color(0xffF2F2F2),
            thickness: 1,
            height: 0,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            caption,
            textAlign: arabic ?  TextAlign.right : TextAlign.left,
            style: TextStyle(
              height: 1.6,
            ),
          ),

          const SizedBox(
            height: 10,
          ),
          photos != '' ?
          Column(
            children: [
              // const    Divider(color:  const Color(0xffF2F2F2), thickness: 1, height: 0,),
              const SizedBox(
                height: 10,
              ),
         SizedBox(
             height: 200,
             child: Image.asset(photo)),

              const SizedBox(
                height: 20,
              ),
            ],
          )
          :
          const SizedBox(
            height: 10,
          ),
        ],
      ).setPageHorizontalPadding(context),
    );
  }
}
