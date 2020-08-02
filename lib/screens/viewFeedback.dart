import 'package:flutter/material.dart';
import 'package:sos_app/services/feedback.dart';
import 'package:sos_app/widgets/drawer.dart';
import 'package:get/get.dart';
import 'package:sos_app/constants.dart' as constant;

FeedbackController controller = Get.put(FeedbackController());

Widget list() {
  controller.refreshFeedback();
  return GetBuilder<FeedbackController>(
      init: FeedbackController(),
      builder: (_) => ListView.separated(
          separatorBuilder: (context, index) => Divider(
                color: Colors.black,
              ),
          itemCount: controller.items.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text('${controller.items[index].data['feedback']}'),
            );
          }));
}

class ViewFeedbackScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text('View Feedback')),
      drawer: AppDrawer(constant.Route.viewFeedback),
      body: RefreshIndicator(
          child: list(), onRefresh: controller.pullToRefresh),
    );
  }
}
