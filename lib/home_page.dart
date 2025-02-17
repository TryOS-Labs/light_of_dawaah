/* By Abdullah As-Sadeed */

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:url_launcher/url_launcher.dart';

class ToolCard {
  final String title;
  final IconData icon;
  final Widget page;

  ToolCard(
    this.title,
    this.icon,
    this.page,
  );
}

class HomePage extends StatelessWidget {
  final Function(Locale) changeLocale;
  final Function toggleTheme;
  const HomePage(
      {super.key, required this.changeLocale, required this.toggleTheme});

  @override
  Widget build(
    BuildContext context,
  ) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.light_of_dawaah,
        ),
        centerTitle: true,
        elevation: 4,
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              child: Text(
                AppLocalizations.of(context)!.light_of_dawaah,
              ),
            ),
            ListTile(
              title: Text(
                AppLocalizations.of(context)!.change_locale,
              ),
              leading: const Icon(Icons.language_rounded),
              onTap: () {
                Locale currentLocale = Localizations.localeOf(context);
                if (currentLocale.languageCode == 'en') {
                  changeLocale(
                    const Locale('bn'),
                  );
                } else {
                  changeLocale(
                    const Locale('en'),
                  );
                }
              },
            ),
            ListTile(
              title: Text(
                AppLocalizations.of(context)!.toggle_theme,
              ),
              leading: const Icon(Icons.dark_mode_rounded),
              onTap: () {
                toggleTheme();
              },
            ),
            ListTile(
              title: Text(
                AppLocalizations.of(context)!.github_repository,
              ),
              leading: const Icon(Icons.code_rounded),
              onTap: () {
                launchUrl(
                  Uri.parse('https://github.com/TryOS-Labs/light_of_dawaah/'),
                );
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: <Widget>[
              Text(
                AppLocalizations.of(context)!.coming_soon,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
