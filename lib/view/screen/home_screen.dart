import 'package:e_commerce/uitils/themes.dart';
import 'package:e_commerce/view/widgets/main/my_card_item.dart';
import 'package:e_commerce/view/widgets/my_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../../logic/controller/cart_controller.dart';
import '../../logic/controller/product_cotroller.dart';
import '../widgets/main/serach_bar_widget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  final controller = Get.put(ProductController());
  final cartController = Get.put(CartController());
  ScrollController? _scrollController;
  bool get _isAppBarExpanded {
    return _scrollController!.hasClients &&
        _scrollController!.offset > (200 - kToolbarHeight);
  }

  @override
  Widget build(BuildContext context) {
    _scrollController = ScrollController();
    return Container(
      child: NestedScrollView(
          controller: _scrollController,
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverOverlapAbsorber(
                handle:
                    NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                sliver: SliverAppBar(
                  actions: [
                    IconButton(
                        onPressed: () {
                          if (_isAppBarExpanded) {
                            _scrollController!.animateTo(
                                _scrollController!.position.extentInside,
                                duration: Duration(milliseconds: 1300),
                                curve: Curves.decelerate);
                          } else {
                            _scrollController!.animateTo(
                              _scrollController!.position.maxScrollExtent,
                              duration: Duration(milliseconds: 1300),
                              curve: Curves.decelerate,
                            );
                          }
                        },
                        icon: Icon(
                            _isAppBarExpanded ? Icons.search : Icons.close))
                  ],
                  backgroundColor: Get.isDarkMode ? pinkClr : mainColor,
                  pinned: true,
                  //floating: true,
                  stretch: true,
                  expandedHeight: 230.0,
                  flexibleSpace: FlexibleSpaceBar(
                      centerTitle: true,
                      title: const Text(
                        'All Items',
                        style: TextStyle(fontSize: 18),
                      ),
                      background: searchwidget()),
                ),
              ),
            ];
          },
          body: Container(margin:EdgeInsets.only(top: 60) ,child: MyCardItem())),
    );
  }
}

Widget buildSliverAppBar() {
  return SliverAppBar(
    expandedHeight: 500,
    collapsedHeight: 6,
    toolbarHeight: 5,
    // pinned: true,
    stretch: true,
    backgroundColor: Color.fromARGB(255, 44, 236, 37),
    // elevation: 0.5,
    flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text(
          "Categores",
          style: TextStyle(color: mainColor),
          // textAlign: TextAlign.start,
        ),
        background: searchwidget()),
  );
}

class searchwidget extends StatelessWidget {
  const searchwidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        myText(
          text: "Find Your",
          size: 28,
          color: darkModeFontColor,
        ),
        SizedBox(
          height: 5,
        ),
        myText(
          text: "INSPIRATION",
          size: 28,
          color: darkModeFontColor,
        ),
        SizedBox(
          height: 15,
        ),
        SerachBarWidget(),
      ]),
    );
  }
}

//  bool  _isAppBarExpanded (_scrollController){
//     return _scrollController.hasClients &&
//         _scrollController.offset > (200 - kToolbarHeight);
//   }