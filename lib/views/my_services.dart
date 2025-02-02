import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:my_portfolio/globals/app_assets.dart';
import 'package:my_portfolio/globals/app_buttons.dart';
import 'package:my_portfolio/globals/app_colors.dart';
import 'package:my_portfolio/globals/constants.dart';
import 'package:my_portfolio/helper%20class/helper_class.dart';

import '../globals/app_text_styles.dart';

class MyServices extends StatefulWidget {
  const MyServices({Key? key}) : super(key: key);

  @override
  State<MyServices> createState() => _MyServicesState();
}

class _MyServicesState extends State<MyServices> {
  bool isApp = false, isUi = false, isApi = false;

  final onHoverActive = Matrix4.identity()..translate(0, -10, 0);
  final onHoverRemove = Matrix4.identity()..translate(0, 0, 0);


  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return HelperClass(
      mobile: Column(
        // mainAxisSize: MainAxisSize.min,
        children: [
          buildMyServicesText(),
          Constants.sizedBox(height: 60.0),
          InkWell(
            onTap: () {},
            onHover: (value) {
              setState(() {
                isApp = value;
              });
            },
            child: buildAnimatedContainer(
              title: 'App Development',
              body: 'Specialize in building high-performance, visually appealing mobile applications for both iOS and Android platforms. Ensuring that apps are optimized for performance, with smooth animations and seamless user experiences. Whether you need a business app, e-commerce platform, or a custom solution, I can help bring your idea to life quickly and efficiently.',
              asset: AppAssets.code,
              hover: isApp,
            ),
          ),
          Constants.sizedBox(height: 24.0),
          InkWell(
            onTap: () {},
            onHover: (value) {
              setState(() {
                isUi = value;
              });
            },
            child: buildAnimatedContainer(
              title: 'UI/UX Design',
              body: 'I specialize in crafting intuitive and visually stunning mobile app experiences using Flutter. My UI/UX design process focuses on creating seamless navigation and responsive layouts, ensuring your app looks and performs flawlessly across all devices.',
              asset: AppAssets.brush,
              hover: isUi,
            ),
          ),
          Constants.sizedBox(height: 24.0),
          InkWell(
            onTap: () {},
            onHover: (value) {
              setState(() {
                isApi = value;
              });
            },
            child: buildAnimatedContainer(
              title: 'Backend Services',
              body: 'I provide API integration services to connect your Flutter app to backend services, including databases, cloud storage, and third-party services. Whether you\'re building a chat feature, payment gateway, or social media integration, I ensure smooth, secure communication between your app and backend systems, improving your app\'s functionality and performance.',
              asset: AppAssets.analyst,
              hover: isApi,
            ),
          )
        ],
      ),
      tablet: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          buildMyServicesText(),
          Constants.sizedBox(height: 60.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {},
                onHover: (value) {
                  setState(() {
                    isApp = value;
                  });
                },
                child: buildAnimatedContainer(
                  title: 'App Development',
                  body: 'Specialize in building high-performance, visually appealing mobile applications for both iOS and Android platforms. Ensuring that apps are optimized for performance, with smooth animations and seamless user experiences. Whether you need a business app, e-commerce platform, or a custom solution, I can help bring your idea to life quickly and efficiently.',
                  asset: AppAssets.code,
                  hover: isApp,
                ),
              ),
              Constants.sizedBox(width: 24.0),
              InkWell(
                onTap: () {},
                onHover: (value) {
                  setState(() {
                    isUi = value;
                  });
                },
                child: buildAnimatedContainer(
                  title: 'UI/UX Design',
                  body: 'I specialize in crafting intuitive and visually stunning mobile app experiences using Flutter. My UI/UX design process focuses on creating seamless navigation and responsive layouts, ensuring your app looks and performs flawlessly across all devices.',
                  asset: AppAssets.brush,
                  hover: isUi,
                ),
              ),
            ],
          ),
          Constants.sizedBox(height: 26.0),
          InkWell(
            onTap: () {},
            onHover: (value) {
              setState(() {
                isApi = value;
              });
            },
            child: buildAnimatedContainer(
              title: 'Backend Services',
              body: 'I provide API integration services to connect your Flutter app to backend services, including databases, cloud storage, and third-party services. Whether you\'re building a chat feature, payment gateway, or social media integration, I ensure smooth, secure communication between your app and backend systems, improving your app\'s functionality and performance.',
              asset: AppAssets.analyst,
              hover: isApi,
              width: 725.0,
              hoverWidth: 735.0,
            ),
          )
        ],
      ),
      desktop: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          buildMyServicesText(),
          Constants.sizedBox(height: 60.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {},
                onHover: (value) {
                  setState(() {
                    isApp = value;
                  });
                },
                child: buildAnimatedContainer(
                  title: 'App Development',
                  body: 'Specialize in building high-performance, visually appealing mobile applications for both iOS and Android platforms. Ensuring that apps are optimized for performance, with smooth animations and seamless user experiences. Whether you need a business app, e-commerce platform, or a custom solution, I can help bring your idea to life quickly and efficiently.',
                  asset: AppAssets.code,
                  hover: isApp,
                ),
              ),
              Constants.sizedBox(width: 24.0),
              InkWell(
                onTap: () {},
                onHover: (value) {
                  setState(() {
                    isUi = value;
                  });
                },
                child: buildAnimatedContainer(
                  title: 'UI/UX Design',
                  body: 'I specialize in crafting intuitive and visually stunning mobile app experiences using Flutter. My UI/UX design process focuses on creating seamless navigation and responsive layouts, ensuring your app looks and performs flawlessly across all devices.',
                  asset: AppAssets.brush,
                  hover: isUi,
                ),
              ),
              Constants.sizedBox(width: 24.0),
              InkWell(
                onTap: () {},
                onHover: (value) {
                  setState(() {
                    isApi = value;
                  });
                },
                child: buildAnimatedContainer(
                  title: 'Backend Services',
                  body: 'I provide API integration services to connect your Flutter app to backend services, including databases, cloud storage, and third-party services. Whether you\'re building a chat feature, payment gateway, or social media integration, I ensure smooth, secure communication between your app and backend systems, improving your app\'s functionality and performance.',
                  asset: AppAssets.analyst,
                  hover: isApi,
                ),
              )
            ],
          ),
        ],
      ),
      paddingWidth: size.width * 0.04,
      backgroundColor: AppColors.backgroundColor,
      backgroundColor2: AppColors.backgroundColor2,
    );
  }

  FadeInDown buildMyServicesText() {
    return FadeInDown(
      duration: const Duration(milliseconds: 1200),
      child: RichText(
        text: TextSpan(
          text: 'My ',
          style: AppTextStyles.headingStyles(fontSize: 30.0),
          children: [
            TextSpan(
              text: 'Services',
              style: AppTextStyles.headingStyles(
                  fontSize: 30.0, color: AppColors.robinEdgeBlue),
            )
          ],
        ),
      ),
    );
  }

  AnimatedContainer buildAnimatedContainer({
    required String title,
    required String body,
    required String asset,
    required bool hover,
    double width = 360,
    double hoverWidth = 360,
  }) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      width: hover ? hoverWidth : width,
      height: hover ? 400 : 390,
      alignment: Alignment.center,
      transform: hover ? onHoverActive : onHoverRemove,
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 24),
      decoration: BoxDecoration(
        color: AppColors.backgroundColor2,
        borderRadius: BorderRadius.circular(30),
        border:
            hover ? Border.all(color: AppColors.themeColor, width: 3) : null,
        boxShadow: const [
          BoxShadow(
            color: Colors.black54,
            spreadRadius: 4.0,
            blurRadius: 4.5,
            offset: Offset(3.0, 4.5),
          )
        ],
      ),
      child: Column(
        children: [
          Image.asset(
            asset,
            width: 50,
            height: 50,
            color: AppColors.themeColor,
          ),
          Constants.sizedBox(height: 30.0),
          Text(
            title,
            style: AppTextStyles.montserratStyle(
                color: Colors.white, fontSize: 22.0),
          ),
          Constants.sizedBox(height: 12.0),
          Text(
            body,
            style: AppTextStyles.normalStyle(fontSize: 14.0),
            textAlign: TextAlign.center,
          ),

        ],
      ),
    );
  }
}
