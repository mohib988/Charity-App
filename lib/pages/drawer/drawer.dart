import "package:flutter/material.dart";

class DrawerContainer extends StatefulWidget {
  const DrawerContainer({super.key});

  @override
  State<DrawerContainer> createState() => _DrawerContainerState();
}

class _DrawerContainerState extends State<DrawerContainer> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Drawer(
        child: ListView(
          children: [
            SizedBox(
              height: 250,
              width: double.infinity,
              child: DrawerHeader(
                  child: Container(
                padding: EdgeInsets.only(top: 20.0),
                width: double.infinity,
                color: Theme.of(context).colorScheme.primary,
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 10.0),
                      height: 120,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: AssetImage('images/logo.png'))),
                    ),
                    Text('Org Name'),
                  ],
                ),
              )),
            ),
            ListTile(
              title: Text('About'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Manage'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Settings'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Logout'),
              onTap: () {
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
    );
  }
}
