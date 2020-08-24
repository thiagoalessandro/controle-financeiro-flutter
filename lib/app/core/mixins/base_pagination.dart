import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_ref_getx/app/core/errors/api_exception.dart';
import 'package:project_ref_getx/app/core/wrapper/page_wrapper.dart';

mixin BasePagination<T> {
  final listItem = List<T>().obs;
  final search = "TODOS".obs;
  final isLoading = false.obs;

  final ScrollController scrollController = ScrollController();

  bool last = false;
  int pageNumber = 0;
  int nextNumber = 0;

  init() async {
    this.isLoading.value = true;
    this.listener();
    await this.loadList();
    this.isLoading.value = false;
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

  Future<void> toSearch(String value) async {
    if (value.length > 2 || value.length == 0) {
      this.clean();
      this.isLoading.value = true;
      this.search.value = value.length != 0 ? value : "TODOS";
      var result = await list();
      result.fold(
          (ApiException e) =>
              Get.rawSnackbar(title: "Alerta", message: e.message.toString()),
          (data) => {
                this.listItem.value = data.list.value,
                this.last = data.last,
                this.pageNumber = data.pageNumber,
              });
      this.isLoading.value = false;
    }
  }

  listener() {
    this.scrollController?.addListener(() async {
      if (!this.isLoading.value &&
          this.scrollController.position.pixels ==
              this.scrollController.position.maxScrollExtent) {
        if (!this.last) {
          this.nextNumber++;
          await loadList();
        }
      }
    });
  }

  Future<void> reloadList() async {
    this.clean();
    await loadList();
  }

  void clean(){
    this.last = false;
    this.nextNumber = 0;
  }

  Future<Either<ApiException, PageWrapper<T>>> list();

}
