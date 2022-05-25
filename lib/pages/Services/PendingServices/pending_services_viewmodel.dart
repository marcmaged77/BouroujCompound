import 'package:pmvvm/pmvvm.dart';
import 'package:table_calendar/table_calendar.dart';

class PendingServiceViewModel extends ViewModel {

  CalendarFormat _calendarFormat = CalendarFormat.week;
  CalendarFormat get calendarFormat => _calendarFormat;


  DateTime _focusedDay = DateTime.now();
  DateTime get focusedDay => _focusedDay;

  DateTime? _selectedDay;
  DateTime? get selectedDay => _selectedDay;

}