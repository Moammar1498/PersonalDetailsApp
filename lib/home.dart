import 'package:flutter/material.dart';
import 'package:task_one/app_colors.dart';
import 'package:url_launcher/url_launcher.dart';
import 'custom_button.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isConnected = false;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height * 1;
    final width = MediaQuery.sizeOf(context).width * 1;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Moammar Qaddafi',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.secondaryColor,
                  border: Border.all(color: AppColors.primaryColor, width: 6),
                  image: DecorationImage(
                    image: const NetworkImage(
                        'https://ca.slack-edge.com/T05FFAA91JP-U05R29D0E9L-bacb0ecc22fc-512'),
                    fit: BoxFit.cover,
                    onError: (exception, stackTrace) {
                      if (exception.toString().isNotEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                // behavior: SnackBarBehavior.floating,
                                showCloseIcon: true,
                                elevation: 5,
                                backgroundColor: Colors.blueGrey,
                                duration: Duration(minutes: 2),
                                content: Text(
                                    'Please Check your internet connection')));
                      }
                    },
                  )),
            ),
            const SizedBox(
              height: 20,
            ),
            CustomButton(
              height: height * 0.08,
              width: width * 0.6,
              onTap: () {
                setState(() {
                  launched = _launchInWebView(url, context);
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  late final Future<void>? launched;
  final Uri url = Uri.parse('https://github.com/Moammar1498');

  Future<void> _launchInWebView(Uri url, BuildContext context) async {
    if (!await launchUrl(url, mode: LaunchMode.inAppWebView)) {
      throw {
        Exception('Could not launch $url'),
        if (context.mounted)
          {
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Unable to launch the $url')))
          }
      };
    }
  }
}
