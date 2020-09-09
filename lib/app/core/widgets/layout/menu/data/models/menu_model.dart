import 'package:flutter/material.dart';
import 'package:project_ref_getx/app/core/external/provider/api/dto/base_api_dto.dart';

class MenuModel extends BaseApiDTO{
  final String title;
  final IconData icon;
  final String page;

  MenuModel({
    this.title,
    this.icon,
    this.page,
  });

}