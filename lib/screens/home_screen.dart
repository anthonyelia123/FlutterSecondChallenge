import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/model_provider.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "/";
  @override
  State<StatefulWidget> createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  var pageIndex = 1;
  @override
  Widget build(BuildContext context) {

    var modelProvider = Provider.of<ModelProvider>(context);
    ScrollController scrollController = ScrollController();
    // if (modelProvider.nftModelList.isEmpty) {
    //   modelProvider.getNftList(pageIndex);
    // }
    scrollController.addListener(() {
      if (scrollController.position.maxScrollExtent ==
          scrollController.position.pixels) {
        pageIndex++;
        // modelProvider.getNftList(pageIndex);
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Screen"),
      ),
      body: RefreshIndicator(color: Colors.black, onRefresh: ,),
    );
  }
}
