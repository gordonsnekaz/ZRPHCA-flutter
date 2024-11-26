import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:health_care_advisor/news/news_model.dart';
import 'package:health_care_advisor/news/news_service.dart';
import 'package:health_care_advisor/theme/colors.dart';
import 'package:health_care_advisor/views/utilities/package_item.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
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
  List<NewsModel> news = [];
  final TextEditingController _dateController = TextEditingController();

  @override
  void initState() {
    super.initState();
    getNews();
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

  Future<void> getNews() async {
    NewsService newsService = NewsService();
    var response = await newsService.fetchNews();

    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      var newsData = jsonResponse as List<dynamic>;
      setState(() {
        news = newsData.map((json) => NewsModel.fromJson(json)).toList();
        // isLoading = false;
      });
    } else {
      throw Exception('Failed to get news');
    }
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
                      'News',
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
                      color: AppColors.greyBackground,
                      child: Column(
                        children: List.generate(
                          news.length,
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
                                          Text(
                                            news[index].title,
                                            style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                              color: AppColors.darkGrey,
                                            ),
                                          ),
                                          const SizedBox(height: 5),
                                          Text(
                                            news[index].description.length > 30
                                                ? '${news[index]
                                                        .description
                                                        .substring(0, 30)}...'
                                                : news[index].description,
                                            style: const TextStyle(
                                              fontSize:
                                                  12,
                                              fontWeight: FontWeight.w400,
                                              color: AppColors.baseGrey,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 8,
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
