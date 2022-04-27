import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:service_man/api/models/bill/complete_bill_request.dart';
import 'package:service_man/core/blocs/summary/summary_bloc.dart';
import 'package:service_man/helpers/assets/colors.dart';
import 'package:service_man/helpers/assets/routes.dart';
import 'package:service_man/helpers/assets/strings.dart';
import 'package:service_man/helpers/reusable_screens/app_button.dart';
import 'package:service_man/helpers/reusable_screens/app_loader.dart';
import 'package:service_man/helpers/utils/app_utils.dart';

class SummaryScreen extends StatelessWidget {

  final String bookingId;

  const SummaryScreen({Key key, this.bookingId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SummaryBloc(),
      child: _SummaryScreen(bookingId: bookingId),
    );
  }
}


class _SummaryScreen extends StatefulWidget {

  final String bookingId;

  const _SummaryScreen({Key key, this.bookingId}) : super(key: key);

  @override
  __SummaryScreenState createState() => __SummaryScreenState();


}

class __SummaryScreenState extends State<_SummaryScreen> {

  final _formKey = GlobalKey<FormState>();
  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
            color: bDark
        ),
        centerTitle: true,
        backgroundColor: bMilk,
        elevation: 0.0,
        title: Text(
          AppStrings.summaryReport,
          style: AppUtils.adaptableTextStyle(
              size: 14.0, fontWeight: FontWeight.bold, color: bBlack),
        ),
      ),
      backgroundColor: bMilk,
      body: BlocConsumer<SummaryBloc, SummaryState>(

        listenWhen: (prevState, nextState) {
          if (prevState is OnSummaryLoading) {
            Load.dismiss(context);
          }
          return null;
        },

        listener: (context, state) {

          if (state is OnSummaryLoading) {
            Load.show(context);
          }

          if (state is OnSummaryFailure) {
            AppUtils.showErrorFlushBar(context, state.error);
          }

          if (state is OnSummarySuccess) {
            Navigator.pushNamed(
                context, AppRoutes.toHomeScreen);
          }

        },
        builder: (context, state) {
          return Padding(
            padding: EdgeInsets.all(24.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Form(
                          key: _formKey,
                          child: Container(
                            decoration: BoxDecoration(
                                color: AppUtils.hexToColor('#EEEBEA'),
                                borderRadius: BorderRadius.all(
                                    Radius.circular(10.0))
                            ),
                            height: AppUtils.screenAwareSize(200.0, context),
                            child: TextFormField(
                              controller: textEditingController,
                              decoration: InputDecoration(
                                  hintText: AppStrings.summaryTest,
                                  border: InputBorder.none,
                                  hintStyle: AppUtils.adaptableTextStyle(
                                      size: 13.0,
                                      fontWeight: FontWeight.normal,
                                      color: bGrey),
                                  contentPadding: EdgeInsets.all(16.0)
                              ),
                              validator: (String value) {
                                if (value.isEmpty) {
                                  return "Enter a report";
                                }

                                if (value.length < 10) {
                                  return "Enter a detailed report";
                                }
                                return null;
                              },
                              maxLines: null,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Spacer(),
                Row(
                  children: [
                    Expanded(
                        child: AppButton(
                          enabledColor: bPurple,
                          enabled: true,
                          textColor: bWhite,
                          buttonText: AppStrings.submit,
                          voidCallback: () {
                            if (_formKey.currentState.validate()) {
                              _formKey.currentState.save();
                              CompleteBillRequest completeBillRequest =
                              CompleteBillRequest(bookingId: widget.bookingId,  report: textEditingController.text);
                              BlocProvider.of<SummaryBloc>(context).add(SendReport(completeBillRequest));
                            }
                          },
                        )
                    )
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}

class SummaryArguments {
  final String bookingId;

  SummaryArguments(this.bookingId);
}
