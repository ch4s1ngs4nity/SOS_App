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
            color: Colors.transparent,
            height: 3,
          ),
          itemCount: controller.items.length,
          itemBuilder: (context, index) {
            return Card(
                child: ListTile(
                    leading: Icon(Icons.question_answer),
                    title: new RichText(
                      text: new TextSpan(
                        style: new TextStyle(
                          fontSize: 14.0,
                          color: Colors.black,
                        ),
                        children: <TextSpan>[
                          new TextSpan(text: '${controller.items[index].data['email']}', style: new TextStyle(fontWeight: FontWeight.bold)),
                          new TextSpan(text: '\n${controller.items[index].data['uid']}\n\n', style: new TextStyle(fontSize: 9, color: Colors.grey)),
                          new TextSpan(text: '${controller.items[index].data['feedback']}'),
                        ],
                      ),
                    )
                ));
          }));
}

class ViewFeedbackScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text('View Feedback')),
      drawer: AppDrawer(constant.Route.viewFeedback),
      body: RefreshIndicator(
          child: list(), onRefresh: controller.refreshFeedback),
    );
  }
}
