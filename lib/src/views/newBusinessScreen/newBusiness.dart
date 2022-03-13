// ignore_for_file: file_names, deprecated_member_use

/*
 * @Author: Boris Gautier 
 * @Date: 2022-02-09 14:10:40 
 * @Last Modified by: Boris Gautier
 * @Last Modified time: 2022-03-13 08:07:22
 */

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mapbox_gl/mapbox_gl.dart';
import 'package:positioncollect/generated/l10n.dart';
import 'package:positioncollect/src/blocs/new_business/new_business_bloc.dart';
import 'package:positioncollect/src/utils/colors.dart';
import 'package:positioncollect/src/utils/tools.dart';
import 'package:positioncollect/src/views/newBusinessScreen/formPage/page1.dart';

class NewBusiness extends StatefulWidget {
  const NewBusiness({Key? key, required this.latLng}) : super(key: key);
  final LatLng? latLng;
  @override
  _NewBusinessState createState() => _NewBusinessState();
}

class _NewBusinessState extends State<NewBusiness> {
  int currentStep = 0;
  NewBusinessBloc? _newBusinessBloc;

  VoidCallback? _onStepContinue;
  VoidCallback? _onStepCancel;

  Widget _createEventControlBuilder(
      BuildContext context, ControlsDetails? controlsDetails) {
    _onStepContinue = controlsDetails!.onStepContinue;
    _onStepCancel = controlsDetails.onStepCancel;
    return const SizedBox.shrink();
  }

  Widget _bottomBar() {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          RaisedButton(
            onPressed: () => _onStepContinue!(),
            color: primaryColor,
            shape: const StadiumBorder(),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            child: Text(
              S.of(context).next,
              style: const TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          RaisedButton(
            onPressed: () => _onStepCancel!(),
            color: red,
            shape: const StadiumBorder(),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            child: Text(
              S.of(context).back,
              style: const TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }

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
              content: Page1(latLng: widget.latLng),
              isActive: currentStep >= 0,
              state: currentStep >= 0
                  ? currentStep == 0
                      ? StepState.editing
                      : StepState.complete
                  : StepState.disabled,
            ),
            Step(
              title: Text(S.of(context).step + " 2"),
              content: const Text("World!"),
              isActive: currentStep >= 0,
              state: currentStep >= 1
                  ? currentStep == 1
                      ? StepState.editing
                      : StepState.complete
                  : StepState.disabled,
            ),
            Step(
              title: Text(S.of(context).step + " 3"),
              content: const Text("Hello World!"),
              isActive: currentStep >= 0,
              state: currentStep >= 2
                  ? currentStep == 2
                      ? StepState.editing
                      : StepState.complete
                  : StepState.disabled,
            ),
            Step(
              title: Text(S.of(context).step + " 4"),
              content: const Text("End World!"),
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
            body: Stack(children: [
              Stepper(
                type: StepperType.horizontal,
                elevation: 0,
                physics: const ScrollPhysics(),
                currentStep: currentStep,
                onStepTapped: (step) => _newBusinessBloc?.add(StepTapped(step)),
                onStepCancel: () =>
                    _newBusinessBloc?.add(StepCancelled(currentStep)),
                onStepContinue: () =>
                    _newBusinessBloc?.add(StepContinue(currentStep)),
                steps: steps,
                controlsBuilder: _createEventControlBuilder,
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: _bottomBar(),
              )
            ]),
          );
        },
      ),
    );
  }
}
