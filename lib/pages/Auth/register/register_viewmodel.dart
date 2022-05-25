import 'package:flutter/material.dart';
import 'package:pmvvm/pmvvm.dart';

class RegisterViewModel extends ViewModel {
  final TextEditingController _phoneNumber = TextEditingController();
  TextEditingController get phoneNumber => _phoneNumber;



  final TextEditingController _email = TextEditingController();
  TextEditingController get email => _email;

  final TextEditingController _username = TextEditingController();
  TextEditingController get username => _username;

  final TextEditingController _password = TextEditingController();
  TextEditingController get password => _password;







}