import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_ref_getx/app/core/errors/api_exception.dart';
import 'package:project_ref_getx/app/core/wrapper/page_wrapper.dart';

mixin BasePagination<T> {
  final listItem = List<T>().obs;
  final ScrollController _srollController = ScrollController();

  bool _last = false;
  int _pageNumber = 0;
  int _nextNumber = 0;
  bool _isLoading = false;

  init() {
    listener();
    loadList();
  }

  Future<bool> loadList() async {
    final result = await list();
    result.fold(
        (ApiException e) =>
            Get.rawSnackbar(title: "Alerta", message: e.message.toString()),
        (data) => {
              this.nextNumber != 0
                  ? this.listItem.addAll(data.list)
                  : this.listItem.value = data.list.value,
              this.last = data.last,
              this.pageNumber = data.pageNumber,
            });
    return true;
  }

  listener() {
    scrollController?.addListener(() async {
      if (!loading &&
          scrollController.position.pixels ==
              scrollController.position.maxScrollExtent) {
        if (!last) {
          loading = true;
          this._nextNumber++;
          await loadList();
          this.loading = false;
        }
      }
    });
  }

  Future<void> reloadList() async {
    loading = true;
    last = false;
    _nextNumber = 0;
    await loadList();
    this.loading = false;
  }

  Future<Either<ApiException, PageWrapper<T>>> list();

  set last(value) => this._last = value;

  get last => this._last;

  set loading(value) => this._isLoading = value;

  get loading => this._isLoading;

  set pageNumber(value) => this._pageNumber;

  get pageNumber => this._pageNumber;

  set nextNumber(value) => this._nextNumber;

  get nextNumber => this._nextNumber;

  get scrollController => _srollController;
}
