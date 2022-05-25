class Posts {

  String? name;
  String? caption;
  String? timeAgo;
  String? imgUrl;
  String? likes;
  String? photos;
  bool? arabic;
  String? photo;

  Posts({this.caption, this.name, this.timeAgo, this.imgUrl, this.likes, this.photos, this.arabic, this.photo});
}




String description = 'السادة الملاك الافاضل \n تحية طيبة و بعد برةاء العلم انه تم اغلاق بوابة ١٣ للصيانة و ستكون غير متاحة لمدة لا تقل عن ٣ شهور';
String development = 'Happy to announce \n the opening of the new project called iris swanlake phase 3. \n to get your furnitured appartement call 199293 ';
String assetImage = 'assets/Avatars/';
String asset = 'assets/images/';

List<Posts> postsBlog = [
  Posts(name: 'Al Bourouj Development', caption: development, timeAgo: '3 mins ago', imgUrl: "${assetImage}user1.jpg", photos: "assets/images/bouroujlogoBlack.png", arabic: false),
  Posts(name: 'Community Management', caption: description, timeAgo: '10 mins ago', imgUrl: "${assetImage}user2.jpg", arabic: true, photos:"${asset}Announcement.jpeg" ),
  Posts(name: 'Facility Management', caption: description, timeAgo: '20 mins ago', imgUrl: "${assetImage}user2.jpg", arabic: true,photos:"${asset}Announcement.jpeg" ),
  Posts(name: 'Facility Management', caption: description, timeAgo: '20 mins ago', imgUrl: "${assetImage}usr4.jpg", arabic: true,photos:"${asset}Announcement.jpeg" ),
  Posts(name: 'Community Management', caption: description, timeAgo: '10 mins ago', imgUrl: "${assetImage}user3.jpg", arabic:  true,photos:"${asset}Announcement.jpeg" ),
  Posts(name: 'Facility Management', caption: description, timeAgo: '20 mins ago', imgUrl: "${assetImage}user5.jpg", arabic:  true,photos:"${asset}Announcement.jpeg" ),
  Posts(name: 'Facility Management', caption: description, timeAgo: '20 mins ago', imgUrl: "${assetImage}user6.jpg", arabic:  true,photos:"${asset}Announcement.jpeg" ),
  Posts(name: 'Community Management', caption: description, timeAgo: '10 mins ago', imgUrl: "${assetImage}user1.jpg", arabic:  true,photos:"${asset}Announcement.jpeg" ),
  Posts(name: 'Community Management', caption: description, timeAgo: '10 mins ago', imgUrl: "${assetImage}usr4.jpg", arabic:  true,photos:"${asset}Announcement.jpeg" ),
  Posts(name: 'Community Management', caption: description, timeAgo: '10 mins ago', imgUrl: "${assetImage}user3.jpg", arabic:  true,photos:"${asset}Announcement.jpeg" ),
];