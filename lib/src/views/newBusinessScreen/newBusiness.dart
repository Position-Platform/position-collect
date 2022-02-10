// ignore_for_file: file_names

/*
 * @Author: Boris Gautier 
 * @Date: 2022-02-09 14:10:40 
 * @Last Modified by: Boris Gautier
 * @Last Modified time: 2022-02-10 12:44:38
 */

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:positioncollect/generated/l10n.dart';
import 'package:positioncollect/src/blocs/new_business/new_business_bloc.dart';
import 'package:positioncollect/src/utils/colors.dart';
import 'package:positioncollect/src/utils/tools.dart';

class NewBusiness extends StatefulWidget {
  const NewBusiness({Key? key}) : super(key: key);

  @override
  _NewBusinessState createState() => _NewBusinessState();
}

class _NewBusinessState extends State<NewBusiness> {
  int currentStep = 0;
  NewBusinessBloc? _newBusinessBloc;

  @override
  void initState() {
    super.initState();
    _newBusinessBloc = BlocProvider.of<NewBusinessBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    changeStatusColor(transparent);

    return BlocListener<NewBusinessBloc, NewBusinessState>(
      listener: (context, state) {
        if (state is StepperTapped) {
          currentStep = state.step;
        }
      },
      child: BlocBuilder<NewBusinessBloc, NewBusinessState>(
        builder: (context, state) {
          final List<Step> steps = [
            Step(
              title: Text(S.of(context).step + " 1"),
              content: Text("Hello!"),
              isActive: currentStep >= 0,
              state: currentStep >= 0
                  ? currentStep == 0
                      ? StepState.editing
                      : StepState.complete
                  : StepState.disabled,
            ),
            Step(
              title: Text(S.of(context).step + " 2"),
              content: Text("World!"),
              isActive: currentStep >= 0,
              state: currentStep >= 1
                  ? currentStep == 1
                      ? StepState.editing
                      : StepState.complete
                  : StepState.disabled,
            ),
            Step(
              title: Text(S.of(context).step + " 3"),
              content: Text("Hello World!"),
              isActive: currentStep >= 0,
              state: currentStep >= 2
                  ? currentStep == 2
                      ? StepState.editing
                      : StepState.complete
                  : StepState.disabled,
            ),
            Step(
              title: Text(S.of(context).step + " 4"),
              content: Text("Hello World!"),
              isActive: currentStep >= 0,
              state: currentStep >= 3
                  ? currentStep == 3
                      ? StepState.editing
                      : StepState.complete
                  : StepState.disabled,
            ),
          ];
          return Scaffold(
            appBar: AppBar(
              iconTheme: const IconThemeData(
                color: whiteColor,
              ),
              systemOverlayStyle: SystemUiOverlayStyle.light,
              centerTitle: true,
              title: Text(S.of(context).addEtablissement,
                  style: const TextStyle(fontSize: 18, color: whiteColor)),
              backgroundColor: primaryColor,
              bottom: PreferredSize(
                  child: Container(
                    color: primaryColor,
                    height: 1.0,
                  ),
                  preferredSize: const Size.fromHeight(1.0)),
            ),
            body: Stepper(
                type: StepperType.horizontal,
                elevation: 0,
                physics: const ScrollPhysics(),
                currentStep: currentStep,
                onStepTapped: (step) => _newBusinessBloc?.add(StepTapped(step)),
                onStepCancel: () =>
                    _newBusinessBloc?.add(StepCancelled(currentStep)),
                onStepContinue: () =>
                    _newBusinessBloc?.add(StepContinue(currentStep)),
                steps: steps),
          );
        },
      ),
    );
  }
}
