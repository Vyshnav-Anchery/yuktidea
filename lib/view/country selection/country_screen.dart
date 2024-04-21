import 'package:flutter/material.dart';
import 'package:flutter_application_3/core/common%20widgets/gradient_divider.dart';
import 'package:flutter_application_3/view/country%20selection/widget/search_field.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../controllers/countryselection_controller.dart';
import '../../core/common widgets/close_button.dart';
import '../../core/constants/app_theme.dart';
import '../enter phone/phone_number_screen.dart';

class CountrySelectionScreen extends StatelessWidget {
  const CountrySelectionScreen({Key? key, required this.isStudent})
      : super(key: key);
  final bool isStudent;
  @override
  Widget build(BuildContext context) {
    CountrySelectionController countrySelectionController =
        Provider.of<CountrySelectionController>(context, listen: false);
    return Scaffold(
        body: FutureBuilder(
      future: countrySelectionController.getCountries(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(
              color: AppTheme.appPrimaryColor,
            ),
          );
        } else if (!snapshot.hasData || snapshot.data == null) {
          return Center(
            child: Text(
              "Error getting data!!",
              style: TextStyle(color: AppTheme.appPrimaryColor),
            ),
          );
        } else {
          var data = snapshot.data!.data; //api response

          if (data == null) {
            // Handle the case where data is null
            return Center(
              child: Text(
                "No data available",
                style: TextStyle(color: AppTheme.appPrimaryColor),
              ),
            );
          }

          return Consumer<CountrySelectionController>(
              builder: (context, provider, child) {
            return Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  const Align(
                      alignment: Alignment.centerLeft,
                      child: CustomCloseButton(
                        icon: Icons.arrow_back_ios_new_rounded,
                      )),
                  const SizedBox(height: 20),
                  const Text("Select your country",
                      style: TextStyle(fontSize: 25)),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: CustomSearchFormField(
                      prefixIcon:
                          Icon(Icons.search, color: AppTheme.appPrimaryColor),
                      hintText: 'Search...',
                      onChanged: (value) {
                        provider.filterCountries(value);
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                  Expanded(
                    child: ListView.separated(
                      separatorBuilder: (context, index) =>
                          const GradientDivider(),
                      itemCount: provider.filteredCountries.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => PhoneNumberScreen(
                                      isStudent: isStudent,
                                      countryCode: provider
                                          .filteredCountries[index].telCode!,
                                      flagUrl: provider
                                          .filteredCountries[index].flag!,
                                    ),
                                  ));
                            },
                            leading: SizedBox(
                              height: 24,
                              width: 36,
                              child: SvgPicture.network(
                                provider.filteredCountries[index].flag!,
                                fit: BoxFit.fill,
                                placeholderBuilder: (context) {
                                  return Center(
                                      child: SizedBox(
                                    height: 15,
                                    width: 15,
                                    child: CircularProgressIndicator(
                                      color: AppTheme.appPrimaryColor,
                                    ),
                                  ));
                                },
                              ),
                            ),
                            title: Text(provider.filteredCountries[index].name
                                .toString()),
                            trailing: Text(provider
                                .filteredCountries[index].telCode
                                .toString()));
                      },
                    ),
                  ),
                ],
              ),
            );
          });
        }
      },
    ));
  }
}
