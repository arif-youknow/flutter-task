import 'package:flutter/material.dart';
import 'package:flutter_task/core/theme/app_colors.dart';
import 'package:flutter_task/core/theme/app_fonts.dart';
import 'package:flutter_task/widgets/bottom_nav.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomNavBar(),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, 
          children: [
            
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: 160,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColors.brandColor,
                  ),
                ),
                Positioned(
                  bottom: -40,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: CircleAvatar(
                      radius: 60,
                      backgroundImage: AssetImage('assets/images/user.png'),
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 60), // Avatar space

           
            ListTile(
              leading: Icon(Icons.person_outline,color: AppColors.brandColor),
              title: Text("My Profile"),
              trailing: Icon(Icons.arrow_forward_ios, size: 16, color: AppColors.brandColor),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.settings_outlined, color: AppColors.brandColor),
              title: Text("Account Setting"),
              trailing: Icon(Icons.arrow_forward_ios, size: 16, color: AppColors.brandColor),
              onTap: () {},
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
             
            ),

           
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Text(
                "More",
                style: TextStyle(
                  fontFamily: AppFonts.primaryFont,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ),

            
            ListTile(
              leading: Icon(Icons.description_outlined, color: AppColors.brandColor),
              title: Text("Terms & Condition"),
              trailing: Icon(Icons.arrow_forward_ios, size: 16, color: AppColors.brandColor),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.privacy_tip_outlined, color: AppColors.brandColor),
              title: Text("Privacy Policy"),
              trailing: Icon(Icons.arrow_forward_ios, size: 16, color: AppColors.brandColor),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.help_outline, color: AppColors.brandColor),
              title: Text("Help/Support"),
              trailing: Icon(Icons.arrow_forward_ios, size: 16, color: AppColors.brandColor),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.logout, color: AppColors.brandColor),
              title: Text("Log Out", style: TextStyle(color: Colors.black)),
              trailing: Icon(Icons.arrow_forward_ios, size: 16, color: AppColors.brandColor),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
