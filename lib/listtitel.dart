import 'dart:typed_data';

import 'package:contact/core/styels.dart';
import 'package:flutter/material.dart';

class Customlisttile extends StatelessWidget {
const   Customlisttile({super.key, required this.name, required this.phone, this.avatarData});
final String name ,phone ;
  final Uint8List? avatarData;
  
  @override

  Widget build(BuildContext context) {

    return Column(
          children: [
            ListTile(
              title: Text(
              name,
                style: styels.font20.copyWith(color: Colors.black87),
              ),
              subtitle:  Text(phone,style: styels.font12,),
              trailing: IconButton(icon: Image.asset("asset/image/search.png",color: Colors.black87,),onPressed: (){
        
              
             
                
              },),
              leading: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Container(
            width: 100, // تعيين حجم الدائرة هنا
            height: 100,
            decoration: const BoxDecoration(
              shape: BoxShape.circle, // تحويل الصورة إلى دائرة
              color: Color(0xFF9747FF), // لون الخلفية
            ),
            child: Center(
              child: avatarData != null
                  ? Image.memory(avatarData!) // عرض الصورة إذا كان هناك بيانات
                  : Text(
                      name.isNotEmpty ? name[0] : "0", // الحرف الأول من الاسم
                      style: const TextStyle(fontSize: 24, color: Colors.white),
                    ),
            ),
          ),
        ],
      ),
            ),
            const Divider(
              thickness: 1,
              color: Color(0xFF9747FF),
            )
          ],
        );
      }
    
  }

