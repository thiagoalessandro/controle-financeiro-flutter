import 'package:flutter/material.dart';
import 'package:project_ref_getx/app/core/external/entity/base_entity.dart';

class MenuEntity extends BaseEntity{

  final String title;
  final IconData icon;
  final String page;

  MenuEntity({
    this.title,
    this.icon,
    this.page,
  });

}
