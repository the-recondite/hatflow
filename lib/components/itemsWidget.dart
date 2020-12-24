import 'package:flutter/material.dart';
import 'package:hatflow/components/textControl.dart';
import 'package:hatflow/utils/colors.dart';
import 'package:hatflow/utils/helpers.dart';
import 'package:basic_utils/basic_utils.dart';

Widget itemsWidget(BuildContext context, var data, {bool isLast: false, Function(String) popUpSelect}){
 return Container(
   margin: EdgeInsets.only(bottom: getSize(context, isLast ? 90 : 5)),
   child: Container(
     width: getWidth(context),
     padding: EdgeInsets.only(left: getSize(context, 20), top: getSize(context, 20), bottom: getSize(context, 20)),
     decoration: BoxDecoration(
         color: colors.greyColor,
         borderRadius: BorderRadius.circular(getSize(context, 10))
     ),
     child: Row(
       mainAxisAlignment: MainAxisAlignment.spaceAround,
       children: [
         Row(
           children: [
             Container(
               height: getSize(context, 50),
               width: getSize(context, 50),
               decoration: BoxDecoration(
                   image: DecorationImage(
                       image: NetworkImage('https://cdn.pixabay.com/photo/2015/12/07/14/11/shopping-cart-1080840_960_720.jpg'), fit: BoxFit.fill
                   ),
                   borderRadius: BorderRadius.circular(getSize(context, 10)),
                   color: Colors.transparent
               ),
             ),
             SizedBox(width: getSize(context, 20),),
             Container(
               width: getSize(context, 200),
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   textControl(StringUtils.capitalize(data["name"]), context, size: 15, fontWeight: FontWeight.w600, color: Colors.black.withOpacity(0.5), overflow: true),
                   textControl("${data["quantity"]} units left", context, size: 12, fontWeight: FontWeight.w600, color: Colors.black.withOpacity(0.5), overflow: true),
                 ],
               ),
             ),
           ],
         ),
         PopupMenuButton(
           onSelected: (value)=>popUpSelect(value),
           itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
             PopupMenuItem<String>(
                 value: 'add',
                 child: textControl("Add Units", context, size: getSize(context, 15))
             ),
             PopupMenuItem<String>(
                 value: 'remove',
                 child: textControl("Remove Units", context, size: getSize(context, 15))
             ),
            PopupMenuItem<String>(
                 value: 'delete',
                 child: textControl("Delete Item", context, size: getSize(context, 15), color: Colors.red)
             ),
           ],
         )
       ],
     ),
   ),
 );
}