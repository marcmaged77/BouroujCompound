import 'package:pmvvm/pmvvm.dart';
import 'package:smart_city/pages/Main/main_viewmodel.dart';

class HomeViewModel extends ViewModel {
  MainViewModel mainViewModel;

HomeViewModel({ required this.mainViewModel});



changePage(int) {
  mainViewModel.changeScreen(int);
}

}