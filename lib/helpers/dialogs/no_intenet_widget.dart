import 'package:flutter/material.dart';
import 'package:utilities/constants/asset_names.dart';
import 'package:utilities/constants/consts.dart';
import 'package:utilities/helpers/widgets/buttons/custom_button_with_icon.dart';

/// makes use of the custom dialog
noInternetDialog(BuildContext context,
    {required String text, required Widget icon, String? asset, Function()? onRefresh}) {
  showAdaptiveDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog.adaptive(
            title: Center(
                child: Text("No Internet Connection!",
                    style: Theme.of(context).textTheme.headlineMedium, textAlign: TextAlign.center)),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 12),
                // image
                Image.asset(asset ?? Assets.noInternet, height: 175, package: asset == null ? pkgName : null),
                const SizedBox(height: 12),
                // message
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Center(
                      child: Text(
                          "Oops! Seems like you are offline. Please, recheck your internet connection and reload page",
                          style: Theme.of(context).textTheme.bodyMedium,
                          textAlign: TextAlign.center)),
                ),
                const SizedBox(height: 8),
                // refresh button
                Center(
                    child: SizedBox(
                        width: 200,
                        child: CustomButtonWithIcon(text: text, icon: icon, onPressed: onRefresh, isLoading: false))),
                const SizedBox(height: 16),
              ],
            ));
      });
}
