
import 'package:contact/load/loadphone_cubit.dart';
import 'package:flutter/material.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permission_handler/permission_handler.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  requestPermission().then((permissionStatus) {
    if (permissionStatus == PermissionStatus.granted) {
      runApp(MyApp());
    } else {
      // Handle the scenario when permission is denied or restricted
    }
  });
}


Future<PermissionStatus> requestPermission() async {
  PermissionStatus status = await Permission.contacts.request();
  return status;
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoadphoneCubit>(
      create: (context) => LoadphoneCubit(),
      child: MaterialApp(
        title: 'Contacts App',
        home: ContactsPage(),
      ),
    );
  }
}
class ContactsPage extends StatefulWidget {
  @override
  _ContactsPageState createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {
  Iterable<Contact>? _contacts;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<LoadphoneCubit>(context).getContacts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contacts'),
      ),
      body: BlocConsumer<LoadphoneCubit, LoadphoneState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          if (state is Loadphonesucess) {
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: state.conn.length * 2 - 1,
                    // Multiply by 2 to account for dividers
                    itemBuilder: (BuildContext context, int index) {
                      if (index.isOdd) {
                        // If index is odd, return a Divider
                        return Divider(
                          color: Color.fromARGB(255, 160, 141, 227),
                          thickness: 1,
                        );
                      }

                      Contact contact = state.conn!.elementAt(index ~/ 2);
                      String initials = contact.displayName?[0] ?? '';

                      return ListTile(
                        title: Text(contact.displayName ?? ''),
                        subtitle: Text(contact.phones!.isNotEmpty
                            ? contact.phones!.first.value.toString()
                            : ''),
                        leading: CircleAvatar(
                          backgroundColor: Color.fromARGB(255, 96, 52, 240),
                          child: contact.avatar!.isEmpty
                              ? Text(initials, style: TextStyle(color: Colors.white))
                              : Image.memory(contact.avatar!),
                        ),
                        trailing: Icon(Icons.add),
                      );
                    },
                  ),
                ),
              ],
            );
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }
}



