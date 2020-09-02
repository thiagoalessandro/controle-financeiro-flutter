import 'package:flutter/material.dart';
import 'package:project_ref_getx/app/core/external/view/base_view.dart';
import 'package:project_ref_getx/app/core/widgets/text_field/text_field_search/text_field_search_style.dart';

class TextFieldSearch extends BaseView with TextFieldSearchStyle{
  final Function(String value) searchFunction;
  final String title;

  TextFieldSearch({@required this.searchFunction, @required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextField(
        style: TextStyle(
          color: textColor,
          fontSize: fontSize,
        ),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(left: marginLeft),
          icon: Icon(
            Icons.search,
            color: textColor,
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color:Colors.white, width:0),
          ),//under line border, set OutlineInputBorder() for all side border
          hintStyle: TextStyle(
            color: textColor,
            fontSize: fontSize,
          ),
          hintText: "Pesquisar ${title.toLowerCase()}...",
        ), //decoration for search input field
        onChanged: (value) {
          searchFunction(value);
        },
      ),
    );
  }

}