import 'package:flutter/material.dart';

Widget navDrawer(context) => Drawer(
  child: ListView(padding: EdgeInsets.zero, children: [
    DrawerHeader(
      decoration: const BoxDecoration(
        color: Colors.blue,
      ),
      child: SizedBox(
        height: 200,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 100,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(50.0))
              ),
              child: Image.network(
                  "https://upload.wikimedia.org/wikipedia/commons/thumb/4/44/Google-flutter-logo.svg/330px-Google-flutter-logo.svg.png"),
            ),
            const Text("Итоговый проект на Flutter",
                style: TextStyle(color: Colors.white))
          ],
        ),
      ),
    ),
    ListTile(
      leading: const Icon(Icons.info),
      title: const Text("О программе..."),
      onTap: () {
        //  Navigator.pushNamed(context, '/tasks');
      },
    ),
    ListTile(
      leading: const Icon(Icons.people),
      title: const Text("Пользователи"),
      onTap: () {
        Navigator.pushNamed(context, '/users');
      },
    ),
    const Divider(),
    ListTile(
      leading: const Icon(Icons.logout),
      title: const Text("Выйти"),
      onTap: () {
        Navigator.pushNamed(context, '/');
      },
    ),
  ]),
);