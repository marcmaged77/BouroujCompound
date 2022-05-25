import 'package:flutter/cupertino.dart';
import 'package:pmvvm/pmvvm.dart';

class LoginViewModel extends ViewModel{
  bool black = false;




  final _emailController = TextEditingController();
  TextEditingController get emailController => _emailController;


}