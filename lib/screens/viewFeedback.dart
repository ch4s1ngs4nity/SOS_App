import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sos_app/services/feedback.dart';
import 'package:sos_app/widgets/drawer.dart';
import 'package:get/get.dart';
import 'package:sos_app/constants.dart' as constant;

FeedbackController controller = Get.put(FeedbackController());

Widget list() {
  controller.refreshFeedback(); //Possibly redundant since the FeedbackController initializes itself.

  return GetBuilder<FeedbackController>(
      init: FeedbackController(),
      builder: (_) => ListView.separated(
          separatorBuilder: (context, index) => Divider( //This builds space between each feedback bubble
            color: Colors.transparent,
            height: 3,
          ),
          itemCount: controller.items.length,
          itemBuilder: (context, index) {
            return Card( //The white bubbles the feedback are inside
                child: ListTile(
                    leading: Icon(Icons.question_answer),
                    title: new RichText( //Allows styled text within the same text area
                      text: new TextSpan(
                        style: new TextStyle(
                          fontSize: 14.0,
                          color: Colors.black,
                        ),
                        children: <TextSpan>[
                          new TextSpan(text: '${getAorB(index, 'name', 'email')}${getText(index, 'flight', ' :: ')}', style: new TextStyle(fontWeight: FontWeight.bold)),
                          new TextSpan(text: '\n${getText(index, 'email')} ${getText(index, 'uid', ' / ')}\n\n', style: new TextStyle(fontSize: 9, color: Colors.grey)),
                          new TextSpan(text: '${controller.items[index].data['feedback']}'),
                        ],
                      ),
                    )
                ));
          }));
}

/*
If the first field requested (a) exists in the feedback document return it otherwise
return the second field requested (b)
 */
String getAorB(index, a, b){
  DocumentSnapshot doc = controller.items[index];
  return (doc.data[a] != null && doc.data[a] != '') ? getText(index, a) : getText(index, b);
}


/*
Returns the field requested or an empty string if the field is invalid
 */
String getText(index, value, [prepend='']){
  if (controller.items[index].data[value] != null && controller.items[index].data[value].trim() != ''){
    return prepend + controller.items[index].data[value];
  }
  return '';
}

class ViewFeedbackScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text('View Feedback')),
      drawer: AppDrawer(constant.Route.viewFeedback),
      body: RefreshIndicator(
          child: list(), onRefresh: controller.refreshFeedback), //onRefresh is what adds the pull down to refresh capability
    );
  }
}
