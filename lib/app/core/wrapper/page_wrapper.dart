import 'package:get/get.dart';

class PageWrapper<T> {

  RxList<T> _list = List<T>().obs;
  bool _last;
  int _pageNumber;

  RxList<T> get list => _list;
  set list(value) => _list = value;

  bool get last => _last;
  set last(value) => _last = value;

  int get pageNumber => _pageNumber;
  set pageNumber(value) => _pageNumber = value;

}