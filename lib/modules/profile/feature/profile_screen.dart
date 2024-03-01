import 'package:flutter/material.dart';
import 'package:sekawan_media_test/core/app_color.dart';
import 'package:sekawan_media_test/core/typography.dart';
import 'package:sekawan_media_test/modules/profile/data/portfolio_model.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});
  final List<PortfolioModel> imageList = <PortfolioModel>[
    PortfolioModel(
      fileName: "super_app.png",
      link:
          "https://play.google.com/store/apps/details?id=com.superagent.agent&hl=en",
    ),
    PortfolioModel(
      fileName: "apmigo.png",
      link:
          "https://play.google.com/store/apps/details?id=com.apmigo&hl=id&gl=US",
    ),
    PortfolioModel(
      fileName: "iikbw.png",
      link: "https://iik.ac.id/",
    ),
    PortfolioModel(
      fileName: "overcloudz.png",
      link: "https://sad-turing-e33c87.netlify.app/",
    ),
    PortfolioModel(
      fileName: "wki.png",
      link: "https://wkiinnovationlab.com/",
    ),
    PortfolioModel(
      fileName: "emy_spa.png",
      link: "https://emy-spa.com/",
    ),
  ];

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
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: imageList.length,
                  itemBuilder: (context, index) {
                    PortfolioModel image = imageList[index];

                    return InkWell(
                      onTap: () => launchUrlString(image.link),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                          "assets/images/portfolio/${image.fileName}",
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 16),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
