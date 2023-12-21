import 'package:flutter/material.dart';

class serach extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5.0, right: 010, bottom: 10),
      child: GestureDetector(
       // onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (builder)=>searchpage())),
        child: TextFormField(
         // onTap: () => Navigator.push(context, MaterialPageRoute(builder: (builder)=>searchpage())),
          decoration: InputDecoration(
              filled: true,
              fillColor: const Color.fromARGB(165, 200, 199, 199),
              prefixIcon: Image.asset("asset/image/search.png"),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              focusedBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Color.fromARGB(237, 0, 16, 238)))),
        ),
      ),
    );
  }
}
