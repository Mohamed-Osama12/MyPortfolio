import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:my_portfolio/globals/app_assets.dart';
import 'package:my_portfolio/helper%20class/helper_class.dart';
import '../globals/app_colors.dart';
import '../globals/app_text_styles.dart';
import '../globals/constants.dart';
import 'package:url_launcher/url_launcher.dart';


class MyPortfolio extends StatefulWidget {
  const MyPortfolio({Key? key}) : super(key: key);

  @override
  State<MyPortfolio> createState() => _MyPortfolioState();
}

class _MyPortfolioState extends State<MyPortfolio> {
  final onH0verEffect = Matrix4.identity()..scale(1.0);
  var hoveredIndex;

  final List<Project> projects = [
    /// ---- Varny ---- ///
    Project(
      image: AppAssets.varny,
      title: 'Varny',
      body: 'An online grocery & essentials mart app simplifying shopping with secure transactions and various payment options. Real-time order tracking via websockets keeps users informed. Intuitive UI ensures a smooth, hassle-free shopping experience.',
      androidLink: 'https://play.google.com/store/apps/details?id=com.app.varny',
      iosLink: 'https://apps.apple.com/kw/app/varny-app/id6575345607',
    ),

    /// ---- Clincher ---- ///
    Project(
      image: AppAssets.clincher,
      title: 'Clincher',
      body: 'A dynamic adventure planning app redefining group outings. Users create groups from contacts and collaboratively plan adventures with detailed information. Group voting and suggestion features streamline decision-making for seamless experiences.',
      androidLink: 'https://play.google.com/store/apps/details?id=com.clincher.evyx',
      iosLink: 'https://apps.apple.com/kw/app/clincher/id6642676933',
    ),

    /// ---- Egy Pin ---- ///
    Project(
      image: AppAssets.egyPin,
      title: 'Egy Pin',
      body: 'A dual-sided platform  seamlessly connecting businesses and users. Owners showcase their places with detailed information and manage them via a powerful dashboard. Users easily explore place details, contact information, and services offered.',
      androidLink: 'https://play.google.com/store/apps/details?id=com.egypin.evyx',
      // iosLink: 'https://apps.apple.com/kw/app/clincher/id6642676933',
    ),

    /// ---- Tibbi - طبي ---- ///
    Project(
      image: AppAssets.tibbi,
      title: 'Tibbi - طبي',
      body: 'A comprehensive Flutter healthcare app revolutionizing access to medical services. Users can book appointments (doctors, hospitals, labs, etc.) and home visits. Features include real-time chat with doctors and a secure e-wallet with multiple payment options.',
      // androidLink: 'https://play.google.com/store/apps/details?id=com.egypin.evyx',
      // iosLink: 'https://apps.apple.com/kw/app/clincher/id6642676933',
    ),

    /// ---- Henta ---- ///
    Project(
      image: AppAssets.henta,
      title: 'Henta - هينتا',
      body: 'A dual-flow Flutter app connecting authors and readers. Authors easily upload books, manage publications, and track performance via a comprehensive dashboard, maintaining content control and IP protection. Readers stay updated on author\'s activities. Secure in-app payments facilitate book purchases.',
      // androidLink: 'https://play.google.com/store/apps/details?id=com.egypin.evyx',
      // iosLink: 'https://apps.apple.com/kw/app/clincher/id6642676933',
    ),

    /// ---- Vay Pocket ---- ///
    Project(
      image: AppAssets.vayPocket,
      title: 'Vay Pocket',
      body: 'A powerful Flutter app streamlining business finances, projects, and operations. It features distinct admin and employee flows (Regular, Accountant, Coordinator, Viewer) with role-based access. Comprehensive financial management tracks transactions with detailed logs. Tools enable task assignment, and workflow creation.',
      // androidLink: 'https://play.google.com/store/apps/details?id=com.egypin.evyx',
      // iosLink: 'https://apps.apple.com/kw/app/clincher/id6642676933',
    ),

  ];

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return HelperClass(
      mobile: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          buildProjectText(),
          Constants.sizedBox(height: 40.0),
          buildProjectGridView(crossAxisCount: 1)
        ],
      ),
      tablet: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          buildProjectText(),
          Constants.sizedBox(height: 40.0),
          buildProjectGridView(crossAxisCount: 2)
        ],
      ),
      desktop: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          buildProjectText(),
          Constants.sizedBox(height: 40.0),
          buildProjectGridView(crossAxisCount: 3),
        ],
      ),
      paddingWidth: size.width * 0.1,
      backgroundColor: AppColors.backgroundColor3,
      backgroundColor2: AppColors.backgroundColor4,
    );
  }

  GridView buildProjectGridView({required int crossAxisCount}) {
    return GridView.builder(
      itemCount: projects.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        mainAxisExtent: 325,  //height
        mainAxisSpacing: 24,
        crossAxisSpacing: 24,
      ),
      itemBuilder: (context, index) {
        final project = projects[index];
        return FadeInUpBig(
          duration: const Duration(milliseconds: 1600),
          child: InkWell(
            onTap: () {},
            onHover: (value) {
              setState(() {
                if (value) {
                  hoveredIndex = index;
                } else {
                  hoveredIndex = null;
                }
              });
            },
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      image: AssetImage(project.image),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Visibility(
                  visible: index == hoveredIndex,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 600),
                    transform: index == hoveredIndex ? onH0verEffect : null,
                    curve: Curves.easeIn,
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: LinearGradient(
                        colors: [
                          AppColors.themeColor.withOpacity(1.0),
                          AppColors.themeColor.withOpacity(0.9),
                          AppColors.themeColor.withOpacity(0.8),
                          // AppColors.themeColor.withOpacity(0.8),
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                    child: Column(
                      children: [
                        Text(
                          project.title,
                          style: AppTextStyles.montserratStyle(
                              color: Colors.black, fontSize: 20),
                        ),
                        Constants.sizedBox(height: 6),
                        Text(
                          project.body,
                          style: AppTextStyles.normalStyle(color: Colors.black87),
                          textAlign: TextAlign.center,
                        ),
                        Constants.sizedBox(height: 6),
                        if (project.androidLink != null || project.iosLink != null)
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              if (project.androidLink != null)
                                Container(
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    gradient:  LinearGradient(
                                      colors: [AppColors.backgroundColor3, AppColors.backgroundColor4 , Colors.white], // Customize gradient colors
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.3), // Shadow color
                                        spreadRadius: 2,
                                        blurRadius: 6,
                                        offset: const Offset(2, 4), // Shadow position
                                      ),
                                    ],
                                  ),
                                  child: IconButton(
                                    icon: const Icon(Icons.android , color: Colors.white,),
                                    onPressed: () {
                                      _launchURL(project.androidLink!);
                                    },
                                  ),
                                ),
                              if (project.androidLink != null && project.iosLink != null)
                                Constants.sizedBox(width: 10.0),
                              if (project.iosLink != null)
                                Container(
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    gradient:  LinearGradient(
                                      colors: [AppColors.backgroundColor3, AppColors.backgroundColor4 , Colors.white], // Customize gradient colors
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.3), // Shadow color
                                        spreadRadius: 2,
                                        blurRadius: 6,
                                        offset: const Offset(2, 4), // Shadow position
                                      ),
                                    ],
                                  ),
                                  child: IconButton(
                                    icon: const Icon(Icons.apple, color: Colors.white),
                                    onPressed: () {
                                      _launchURL(project.iosLink!);
                                    },
                                  ),
                                )

                            ],
                          ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  FadeInDown buildProjectText() {
    return FadeInDown(
      duration: const Duration(milliseconds: 1200),
      child: RichText(
        text: TextSpan(
          text: 'Latest ',
          style: AppTextStyles.headingStyles(fontSize: 30.0),
          children: [
            TextSpan(
              text: 'Projects',
              style: AppTextStyles.headingStyles(
                  fontSize: 30, color: AppColors.robinEdgeBlue),
            )
          ],
        ),
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

class Project {
  final String image;
  final String title;
  final String body;
  final String? androidLink;
  final String? iosLink;

  Project({
    required this.image,
    required this.title,
    required this.body,
    this.androidLink,
    this.iosLink,
  });
}

