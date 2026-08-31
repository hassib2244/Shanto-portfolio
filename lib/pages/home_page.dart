import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:shanto_portfolio/constants/colors.dart';
import 'package:shanto_portfolio/constants/nav_items.dart';
import 'package:shanto_portfolio/constants/skill_items.dart';
import 'package:shanto_portfolio/constants/sns_links.dart';
import 'package:shanto_portfolio/styles/style.dart';
import 'package:shanto_portfolio/widgets/contact_section.dart';
import 'package:shanto_portfolio/widgets/custom_text_field.dart';
import 'package:shanto_portfolio/widgets/drawer_mobile.dart';
import 'package:shanto_portfolio/widgets/footer.dart';
import 'package:shanto_portfolio/widgets/header_mobile.dart';
import 'package:shanto_portfolio/widgets/header_desktop.dart';
import 'package:shanto_portfolio/widgets/main_desktop.dart';
import 'package:shanto_portfolio/widgets/main_mobile.dart';
import 'package:shanto_portfolio/widgets/site_logo.dart';
import 'package:shanto_portfolio/widgets/skills_desktop.dart';
import 'package:shanto_portfolio/widgets/skills_mobile.dart';
import 'dart:js'as js;

import '../constants/size.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final scrollController = ScrollController();
 final List<GlobalKey> navbarKeys=List.generate(4, (index) => GlobalKey());

  
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;

    return LayoutBuilder(
      builder: (context,constraints) {
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: CustomColor.scaffoldBg,
          endDrawer: constraints.maxWidth >= kMinDesktopWidth
              ? null
              : DrawerMobile(onNavItem: (int navIndex) {
                scaffoldKey.currentState?.closeEndDrawer();
                scrollToSection(navIndex);

          }),
          body: SingleChildScrollView(
            controller: scrollController,
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                SizedBox(key: navbarKeys.first,),
                //MAIN
                if (constraints.maxWidth >= kMinDesktopWidth)
                  HeaderDesktop(onNavMenuTap: (int navIndex) {
                    scrollToSection(navIndex);
                  })
                else
                  HeaderMobile(
                    onLogoTap: () {},
                    onMenuTap: () {
                      scaffoldKey.currentState?.openEndDrawer();
                    },
                  ),
                if(constraints.maxWidth >= kMedDesktopWidth)
                  const MainDesktop()
                else
                  const MainMobile(),

                //SKILLS
                Container(
                  key: navbarKeys[1],
                  height: 900,
                  width: screenWidth,
                  padding: const EdgeInsets.fromLTRB(25, 20, 25, 60),
                  color: CustomColor.bgLight1,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        "<- What I can do ->",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: CustomColor.whitePrimary,
                        ),
                      ),
                      const SizedBox(height: 50),
                      //platforms and skills
                      if(constraints.maxWidth >= kMedDesktopWidth)
                        const SkillsDesktop()
                      else
                        const SkillsMobile(),

                    ],
                  ),
                ),
                const SizedBox(height: 30),
                //PROJECTS
                Container(
                  key: navbarKeys[2],
                  width: screenWidth,
                  padding: const EdgeInsets.fromLTRB(25, 20, 25, 60),
                  child: Column(
                    children: [
                      //work project tittle
                      const Text("Work project Loading...",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: CustomColor.whitePrimary,
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 30),
                //CONTACTS
                ContactSection(
                  key: navbarKeys[3],
                ),
                const SizedBox(height: 30),
                //FOOTER
                Footer(),
              ],
            ),
          ),
        );
      });
  }

  void scrollToSection(int navIndex){
    if (navIndex== 4){
      //open a blog page
      js.context.callMethod('open',[SnsLinks.blog]);
      return;
    }
    
    final key=navbarKeys[navIndex];
    Scrollable.ensureVisible(
      key.currentContext!,
    duration: const Duration(microseconds: 500),
      curve: Curves.easeInOut,
    );
  }
}

