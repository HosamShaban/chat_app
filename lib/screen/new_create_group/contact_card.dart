import 'package:chat_app_flutter2022/model/user.dart';
import 'package:chat_app_flutter2022/providers/user_group.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ContactCard extends StatelessWidget {
  const ContactCard({Key key, this.user}) : super(key: key);
  final UserData user;

  @override
  Widget build(BuildContext context) {
    final gu = Provider.of<GroupUsers>(context);
    bool selected =
        gu.selectedContacts.any((element) => element.uid == user.uid);
    return ListTile(
      onTap: () {
        if (selected) {
          gu.removeFromList(user);
        } else {
          gu.addTOList(user);
        }
      },
      leading: SizedBox(
        width: 50,
        height: 53,
        child: Stack(
          children: [
            CircleAvatar(
              radius: 23,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(27.5),
                child: (user.image != null)
                    ? Image.network(user.image)
                    : Image.asset('assets/profileAvatar.png'),
              ),
              backgroundColor: Colors.blueGrey[200],
            ),
            selected
                ? const Positioned(
                    bottom: 4,
                    right: 5,
                    child: CircleAvatar(
                      backgroundColor: Color(0xFFbf8e52),
                      radius: 11,
                      child: Icon(
                        Icons.check,
                        color: Colors.white,
                        size: 18,
                      ),
                    ),
                  )
                : Container(),
          ],
        ),
      ),
      title: Text(
        user.name ?? user.phone,
        style: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(
        user.status ?? ("Hey there! I am using ChatApp").toString(),
        style: const TextStyle(
          fontSize: 13,
        ),
      ),
    );
  }
}
