import 'package:flutter/material.dart';
import 'package:my_portfolio/views/contact_us.dart';
import 'package:my_portfolio/views/home_page.dart';
import 'package:my_portfolio/views/my_portfolio.dart';
import 'package:my_portfolio/views/my_services.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import '../globals/app_colors.dart';
import '../globals/app_text_styles.dart';
import '../globals/constants.dart';

class MainDashBoard extends StatefulWidget {
  const MainDashBoard({Key? key}) : super(key: key);

  @override
  _MainDashBoardState createState() => _MainDashBoardState();
}

class _MainDashBoardState extends State<MainDashBoard> {
  final ItemScrollController _itemScrollController = ItemScrollController();
  final ItemPositionsListener itemPositionsListener = ItemPositionsListener.create();
  final ScrollOffsetListener scrollOffsetListener = ScrollOffsetListener.create();
  final onMenuHover = Matrix4.identity()..scale(1.0);
  final menuItems = <String>[
    'About',
    'Services',
    'Portfolio',
    'Contact',
  ];

  var menuIndex = 0;
  bool showFooter = false; // Track whether to show the footer

  @override
  void initState() {
    super.initState();
    itemPositionsListener.itemPositions.addListener(() {
      final positions = itemPositionsListener.itemPositions.value;
      if (positions.isNotEmpty) {
        int firstIndex = positions
            .where((position) => position.itemLeadingEdge >= 0)
            .map((position) => position.index)
            .first;

        // Check if the user is at the last index
        setState(() {
          menuIndex = firstIndex;
          showFooter = firstIndex == screensList.length - 1; // Show footer only at the last index
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        toolbarHeight: 90,
        titleSpacing: 40,
        elevation: 0,
        title: LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth < 768) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'Mohamed\'s Portfolio',
                    style: AppTextStyles.montserratStyle(color: Colors.white),
                  ),
                  const Spacer(),
                  PopupMenuButton(
                    icon: Icon(
                      Icons.menu_sharp,
                      size: 32,
                      color: AppColors.white,
                    ),
                    color: AppColors.backgroundColor2,
                    position: PopupMenuPosition.under,
                    constraints: BoxConstraints.tightFor(width: size.width * 0.9),
                    itemBuilder: (BuildContext context) => menuItems
                        .asMap()
                        .entries
                        .map(
                          (e) => PopupMenuItem(
                        textStyle: AppTextStyles.headerTextStyle(),
                        onTap: () {
                          scrollTo(index: e.key);
                        },
                        child: Text(
                          e.value,
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    )
                        .toList(),
                  ),
                ],
              );
            } else {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'Mohamed\'s Portfolio',
                    style: AppTextStyles.montserratStyle(color: Colors.white),
                  ),
                  const Spacer(),
                  SizedBox(
                    height: 30,
                    child: ListView.separated(
                      itemCount: menuItems.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      separatorBuilder: (context, child) =>
                          Constants.sizedBox(width: 8),
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            scrollTo(index: index);
                          },
                          borderRadius: BorderRadius.circular(100),
                          child: buildNavBarAnimatedContainer(index, menuIndex == index),
                        );
                      },
                    ),
                  ),
                  Constants.sizedBox(width: 30),
                ],
              );
            }
          },
        ),
      ),
      body: Stack(
        children: [
          Scrollbar(
            trackVisibility: true,
            thumbVisibility: true,
            thickness: 8,
            interactive: true,
            child: ScrollablePositionedList.builder(
              itemCount: screensList.length,
              itemScrollController: _itemScrollController,
              itemPositionsListener: itemPositionsListener,
              scrollOffsetListener: scrollOffsetListener,
              itemBuilder: (context, index) {
                return screensList[index];
              },
            ),
          ),

          // Conditionally show the footer
          if (showFooter)
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 60,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      AppColors.backgroundColor3,
                      AppColors.backgroundColor4,
                    ],
                  ),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Expanded(
                      child: Text(
                        "© 2025 Mohamed Osama. All rights reserved.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white38,
                          fontSize: 12,
                        ),
                      ),
                    ),

                    InkWell(
                      onTap: () {
                        // Scroll to the top of the list
                        _itemScrollController.scrollTo(
                          index: 0,
                          duration: const Duration(seconds: 2),
                          curve: Curves.fastLinearToSlowEaseIn,
                        );
                      },
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColors.themeColor,
                        ),
                        child: const Icon(
                          Icons.arrow_upward,
                          size: 25,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

        ],
      ),
    );
  }

  final screensList = const <Widget>[
    HomePage(),
    MyServices(),
    MyPortfolio(),
    ContactUs(),
  ];

  Future scrollTo({required int index}) async {
    _itemScrollController
        .scrollTo(
      index: index,
      duration: const Duration(seconds: 2),
      curve: Curves.fastLinearToSlowEaseIn,
    )
        .whenComplete(() {
      setState(() {
        menuIndex = index;
      });
    });
  }

  AnimatedContainer buildNavBarAnimatedContainer(int index, bool isSelected) {
    return AnimatedContainer(
      alignment: Alignment.center,
      width: isSelected ? 80 : 75,
      duration: const Duration(milliseconds: 200),
      transform: isSelected ? onMenuHover : null,
      child: Text(
        menuItems[index],
        style: AppTextStyles.headerTextStyle(
          color: isSelected ? AppColors.themeColor : AppColors.white,
        ),
      ),
    );
  }
}