import 'package:flutter/material.dart';

class AboutUsScreen extends StatelessWidget {
  void _showMoreAboutMeDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('More about me'),
          content: Text(
            'I am Noah, a 23-year-old Computer Scientist who is passionate about Linux, Open-source applications, and Automation. '
            'I am close to finishing my Associate Degree in programming and will pursue a Bachelor\'s degree after that.',
            style: TextStyle(fontSize: 18.0),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Us'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 16.0),
          CircleAvatar(
            radius: 100,
            backgroundImage: AssetImage('lib/assets/images/profile_picture.png'),
          ),
          SizedBox(height: 16.0),
          Text(
            'This Flutter project was made by Noah Haberkorn for the purpose of my "Native Apps" class.',
            style: TextStyle(fontSize: 20.0),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 16.0),
          TextButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('More about me'),
                    content: Text(
                      'I am Noah, a 23-year-old Computer Scientist who is passionate about Linux, Open-source applications, and Automation. '
                      'I am close to finishing my Associate Degree in programming and will pursue a Bachelor\'s degree after that. I have to say I really '
                      'don\'t enjoy making Web and Mobile applications but creating this app has been more fun than I expected, even with its shortcomings.',
                      style: TextStyle(fontSize: 16.0),
                    ),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text('Close'),
                      ),
                    ],
                  );
                },
              );
            },
            child: Text(
              'More about me',
              style: TextStyle(fontSize: 16.0),
            ),
          ),
          SizedBox(height: 16.0),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'My GitHub:\n',
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
                TextSpan(
                  text: 'https://github.com/hbkYuna',
                  style: TextStyle(fontSize: 16.0, color: Colors.blue),
                  // },
                ),
              ],
            ),
          ),
          SizedBox(height: 8.0),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'My LinkedIn:\n',
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
                TextSpan(
                  text: 'https://be.linkedin.com/in/noahhaberkorn',
                  style: TextStyle(fontSize: 16.0, color: Colors.blue),
                  // },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
