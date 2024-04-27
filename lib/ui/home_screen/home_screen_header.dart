import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:youtube_clone/utils/utils.dart';

class HomescreenHeader extends StatefulWidget {
  const HomescreenHeader({super.key});

  @override
  State<StatefulWidget> createState() => _HomescreenHeaderState();
}

class _HomescreenHeaderState extends State<HomescreenHeader> {
  String profileImg = "assets/ic_default_profile.png";
  static const List<String> categories = [
    "All",
    "Mixes",
    "Music",
    "Graphic",
    "Games"
  ];
  List listItem = List.empty(growable: true);
  int activeIndex = 0;

  _HomescreenHeaderState() {
    categories.asMap().forEach((key, value) {
      listItem.add(CategoryListItem(value, key));
    });
  }

  @override
  Widget build(Object context) {
    return Container(
        padding: const EdgeInsets.all(16.0),
        alignment: Alignment.center,
        child: Wrap(
          children: [
            getHeaderActions(),
            const Divider(
              color: Colors.black12,
              thickness: 1.0,
            ),
            getHorizontalScrollActions()
          ],
        ));
  }

  Widget getHeaderActions() {
    List<Widget> childs = [
      Padding(
          padding: EdgeInsets.all(5.0),
          child: Image(
              height: 24,
              width: 90,
              alignment: Alignment.center,
              image: AssetImage(getImageName("ic_logo")))),
      const Spacer(
        flex: 1,
      )
    ];
    childs.addAll([
      getImageName("ic_cast"),
      getImageName("ic_notifications"),
      getImageName("ic_search"),
      getImageName("ic_default_profile")
    ].map((e) => getToolsWidget(e)));
    return Row(
        textDirection: TextDirection.ltr,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: childs);
  }

  Widget getToolsWidget(String image) {
    return Material(
        child: InkWell(
            onTap: () {},
            borderRadius: BorderRadius.circular(17.0),
            child: Padding(
                padding: const EdgeInsets.all(5.0),
                child:
                    Image(image: AssetImage(image), width: 24, height: 24))));
  }

  Widget getHorizontalScrollActions() {
    List<Widget> views = [getExploreButton(), getVerticalDivider()];
    views.addAll(getCategoriesList());
    return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: views));
  }

  List<Widget> getCategoriesList() {
    List<Widget> views = List.empty(growable: true);
    listItem
        .asMap()
        .forEach((key, value) => views.add(getCategoriesWidget(key, value)));

    return views;
  }

  Widget getCategoriesWidget(int index, CategoryListItem value) {
    bool isActiveIndex = activeIndex == index;
    return Container(
      margin: const EdgeInsetsDirectional.symmetric(horizontal: 2.0),
      child: Material(
          color: isActiveIndex ? Colors.grey.shade900 : Colors.grey.shade200,
          borderRadius: BorderRadius.circular(24.0),
          child: InkWell(
              onTap: () {
                setState(() {
                  activeIndex = index;
                });
                log("Index: $index");
              },
              borderRadius: BorderRadius.circular(24.0),
              child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 12.0),
                  child: Text(
                    value.title,
                    style: TextStyle(
                      color: isActiveIndex ? Colors.white : Colors.black,
                      fontSize: 14,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w500,
                      height: 1.0,
                    ),
                  )))),
    );
  }

  Widget getVerticalDivider() {
    return const Padding(
      padding: EdgeInsets.fromLTRB(12.0, 8.0, 6.0, 8.0),
      child: SizedBox(
        height: 20,
        child: VerticalDivider(thickness: 2),
      ),
    );
  }

  Widget getExploreButton() {
    return Material(
        color: Colors.grey.shade200,
        borderRadius: const BorderRadius.all(Radius.circular(4)),
        child: InkWell(
            onTap: () {},
            borderRadius: const BorderRadius.all(Radius.circular(4)),
            child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image(
                          image: AssetImage(getImageName("ic_explore")),
                          width: 16,
                          height: 16),
                      Container(
                          margin: const EdgeInsets.only(left: 10),
                          child: const Text(
                            "Explore",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w500,
                              height: 1.0,
                            ),
                            textAlign: TextAlign.center,
                          ))
                    ]))));
  }
}

class CategoryListItem {
  String title;
  int index;
  bool isSelected = false;
  CategoryListItem(this.title, this.index);
}
