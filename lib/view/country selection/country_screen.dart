import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../controllers/countryselection_controller.dart';
import '../../core/common widgets/close_button.dart';
import '../../core/constants/app_theme.dart';

class CountrySelectionScreen extends StatelessWidget {
  const CountrySelectionScreen({Key? key});

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
                  SizedBox(
                    width: double.infinity,
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search...',
                        prefixIcon: Icon(Icons.search),
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (value) {
                        // Implement search functionality here
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                  Expanded(
                    child: ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: SizedBox(
                            height: 24,
                            width: 36,
                            child: SvgPicture.network(
                              data[index].flag!,
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
                          title: Text(data[index].name!),
                          trailing: Text(data[index].telCode.toString()),
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
