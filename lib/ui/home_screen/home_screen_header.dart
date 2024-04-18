import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomescreenHeader extends StatefulWidget {
  const HomescreenHeader({super.key});

  @override
  State<StatefulWidget> createState() => _HomescreenHeaderState();
}

class _HomescreenHeaderState extends State<HomescreenHeader> {
  String profileImg = "assets/ic_default_profile.png";
  @override
  Widget build(Object context) {
    
    return Container(
        padding: const EdgeInsets.all(16.0),
        alignment: Alignment.center,
        child: Wrap( children:[getHeaderActions(), const Divider(color: Colors.black12, thickness: 1.0,), getHorizontalScrollActions()]));
  }

  Widget getHorizontalScrollActions() {
    List<Widget> child = [];
    child.addAll( [
      "assets/ic_cast.png",
      "assets/ic_notifications.png",
      "assets/ic_search.png",
      "assets/ic_default_profile.png",
            "assets/ic_cast.png",
      "assets/ic_notifications.png",
      "assets/ic_search.png",
      "assets/ic_default_profile.png",
            "assets/ic_cast.png",
      "assets/ic_notifications.png",
      "assets/ic_search.png",
      "assets/ic_default_profile.png",
            "assets/ic_cast.png",
      "assets/ic_notifications.png",
      "assets/ic_search.png",
      "assets/ic_default_profile.png",
            "assets/ic_cast.png",
      "assets/ic_notifications.png",
      "assets/ic_search.png",
      "assets/ic_default_profile.png"
    ].map((e) => getToolsWidget(e)));
    return SingleChildScrollView(scrollDirection: Axis.horizontal, child: Row(crossAxisAlignment: CrossAxisAlignment.start,mainAxisAlignment: MainAxisAlignment.center,children:child,),);
  } 

  Widget getHeaderActions() {
    List<Widget> childs = [
      const Padding(
          padding: EdgeInsets.all(5.0),
          child: Image(
              height: 24,
              width: 90,
              alignment: Alignment.center,
              image: AssetImage("assets/ic_logo.png"))),
      const Spacer(
        flex: 1,
      )
    ];
    childs.addAll([
      "assets/ic_cast.png",
      "assets/ic_notifications.png",
      "assets/ic_search.png",
      "assets/ic_default_profile.png"
    ].map((e) => getToolsWidget(e)));
    return  Row(
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
}
