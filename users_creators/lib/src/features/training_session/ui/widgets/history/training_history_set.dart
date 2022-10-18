import 'package:flutter/material.dart';
import 'package:users_creators/src/features/training_session/ui/widgets/history/super_set_list.dart';

class TrainingHistorySet extends StatelessWidget {
  const TrainingHistorySet({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  const SingleChildScrollView(child: SuperSetList());
  }
}