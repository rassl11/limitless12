import 'package:components/common_widgets/progress.dart';
import 'package:components/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:users_creators/src/features/library/bloc/my_sessions/my_sessions_bloc.dart';
import 'package:users_creators/src/features/library/bloc/my_sessions/my_sessions_state.dart';

import '../../../bloc/my_sessions/my_sessions_event.dart';
import 'template_item.dart';

class Template extends StatelessWidget {
  const Template({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      color: ColorsLimitless.brandColor,
      onRefresh: () async {
        context.read<MySessionsTemplatesBloc>().add(LoadSessionTemplatesEvent());
      },
      child: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(minHeight: .9.sh),
          child: BlocBuilder<MySessionsTemplatesBloc, MySessionTemplatesState>(
            builder: (context, state) {
              if (state is LoadingTemplatesState) {
                return AppLoadingWidget(paddingTop: .2.sh);
              }
              if (state is LoadedTemplatesState) {
                return ListView.separated(
                  itemCount: state.loadedTemplate.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.only(
                    bottom: 32.h,
                  ),
                  separatorBuilder: (_, __) => SizedBox(height: 3.h),
                  itemBuilder: (context, index) {
                    return TemplateItem(
                      template: state.loadedTemplate[index],
                    );
                  },
                );
              }
              if (state is EmptyTemplatesState) {
                return Column(
                  children: [
                    SizedBox(height: .2.sh),
                    Text(
                      'No templates yet',
                      style: TextStyle(
                          fontFamily: 'SF Pro', fontSize: 12.sp, color: ColorsLimitless.textColor),
                    ),
                  ],
                );
              }
              if (state is ErrorTemplateState) {
                return const Center(child: Text('Error'));
              }
              return const SizedBox();
            },
          ),
        ),
      ),
    );
  }
}
