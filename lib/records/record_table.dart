import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:health_care_advisor/records/record_model.dart';
import 'package:health_care_advisor/records/record_service.dart';
import 'package:health_care_advisor/theme/colors.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:health_care_advisor/records/record_item_screen.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:intl/intl.dart';

class RecordTable extends StatefulWidget {
  const RecordTable({
    super.key,
  });

  @override
  State<RecordTable> createState() => _RecordTableState();
}

class _RecordTableState extends State<RecordTable> {
  List<RecordModel> records = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    getSubscriptions();
  }

  Future<void> getSubscriptions() async {
    RecordService recordService = RecordService();
    var response = await recordService.fetchRecords();

    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      var recordsData = jsonResponse as List;
      setState(() {
        records =
            recordsData.map((json) => RecordModel.fromJson(json)).toList();
        isLoading = false;
      });
    } else {
      isLoading = false;
      throw Exception('Failed to get record');
    }
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const SpinKitSpinningLines(
            color: AppColors.baseColor,
            size: 64.0,
          )
        : records.isEmpty
            ? Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(8)),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.cloud_off,
                          color: AppColors.baseColor,
                          size: 36,
                        ),
                      ],
                    ),
                    SizedBox(height: 4),
                    Text(
                      "No Data Found",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: AppColors.darkGrey,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      "Records become available following a diagnosis by either a certified doctor or the ZRPHCA AI",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: AppColors.baseGrey,
                      ),
                    ),
                  ],
                ),
              )
            : Container(
                color: AppColors.greyBackground,
                child: Column(
                  children: List.generate(
                    records.length,
                    (index) => Container(
                      decoration: BoxDecoration(
                        border: const Border(
                          bottom: BorderSide(
                            color: Colors.grey,
                            width: 0.4,
                          ),
                        ),
                        color: index.isEven
                            ? AppColors.greyBackground
                            : AppColors.white,
                      ),
                      child: GestureDetector(
                        onTap: () {
                          PersistentNavBarNavigator.pushNewScreen(
                            context,
                            screen: RecordItemScreen(
                              recordData: records[index],
                            ),
                            withNavBar: false,
                            pageTransitionAnimation:
                                PageTransitionAnimation.sizeUp,
                          );
                        },
                        child: ListTile(
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      records[index].diagnosedBy,
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.baseGrey,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.calendar_today,
                                          color: AppColors.lightGrey,
                                          size: 12,
                                        ),
                                        const SizedBox(
                                          width: 2,
                                        ),
                                        Text(
                                          DateFormat('MMM d, yyyy').format(
                                              DateTime.parse(records[index]
                                                  .diagnosisDate)),
                                          style: const TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                            color: AppColors.lightGrey,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              const Icon(
                                Icons.more_vert_rounded,
                                color: AppColors.baseColor,
                                size: 24,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              );
  }
}
