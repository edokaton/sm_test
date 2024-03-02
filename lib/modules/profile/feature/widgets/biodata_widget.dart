import 'package:flutter/material.dart';
import 'package:sekawan_media_test/core/typography.dart';
import 'package:sekawan_media_test/modules/profile/data/biodata_model.dart';

class BiodataWidget extends StatelessWidget {
  BiodataWidget({super.key});
  final List<BiodataModel> biodata = <BiodataModel>[
    BiodataModel(
      label: "Place, DoB",
      content: "Surabaya, 25-07-1995",
    ),
    BiodataModel(
      label: "Address",
      content:
          "Greenhill F-3, Sekarkurung, Kebomas, Gresik Regency, East Java, Indonesia, 61124",
    ),
    BiodataModel(
      label: "Marital Status",
      content: "Married",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: biodata.length,
      itemBuilder: (context, index) {
        BiodataModel bio = biodata[index];

        return RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            style: heading6.copyWith(
              fontWeight: fontWeightRegular,
            ),
            children: <TextSpan>[
              TextSpan(text: bio.label),
              const TextSpan(text: " : "),
              TextSpan(
                text: bio.content,
                style: heading6.copyWith(
                  fontFamily: "satoshi-italic",
                  fontStyle: FontStyle.italic,
                ),
              ),
            ],
          ),
        );
      },
      separatorBuilder: (context, index) => const SizedBox(height: 8),
    );
  }
}
