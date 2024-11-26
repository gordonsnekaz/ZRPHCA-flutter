import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:health_care_advisor/theme/colors.dart';
import 'package:health_care_advisor/views/utilities/package_item.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  bool isAll = true;
  bool isUnread = false;
  bool isRead = false;

  final TextEditingController _searchController = TextEditingController();
  final List<String> headings = [
    'New Counter',
    'ZWG convertion',
    'Holiday update',
    'Market'
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
                      'Notifications',
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
                  mainAxisAlignment: MainAxisAlignment.start,
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
                    Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: AppColors.greyBackground,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          InkWell(
                            child: isAll
                                ? Container(
                                    padding:
                                        const EdgeInsets.fromLTRB(6, 1, 6, 1),
                                    decoration: BoxDecoration(
                                        color: AppColors.white,
                                        border: Border.all(
                                          color: AppColors.white,
                                          width: 1.0,
                                        ),
                                        borderRadius: BorderRadius.circular(4)),
                                    child: const Text(
                                      "All",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: AppColors.baseColor),
                                    ),
                                  )
                                : Container(
                                    padding:
                                        const EdgeInsets.fromLTRB(6, 1, 6, 1),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4),
                                      border: Border.all(
                                        color: AppColors.greyBackground,
                                        width: 1.0,
                                      ),
                                    ),
                                    child: const Text(
                                      "All",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: AppColors.darkGrey),
                                    ),
                                  ),
                            onTap: () {
                              setState(() {
                                isAll = true;
                                isUnread = false;
                                isRead = false;
                              });
                            },
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          InkWell(
                            child: isUnread
                                ? Container(
                                    padding:
                                        const EdgeInsets.fromLTRB(6, 1, 6, 1),
                                    decoration: BoxDecoration(
                                        color: AppColors.white,
                                        border: Border.all(
                                          color: AppColors.white,
                                          width: 1.0,
                                        ),
                                        borderRadius: BorderRadius.circular(4)),
                                    child: const Text(
                                      "Unread",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: AppColors.baseColor),
                                    ),
                                  )
                                : Container(
                                    padding:
                                        const EdgeInsets.fromLTRB(6, 1, 6, 1),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4),
                                      border: Border.all(
                                        color: AppColors.greyBackground,
                                        width: 1.0,
                                      ),
                                    ),
                                    child: const Text(
                                      "Unread",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: AppColors.darkGrey),
                                    ),
                                  ),
                            onTap: () {
                              setState(() {
                                isAll = false;
                                isUnread = true;
                                isRead = false;
                              });
                            },
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          InkWell(
                            child: isRead
                                ? Container(
                                    padding:
                                        const EdgeInsets.fromLTRB(6, 1, 6, 1),
                                    decoration: BoxDecoration(
                                        color: AppColors.white,
                                        border: Border.all(
                                          color: AppColors.white,
                                          width: 1.0,
                                        ),
                                        borderRadius: BorderRadius.circular(4)),
                                    child: const Text(
                                      "Read",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: AppColors.baseColor),
                                    ),
                                  )
                                : Container(
                                    padding:
                                        const EdgeInsets.fromLTRB(6, 1, 6, 1),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4),
                                      border: Border.all(
                                        color: AppColors.greyBackground,
                                        width: 1.0,
                                      ),
                                    ),
                                    child: const Text(
                                      "Read",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: AppColors.darkGrey),
                                    ),
                                  ),
                            onTap: () {
                              setState(() {
                                isAll = false;
                                isUnread = false;
                                isRead = true;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 12,
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
                                  ? AppColors.white
                                  : AppColors.white,
                            ),
                            child: GestureDetector(
                              onTap: () {
                                PersistentNavBarNavigator.pushNewScreen(
                                  context,
                                  screen: const PackageItem(),
                                  withNavBar: false,
                                  pageTransitionAnimation:
                                      PageTransitionAnimation.sizeUp,
                                );
                              },
                              child: ListTile(
                                title: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Text(
                                                filteredHeadings[index],
                                                style: const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500,
                                                  color: AppColors.darkGrey,
                                                ),
                                              ),
                                              const Text(
                                                'Today',
                                                style: TextStyle(
                                                  fontSize: 11,
                                                  fontWeight: FontWeight.w400,
                                                  color: AppColors.baseGrey,
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 5),
                                          const Row(
                                            children: [
                                              Text(
                                                'A new chakuti chakuti has ...',
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
                                    ),
                                    // const SizedBox(
                                    //   width: 8,
                                    // ),
                                    // const Icon(
                                    //   Icons.mail_outlined,
                                    //   size: 18,
                                    //   color: Color(0xff828282),
                                    // ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 6,
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

  Widget buildDetailRow(String title, String value) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 0.4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
              color: AppColors.greyBackground,
              child: Text(
                title,
                style: GoogleFonts.roboto(
                  color: AppColors.darkGrey,
                  fontWeight: FontWeight.w400,
                  fontSize: 15,
                  decoration: TextDecoration.none,
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
              color: AppColors.baseColor,
              child: Text(
                value,
                textAlign: TextAlign.right,
                style: GoogleFonts.roboto(
                  color: AppColors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: 15,
                  decoration: TextDecoration.none,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
