import 'package:flutter/material.dart';
import 'package:findjobs/helper/config.dart';
import 'package:findjobs/helper/icons.dart';
import 'package:findjobs/helper/utility.dart';
import 'package:findjobs/ui/theme/theme.dart';

class AboutUsPage extends StatelessWidget {
  static MaterialPageRoute getPageRoute() {
    return MaterialPageRoute(builder: (_) => AboutUsPage());
  }
  const AboutUsPage({Key key}) : super(key: key);
  Widget _getUtilRos(context, String text,
      {Function onPressed,
      IconData icon = GIcons.chevron_right_24,
      String selectedText = ""}) {
    return Row(
      children: <Widget>[
        SizedBox(width: 16, height: 50),
        if (icon != null)
          Icon(
            icon,
            color: Theme.of(context).textTheme.subtitle2.color,
            size: 18,
          ),
        SizedBox(width: 14),
        Text(
          text,
          style: Theme.of(context).textTheme.subtitle1.copyWith(fontSize: 14, fontWeight: FontWeight.bold)
        ),
        Text(
          selectedText,
          style: Theme.of(context).textTheme.subtitle2,
        ),
        Spacer(),
        Icon(
          GIcons.chevron_right_24,
          color: Theme.of(context).colorScheme.onSurface,
          size: 18,
        ),
        SizedBox(width: 8, height: 50)
      ],
    ).ripple(onPressed ??
        () {
          // Underdevelopment.displaySnackbar(context, key: scaffoldKey);
        });
  }

  Widget _section1(context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _getUtilRos(context, "Twitter", icon: GIcons.twitter, onPressed: () {
            launch("https://twitter.com/findjobs");
          }),
          Divider(height: 0),
          _getUtilRos(context, "Facebook", icon: GIcons.facebook,
              onPressed: () {
            launch("https://facebook.com/findjobs");
          }),
          Divider(height: 0),
          _getUtilRos(context, "Website", icon: GIcons.link_external_24,
              onPressed: () {
            launch("https://www.findjobs.com");
          }),
        ],
      ),
    );
  }



  void launch(String url) {
    Utility.launchTo(url);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
         title: Title(title: "Tentang Kami", child: Text("Tentang Kami"), color: Theme.of(context).textTheme.bodyText1.color),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 0, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 8),
            _section1(context),
          ],
        ),
      ),
    );
  }
}
