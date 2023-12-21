import 'package:contacts_service/contacts_service.dart';

Future<Iterable<Contact>> fetchContacts() async {
   return await ContactsService.getContacts();
   
  }
