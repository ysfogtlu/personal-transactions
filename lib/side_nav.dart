import 'package:flutter/material.dart';

class SideNav extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Color.fromARGB(255, 48, 48, 48),
      child: Column(
        children: [
          // TODO: if logged in
          UserAccountsDrawerHeader(
            accountName: Text('User Name'),
            accountEmail: Text('username@gmail.com'),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.network(
                  'https://oflutter.com/wp-content/uploads/2021/02/girl-profile.png',
                  fit: BoxFit.cover,
                  width: 90,
                  height: 90,
                ),
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.blue,
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(
                      'https://oflutter.com/wp-content/uploads/2021/02/profile-bg3.jpg')),
            ),
          ),
          // TODO: send them to end of column
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: [
              // TODO: if (not logged in) show login
              TextButton.icon(
                onPressed: onLogin,
                label: Text('Login',
                    textScaleFactor: 1.5,
                    style: TextStyle(color: Colors.white)),
                icon: Icon(
                  Icons.login,
                  color: Colors.white,
                ),
              ),
              TextButton.icon(
                onPressed: onSetCard,
                label: Text('Set Card',
                    textScaleFactor: 1.5,
                    style: TextStyle(color: Colors.white)),
                icon: Icon(Icons.add_card, color: Colors.white),
              ),
              TextButton.icon(
                onPressed: onLogout,
                label: Text('Logout',
                    textScaleFactor: 1.5,
                    style: TextStyle(color: Colors.white)),
                icon: Icon(Icons.logout, color: Colors.white),
              )
            ],
          ),
        ],
      ),
    );
  }

  onLogin() {}
  onSetCard() {}
  onLogout() {}
}
