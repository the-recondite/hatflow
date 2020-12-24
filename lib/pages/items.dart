import 'package:flutter/material.dart';
import 'package:hatflow/components/contentSearch.dart';
import 'package:hatflow/components/itemsWidget.dart';
import 'package:hatflow/components/loader.dart';
import 'package:hatflow/components/textControl.dart';
import 'package:hatflow/main.dart';
import 'package:hatflow/pageController.dart';
import 'package:hatflow/pages/addItem.dart';
import 'package:hatflow/utils/colors.dart';
import 'package:hatflow/utils/helpers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class Items extends StatefulWidget {
  @override
  _ItemsState createState() => _ItemsState();
}

class _ItemsState extends State<Items> {
  FocusNode focusNode = FocusNode();
  final databaseReference = FirebaseFirestore.instance;
  List<QueryDocumentSnapshot> items = [];
  bool loading = true;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  void getData() {
    try {
      databaseReference
          .collection(FirebaseAuth.instance.currentUser.email)
          .get()
          .then((QuerySnapshot snapshot) {
        snapshot.docs.isNotEmpty?snapshot.docs[0].reference.collection("item").get().then((value) =>
            setItems(value.docs)):setState(() {
          loading = false;
        });
      });
    }
    catch (e){
      setState(() {
        loading = false;
      });
    }
  }

  void setItems(List <dynamic> result){
    items.clear();
    if (mounted)
    setState(() {
      items = result;
      loading = false;
    });
  }

  void action(String text, QueryDocumentSnapshot queryDocumentSnapshot) {
    if (text == "delete") {
      showOptionDialog(context, continueTap: ()=>deleteItem(queryDocumentSnapshot), cancelTap: ()=>Navigator.of(context, rootNavigator: true).pop(), title: "Delete Item", body: "Are your sure you want to delete this item?",
          continueButtonText: "YES", cancelButtonText: "NO");
    }
  }

  void deleteItem(QueryDocumentSnapshot queryDocumentSnapshot){
    Navigator.of(context, rootNavigator: true).pop();
    setState(() {
      loading = true;
    });
    try {
      databaseReference
          .collection(FirebaseAuth.instance.currentUser.email)
          .doc('items').collection('item').doc(queryDocumentSnapshot.id)
          .delete().then((value) {toastSuccess("Item deleted successfully"); getData();});
    } catch (e) {
      print(e.toString());
      setState(() {
        loading = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: (){setState(() {
          closeKeyboard();
          focusNode.unfocus();
        });},
        child: Scaffold(
          floatingActionButton: FloatingActionButton(
            backgroundColor: colors.blueColor,
            heroTag: null,
            onPressed: () => pushNewScreen(context, screen: AddItem(), withNavBar: false),
            child: Icon(Icons.add, color: Colors.white,),
          ),
          body: Stack(
            children: [
              SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: getSize(context, 20)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          SizedBox(height: getSize(context, 60),),
                          textControl("Items", context, size: 20, color: Colors.black, fontWeight: FontWeight.w600),
                          SizedBox(height: getSize(context, 20),),
                        ],
                      ),
                      contentSearch(context, focusNode: focusNode),
                      SizedBox(height: getSize(context, 40),),
                      Visibility(
                        visible: !loading,
                        child: Column(
                          children: List<QueryDocumentSnapshot>.from(items).map(
                                  (i)=>itemsWidget(context, i, isLast: items.last == i, popUpSelect: (text)=>action(text, i))).toList(),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              loaderMainTwo(context, status: loading),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    closeKeyboard();
  }
}
