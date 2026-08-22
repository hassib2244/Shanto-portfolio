import 'package:flutter/material.dart';
import 'package:shanto_portfolio/constants/colors.dart';
import 'package:shanto_portfolio/constants/nav_items.dart';
import 'package:shanto_portfolio/constants/skill_items.dart';
import 'package:shanto_portfolio/styles/style.dart';
import 'package:shanto_portfolio/widgets/drawer_mobile.dart';
import 'package:shanto_portfolio/widgets/header_mobile.dart';
import 'package:shanto_portfolio/widgets/header_desktop.dart';
import 'package:shanto_portfolio/widgets/main_desktop.dart';
import 'package:shanto_portfolio/widgets/main_mobile.dart';
import 'package:shanto_portfolio/widgets/site_logo.dart';
import 'package:shanto_portfolio/widgets/skills_desktop.dart';
import 'package:shanto_portfolio/widgets/skills_mobile.dart';

import '../constants/size.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
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
          endDrawer:constraints.maxWidth>=kMinDesktopWidth? null: const DrawerMobile(),
          body: ListView(
            scrollDirection: Axis.vertical,
            children: [
              //MAIN
              if(constraints.maxWidth>=600)
              const HeaderDesktop()
              else
             HeaderMobile(
          onLogoTap: (){},
          onMenuTap: (){
            scaffoldKey.currentState?.openEndDrawer();
          },
        ),
              if(constraints.maxWidth>=600)
                const MainDesktop()
              else
             const MainMobile(),

              //SKILLS
              Container(
                height: 900,
                width: screenWidth,
                padding:const EdgeInsets.fromLTRB(25, 20, 25, 60),
                color: CustomColor.bgLight1,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                  const  Text(
                    "<- What I can do ->",
                    style: TextStyle(
                      fontSize: 30,
                    fontWeight: FontWeight.bold,
                      color: CustomColor.whitePrimary,
                    ),
                  ),
                   const SizedBox(height:50 ),
                    //platforms and skills
                    if(constraints.maxWidth>=kMedDesktopWidth)
                  const SkillsDesktop()
                    else
                    const SkillsMobile(),

                  ],
                ),
              ),
              //PROJECTS
              Container(
                height: 500,
                width: double.maxFinite,

              ),
              //CONTACTS
              Container(
                height: 500,
                width: double.maxFinite,
                color: Colors.blueGrey,
              ),
              //FOOTER
              Container(
                height: 500,
                width: double.maxFinite,

              ),
          ],
          ),
        );
      }
    );
  }
}

