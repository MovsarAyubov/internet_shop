import 'package:flutter/material.dart';

import '../colors.dart';
import 'custom_sized_box.dart';
import 'roboto_text.dart';
import 'size_config.dart';

class AppBarWithSearch extends StatefulWidget implements PreferredSizeWidget {
  final double appBarHeight;
  final String title;
  const AppBarWithSearch({
    Key? key,
    required this.appBarHeight,
    required this.title,
  }) : super(key: key);

  @override
  State<AppBarWithSearch> createState() => _AppBarWithSearchState();

  @override
  Size get preferredSize => Size.fromHeight(appBarHeight);
}

class _AppBarWithSearchState extends State<AppBarWithSearch> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.3,
      backgroundColor: appBarBackgroundColor,
      toolbarHeight: SizeConfig(context, 112)(),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RobotoText(
            widget.title,
            color: blackText,
            fontWeight: FontWeight.w400,
            fontSize: 22,
          ),
          const CustomSizedBox(
            height: 12,
          ),
          CustomSizedBox(
            height: 32,
            width: double.infinity,
            child: TextFormField(
              textAlignVertical: TextAlignVertical.center,
              decoration: InputDecoration(
                focusedBorder: InputBorder.none,
                isCollapsed: true,
                filled: true,
                fillColor: searchFieldColor,
                focusColor: Colors.red,
                prefixIcon: Icon(
                  Icons.search_sharp,
                  size: SizeConfig(context, 24)(),
                  color: mediumGrey,
                ),
                hintText: "Searching",
                hintStyle: TextStyle(
                  color: mediumGrey,
                  fontFamily: "Roboto",
                  fontSize: SizeConfig(context, 12)(),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(
                    color: searchFieldColor,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
