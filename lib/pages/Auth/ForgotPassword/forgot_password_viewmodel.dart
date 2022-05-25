import 'package:flutter/material.dart';
import 'package:pmvvm/pmvvm.dart';

class ForgotViewModel extends ViewModel {
  final TextEditingController _phoneNumberEmail = TextEditingController();
  TextEditingController get phoneNumberEmail => _phoneNumberEmail;


}