import 'package:flutter/material.dart';
import 'package:sekawan_media_test/modules/profile/data/portfolio_model.dart';
import 'package:url_launcher/url_launcher_string.dart';

class PortfolioWidget extends StatelessWidget {
  PortfolioWidget({super.key});
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
      fileName: "emy_spa.png",
      link: "https://emy-spa.com/",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: imageList.length,
      itemBuilder: (context, index) {
        PortfolioModel image = imageList[index];

        return InkWell(
          onTap: () => launchUrlString(image.link),
          child: Card(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                "assets/images/portfolio/${image.fileName}",
              ),
            ),
          ),
        );
      },
      separatorBuilder: (context, index) => const SizedBox(height: 16),
    );
  }
}
