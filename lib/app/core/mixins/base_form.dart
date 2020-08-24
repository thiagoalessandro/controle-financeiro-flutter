import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_ref_getx/app/core/errors/api_exception.dart';
import 'package:project_ref_getx/app/core/wrapper/page_wrapper.dart';

mixin BaseForm<T> {

  T entity;

  final formKey = GlobalKey<FormState>();

  void onSave();

}
