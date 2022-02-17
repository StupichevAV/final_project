import 'package:flutter/material.dart';
import '../model/user.dart';
import '../widgets/todolist_widget.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({Key? key, required this.user}) : super(key: key);

  final User user;

  @override
  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Пользователи"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Icon(
              Icons.account_box,
              color: Colors.blue[500],
              size: 86.0,
            ),
            const SizedBox(height: 8.0),
            Text(
              "${widget.user.name} (${widget.user.username})",
              style: Theme.of(context).textTheme.headline5,
            ),
            const SizedBox(height: 8.0),
            Card(
              child: ListTile(
                leading: const Icon(Icons.phone),
                title: const Text('Телефон'),
                subtitle: Text(widget.user.phone),
              ),
            ),
            Card(
              child: ListTile(
                leading: const Icon(Icons.mail),
                title: const Text('Email'),
                subtitle: Text(widget.user.email),
              ),
            ),
            Card(
              child: ListTile(
                leading: const Icon(Icons.web),
                title: const Text('Веб-сайт'),
                subtitle: Text(widget.user.website),
              ),
            ),
            Card(
              child: ListTile(
                leading: const Icon(Icons.business),
                title: const Text('Компания'),
                subtitle: Text('${widget.user.company.name}, '
                    '${widget.user.company.catchPhrase}, '
                    '${widget.user.company.bs}'),
              ),
            ),
            Card(
              child: ListTile(
                leading: const Icon(Icons.contact_mail),
                title: const Text('Адрес'),
                subtitle: Text('${widget.user.address.street}, '
                    '${widget.user.address.suite}, '
                    '${widget.user.address.city}, '
                    '${widget.user.address.zipcode} ('
                    '${widget.user.address.geo.lat}, '
                    '${widget.user.address.geo.lng})'),
              ),
            ),
            Card(
              child: ListTile(
                leading: const Icon(Icons.task),
                title: const Text('Задачи'),
                trailing: const Icon(Icons.chevron_right),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => UserTodosWidget(
                            userId: widget.user.id
                        )),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
