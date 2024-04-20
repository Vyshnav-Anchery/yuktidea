import 'package:flutter/material.dart';
import 'package:flutter_application_3/controllers/terms_controller.dart';
import 'package:flutter_application_3/core/common%20widgets/close_button.dart';
import 'package:flutter_application_3/core/constants/app_constants.dart';
import 'package:flutter_application_3/core/constants/app_theme.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:provider/provider.dart';

class TermsAndConditionScreen extends StatelessWidget {
  const TermsAndConditionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TermsController termsController =
        Provider.of<TermsController>(context, listen: false);
    return Scaffold(
      body: FutureBuilder(
        future: termsController.getTerms(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(
                  color: AppTheme.appPrimaryColor), //loading
            );
          } else if (!snapshot.hasData || snapshot.data == null) {
            return Center(
              child: Text(
                "Error getting data!!",
                style: TextStyle(color: AppTheme.appPrimaryColor),
              ),
            );
          } else {
            var data = snapshot.data!.data!; //api response
            String content = "${data.content}"; //terms and conditions
            DateTime updateDate = snapshot.data!.data!.updatedAt!;

            return Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  const Align(
                      alignment: Alignment.centerRight,
                      child: CustomCloseButton(icon: Icons.close_rounded)),
                  const SizedBox(height: 20),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: SizedBox(
                      height: MediaQuery.sizeOf(context).height -
                          AppConstants.closeButtonHeight -
                          65,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  "assets/icons/document_icon.svg",
                                  height: 60,
                                ),
                                const SizedBox(width: 10),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      snapshot.data!.data!.title!,
                                      style: TextStyle(
                                          fontSize: 30,
                                          color: AppTheme.appPrimaryColor),
                                    ),
                                    const SizedBox(height: 10),
                                    Text(
                                      "Update ${updateDate.day}/${updateDate.month}/${updateDate.year}",
                                      style: const TextStyle(
                                          color: Color.fromARGB(
                                              255, 125, 126, 128)),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(height: 30),
                            HtmlWidget(
                              content,
                              customStylesBuilder: (element) {
                                if (element.localName == "h1") {
                                  return {
                                    'color': '#D9896A',
                                    "font-size": "22px"
                                  };
                                }
                                if (element.localName == "p") {
                                  return {'line-height': '24px'};
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 10)
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
