import 'package:flutter/material.dart';
import 'package:health_care_advisor/theme/colors.dart';
import 'package:health_care_advisor/views/dialogs/account_statement_dialog.dart';

class AccountStatementScreen extends StatefulWidget {
  const AccountStatementScreen({super.key});

  @override
  State<AccountStatementScreen> createState() => _AccountStatementScreenState();
}

class _AccountStatementScreenState extends State<AccountStatementScreen> {
  final TextEditingController _searchController = TextEditingController();
  final List<String> headings = [
    'Deposit',
    'Withdrawal',
    'Subscription',
  ];

  List<String> filteredHeadings = [];
  final TextEditingController _dateController = TextEditingController();

  @override
  void initState() {
    super.initState();
    filteredHeadings = List.from(headings);
    _searchController.addListener(_filterList);
  }

  void _filterList() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      filteredHeadings = headings
          .where((heading) => heading.toLowerCase().contains(query))
          .toList();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    _dateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              color: AppColors.baseColor,
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(
                        Icons.arrow_back,
                        color: AppColors.white,
                        size: 24,
                      ),
                    ),
                    const Text(
                      'Account statement',
                      style: TextStyle(
                        color: AppColors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(
                      width: 24,
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 12,
                    ),
                    TextFormField(
                      controller: _searchController,
                      decoration: InputDecoration(
                        labelText: "Search",
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 12.0),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: AppColors.baseColor,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: AppColors.lightGrey,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        labelStyle: const TextStyle(
                          color: AppColors.baseGrey,
                          fontSize: 16,
                        ),
                        focusColor: AppColors.baseColor,
                        prefixIcon: const Icon(
                          Icons.search_outlined,
                          size: 18,
                          color: AppColors.baseGrey,
                        ),
                      ),
                      style: const TextStyle(
                        color: AppColors.baseGrey,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    const Text(
                      'Account statement',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: AppColors.darkGrey,
                      ),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Container(
                      color: AppColors.greyBackground,
                      child: Column(
                        children: List.generate(
                          filteredHeadings.length,
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
                                showGeneralDialog(
                                  context: context,
                                  barrierDismissible: true,
                                  barrierLabel:
                                      MaterialLocalizations.of(context)
                                          .modalBarrierDismissLabel,
                                  barrierColor: Colors.black54,
                                  transitionDuration:
                                      const Duration(milliseconds: 200),
                                  pageBuilder: (BuildContext buildContext,
                                      Animation animation,
                                      Animation secondaryAnimation) {
                                    return AccountStatementDialog(
                                      title: headings[index],
                                    );
                                  },
                                );
                              },
                              child: ListTile(
                                title: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              filteredHeadings[index],
                                              style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                                color: AppColors.darkGrey,
                                              ),
                                            ),
                                            const SizedBox(height: 5),
                                            const Row(
                                              children: [
                                                Icon(
                                                  Icons.calendar_month_outlined,
                                                  size: 11,
                                                  color: Color(0xff828282),
                                                ),
                                                SizedBox(
                                                  width: 4,
                                                ),
                                                Text(
                                                  'Date - 12/07/2022',
                                                  style: TextStyle(
                                                    fontSize: 11,
                                                    fontWeight: FontWeight.w400,
                                                    color: AppColors.baseGrey,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    const Icon(
                                      Icons.more_vert_rounded,
                                      size: 18,
                                      color: Color(0xff828282),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
