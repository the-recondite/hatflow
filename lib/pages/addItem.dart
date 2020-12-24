import 'package:flutter/material.dart';
import 'package:hatflow/components/formGroup.dart';
import 'package:hatflow/components/inputFields.dart';
import 'package:hatflow/components/simpleButton.dart';
import 'package:hatflow/components/textControl.dart';
import 'package:hatflow/main.dart';
import 'package:hatflow/utils/helpers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AddItem extends StatefulWidget {
  @override
  _AddItemState createState() => _AddItemState();
}

class _AddItemState extends State<AddItem> {
  Map<String, dynamic> itemData = {};
  final databaseReference = Firestore.instance;
  bool loading = false;

  onChange(String key, dynamic value){
    setState(() {
      itemData = {...itemData, key: value};
    });
  }

  bool disabled(){
    if (itemData["name"] != null && itemData["quantity"] != null){
      return false;
    }
    else {
      return true;
    }
  }

  void onSubmit() async{
    closeKeyboard();
    setState(() {
      loading = true;
    });
    await databaseReference.collection(FirebaseAuth.instance.currentUser.email)
        .doc("items")..set({})..collection("item").add(itemData).then((value) {if (mounted)setState(() {
      loading = false;
    });});
    toastSuccess("Item added succesfully");
    Navigator.of(context)..pop()..pushReplacementNamed(MyApp.pageController);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: getSize(context, 20)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: getSize(context, 50),),
                    textControl("Add Inventory Item", context, size: 15, fontWeight: FontWeight.w600, color: Colors.black),
                    SizedBox(height: getSize(context, 30),),
                    formGroup(context, textInputField(context, borderColor: Colors.grey.withOpacity(0.8), value: itemData["name"],
                        onChange: (value) => onChange("name", value), placeholder: "Item Name"), label: "Item Name", ),
                    formGroup(context, textInputField(context, borderColor: Colors.grey.withOpacity(0.8), value: itemData["quantity"],
                        onChange: (value) => onChange("quantity", value), placeholder: "Item Quantity", type: "number", formatNumber: false), label: "Item Quantity", ),
                    SizedBox(height: getSize(context, 30),),
                    simpleButton("Add Item", context, padH: getWidth(context), disabled: disabled(), loading: loading, onTap: ()=>onSubmit()),
                    SizedBox(height: getSize(context, 30),),
                  ],
                ),
              ),
            ),
            Align(
              child: IconButton(icon: Icon(Icons.close, color: Colors.black,), onPressed: () => Navigator.of(context).pop(),),
              alignment: Alignment.topRight,
            ),
          ],
        ),
      ),
    );
  }
}
