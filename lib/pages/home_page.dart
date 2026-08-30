import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:shanto_portfolio/constants/colors.dart';
import 'package:shanto_portfolio/constants/nav_items.dart';
import 'package:shanto_portfolio/constants/skill_items.dart';
import 'package:shanto_portfolio/styles/style.dart';
import 'package:shanto_portfolio/widgets/custom_text_field.dart';
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
              SizedBox(height: 30),
              //CONTACTS
              Container(
                padding: const EdgeInsets.fromLTRB(25, 20, 25, 60),
                color: CustomColor.bgLight1,
                child: Column(
                  children: [
                    //title
                    Text("Get in touch",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        color: CustomColor.whitePrimary,
                      ),
                    ),

                    SizedBox(height: 50),
                    //Name
                    ConstrainedBox(
                      constraints:const BoxConstraints(maxWidth: 700,),
                      child:Row(
                        children: [
                          //Name
                          Flexible(
                              child:CustomTextField(
                                hintText: "Your name",
                              ),
                          ),
                          const SizedBox(width: 15),
                          //Email
                          Flexible(
                            child:CustomTextField(
                              hintText: "Your email",
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 15),
                   //Message
                   ConstrainedBox(
                     constraints:const BoxConstraints(
                       maxWidth: 700,
                     ),
                     child: CustomTextField(
                         hintText: "Your message",
                         maxLines: 20,
                       ),
                   ),
                    const SizedBox(height: 20),
                    //Send button
                    ConstrainedBox(
                      constraints:const BoxConstraints(
                        maxWidth: 700,
                      ),
                      child: SizedBox(
                        width:double.maxFinite,
                        child:ElevatedButton(onPressed: (){},
                            child: Text("Get in touch"),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    ConstrainedBox(
                        constraints:const BoxConstraints(
                          maxWidth: 300,
                        ),
                        child: const Divider(),),
                    const SizedBox(height: 15),
                    //SNS icon button links
                    Wrap(
                      spacing: 12,
                      runSpacing: 12,
                      alignment: WrapAlignment.center,
                      children: [
                        Image.asset("assets/github.png",width: 28),
                        Image.asset("assets/linkedin.png",width: 28),
                        Image.asset("assets/facebook.png",width: 28),
                        Image.asset("assets/instagram.png",width: 28),
                        Image.asset("assets/telegram.png",width: 28),


                      ],
                    )
                  ],
                ),
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

