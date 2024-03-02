import 'package:flutter/material.dart';
import 'package:sekawan_media_test/core/app_color.dart';
import 'package:sekawan_media_test/core/typography.dart';
import 'package:sekawan_media_test/modules/profile/feature/widgets/biodata_widget.dart';
import 'package:sekawan_media_test/modules/profile/feature/widgets/portfolio_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: RichText(
          text: TextSpan(
            style: heading2.copyWith(
              color: AppColor.darkBlue,
              fontFamily: "courgette",
            ),
            children: <TextSpan>[
              const TextSpan(text: 'Edo'),
              TextSpan(
                text: 'Katon',
                style: heading2.copyWith(
                  color: AppColor.danger,
                ),
              ),
            ],
          ),
        ),
        centerTitle: true,
        backgroundColor: AppColor.warmWhite,
        surfaceTintColor: AppColor.warmWhite,
      ),
      backgroundColor: AppColor.warmWhite,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 24,
            ),
            child: Column(
              children: [
                Center(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * .6,
                    height: MediaQuery.of(context).size.width * .6,
                    child: const CircleAvatar(
                      backgroundImage: AssetImage("assets/images/pp.jpg"),
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                Text(
                  "My name is",
                  style: heading4.copyWith(fontFamily: "clash"),
                ),
                Text(
                  "Edo Katon Setiawan",
                  style: heading2.copyWith(
                    fontFamily: "clash",
                  ),
                ),
                const SizedBox(height: 24),
                const Text(
                  "A software engineer with more than 7 years experience. Proficient in various platforms and languages. Team player, quick learner, and problem solver. Seeking a position in an environment which emphasizes teamwork and encourages learning by doing.",
                  style: paragraph1,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24),
                const Text(
                  "Biodata:",
                  style: heading4,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                BiodataWidget(),
                const SizedBox(height: 32),
                Text(
                  "Portfolio",
                  style: heading1.copyWith(
                    fontFamily: "clash",
                    decoration: TextDecoration.underline,
                    decorationColor: AppColor.darkBlue,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                PortfolioWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
