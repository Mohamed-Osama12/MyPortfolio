import 'package:animate_do/animate_do.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:my_portfolio/globals/app_assets.dart';
import 'package:my_portfolio/globals/app_buttons.dart';
import 'package:my_portfolio/globals/app_colors.dart';
import 'package:my_portfolio/globals/app_text_styles.dart';
import 'package:my_portfolio/globals/constants.dart';
import 'package:my_portfolio/helper%20class/helper_class.dart';
import 'package:my_portfolio/widgets/profile_animation.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:html' as html;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final socialButtons = <String, String>{
    AppAssets.linkedIn: 'https://www.linkedin.com/in/mohamed-osama-a2173827b',
    AppAssets.insta: 'https://www.instagram.com/mohamedd_osama',
    AppAssets.github: 'https://github.com/Mohamed-Osama12',
  };


  var socialBI;


  void downloadPDF() {
    final url = AppAssets.resume;

    final html.AnchorElement anchor = html.AnchorElement(href: url)
      ..setAttribute('download', 'Mohamed\'s Cv.pdf')
      ..click();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return HelperClass(
      mobile: Column(
        children: [
          buildHomePersonalInfo(size),
          Constants.sizedBox(height: 25.0),
          const ProfileAnimation()
        ],
      ),
      tablet: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(child: buildHomePersonalInfo(size)),
          const ProfileAnimation(),
        ],
      ),
      desktop: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(child: buildHomePersonalInfo(size)),
          const ProfileAnimation(),
        ],
      ),
      paddingWidth: size.width * 0.1,
      backgroundColor: AppColors.backgroundColor3,
      backgroundColor2: AppColors.backgroundColor4,

    );
  }

  Column buildHomePersonalInfo(Size size) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        FadeInDown(
          duration: const Duration(milliseconds: 1200),
          child: Text(
            'Hello, It\'s Me',
            style: AppTextStyles.montserratStyle(color: Colors.white),
          ),
        ),
        Constants.sizedBox(height: 15.0),
        FadeInRight(
          duration: const Duration(milliseconds: 1400),
          child: Text(
            'Mohamed Osama',
            style: AppTextStyles.headingStyles(),
          ),
        ),
        Constants.sizedBox(height: 15.0),
        FadeInLeft(
          duration: const Duration(milliseconds: 1400),
          child: Row(
            children: [
              Text(
                'I\'m a ',
                style: AppTextStyles.montserratStyle(color: Colors.white),
              ),
              AnimatedTextKit(
                animatedTexts: [
                  TyperAnimatedText(
                    'Flutter Developer',
                    textStyle:
                        AppTextStyles.montserratStyle(color: Colors.lightBlue),
                  ),
                  // TyperAnimatedText('Freelancer',
                  //     textStyle: AppTextStyles.montserratStyle(
                  //         color: Colors.lightBlue)),
                  // TyperAnimatedText('YouTuber',
                  //     textStyle: AppTextStyles.montserratStyle(
                  //         color: Colors.lightBlue))
                ],
                pause: const Duration(milliseconds: 1000),
                displayFullTextOnTap: true,
                stopPauseOnTap: true,
              )
            ],
          ),
        ),
        Constants.sizedBox(height: 15.0),
        FadeInDown(
          duration: const Duration(milliseconds: 1600),
          child: Expanded(
            child: Text(
              'Passionate Flutter developer with a strong foundation in mobile app development and a keen'
                  ' eye for UI/UX design. Skilled in crafting high-performance, cross-platform applications'
                  ' with clean and maintainable code. Experienced in integrating APIs, state management,'
                  ' and optimizing app performance. Dedicated to delivering innovative solutions and '
                  'enhancing user experiences through modern Flutter development.',
              style: AppTextStyles.normalStyle(),
            ),
          ),
        ),
        Constants.sizedBox(height: 22.0),
        FadeInUp(
          duration: const Duration(milliseconds: 1600),
          child:  SizedBox(
            height: 48,
            child: ListView.separated(
              itemCount: socialButtons.length,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, child) => Constants.sizedBox(width: 8.0),
              itemBuilder: (context, index) {
                String asset = socialButtons.keys.elementAt(index);
                String url = socialButtons.values.elementAt(index);

                return InkWell(
                  onTap: () => _launchURL(url),
                  onHover: (value) {
                    setState(() {
                      socialBI = value ? index : null;
                    });
                  },
                  borderRadius: BorderRadius.circular(550.0),

                  hoverColor: AppColors.themeColor,
                  splashColor: AppColors.white,
                  child: buildSocialButton(
                    asset: asset,
                    hover: socialBI == index,
                  ),
                );
              },
            ),
          ),
        ),
        Constants.sizedBox(height: 18.0),
        FadeInUp(
          duration: const Duration(milliseconds: 1800),
          child: AppButtons.buildMaterialButton(
              onTap: () => downloadPDF(),
              buttonName: 'RESUME'),
        ),
      ],
    );
  }

  Ink buildSocialButton({required String asset, required bool hover}) {
    return Ink(
      width: 45,
      height: 45,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white, width: 2.0),
        color: Colors.white,
        shape: BoxShape.circle,
      ),
      padding: const EdgeInsets.all(6),
      child: Image.asset(
        asset,
        width: 10,
        height: 12,
        color: hover ? AppColors.themeColor : Colors.lightBlue,
      ),
    );
  }


  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $url';
    }
  }
}
