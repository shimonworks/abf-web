import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';

import '../widgets/navbar.dart';
import '../core/live_stats_service.dart';
import '../theme/responsive.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() =>
      _HomePageState();
}

class _HomePageState
    extends State<HomePage> {

  final ScrollController
      _scrollController =
      ScrollController();

  final GlobalKey _heroKey =
      GlobalKey();

  final GlobalKey _manifestoKey =
      GlobalKey();

  final GlobalKey _joinKey =
      GlobalKey();

  // =========================
  // LIVE STATS
  // =========================

  int supporters = 0;
  int chapters = 0;
  int volunteers = 0;

  bool statsLoaded = false;

  @override
  void initState() {
    super.initState();

    loadLiveStats();
  }

  Future<void> loadLiveStats() async {

    final supporterCount =
        await LiveStatsService
            .getSupporters();

    final chapterCount =
        await LiveStatsService
            .getUniqueChapters();

    final volunteerCount =
        await LiveStatsService
            .getVolunteers();

    setState(() {

      supporters =
          supporterCount;

      chapters =
          chapterCount;

      volunteers =
          volunteerCount;

      statsLoaded = true;
    });
  }

  // =========================
  // OPEN LINKS
  // =========================

  Future<void> _openLink(
    Uri url,
  ) async {

    if (!await launchUrl(
      url,
      mode:
          LaunchMode.externalApplication,
    )) {

      throw Exception(
        'Could not launch $url',
      );
    }
  }

  // =========================
  // SCROLL
  // =========================

  void _scrollToSection(
    GlobalKey key,
  ) {

    final context =
        key.currentContext;

    if (context != null) {

      Scrollable.ensureVisible(
        context,

        duration:
            const Duration(
          milliseconds: 700,
        ),

        curve:
            Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(
    BuildContext context,
  ) {

    final screenWidth =
        MediaQuery.of(context)
            .size
            .width;

    final isMobile =
        Responsive.isMobile(
      context,
    );

    return Scaffold(
      backgroundColor:
          AppColors.background,

      body: Stack(
        children: [

          // =========================
          // MAIN SCROLL
          // =========================

          SingleChildScrollView(
            controller:
                _scrollController,

            child: Column(
              children: [

                // =========================
                // HERO SECTION
                // =========================

                Container(
                  key: _heroKey,

                  width:
                      double.infinity,

                  constraints:
                      BoxConstraints(
                    minHeight:
                        MediaQuery.of(
                                context)
                            .size
                            .height,
                  ),

                  padding:
                      EdgeInsets.symmetric(
                    horizontal:
                        isMobile
                            ? 24
                            : 80,

                    vertical:
                        isMobile
                            ? 130
                            : 160,
                  ),

                  decoration:
                      const BoxDecoration(
                    image:
                        DecorationImage(
                      image: AssetImage(
                        'assets/images/hero_bg.jpg',
                      ),

                      fit: BoxFit.cover,

                      opacity: 0.14,
                    ),
                  ),

                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment
                            .start,

                    mainAxisAlignment:
                        MainAxisAlignment
                            .center,

                    children: [

                      Container(
                        padding:
                            const EdgeInsets.symmetric(
                          horizontal:
                              18,

                          vertical:
                              8,
                        ),

                        decoration:
                            BoxDecoration(
                          border:
                              Border.all(
                            color:
                                AppColors
                                    .neonPink,
                          ),

                          borderRadius:
                              BorderRadius.circular(
                            30,
                          ),
                        ),

                        child: Text(
                          'CONSTITUTIONAL YOUTH MOVEMENT',

                          style:
                              AppTextStyles
                                  .navText
                                  .copyWith(
                            fontSize:
                                isMobile
                                    ? 10
                                    : 14,
                          ),
                        ),
                      ),

                      const SizedBox(
                        height: 40,
                      ),

                      SizedBox(
                        width:
                            isMobile
                                ? double.infinity
                                : 1050,

                        child: Text(
                          'WOMEN DESERVE MORE THAN SURVIVAL.',

                          style:
                              AppTextStyles
                                  .heroTitle
                                  .copyWith(
                            fontSize:
                                isMobile
                                    ? 58
                                    : 92,

                            height:
                                1,
                          ),
                        ),
                      ),

                      const SizedBox(
                        height: 30,
                      ),

                      SizedBox(
                        width:
                            isMobile
                                ? double.infinity
                                : 700,

                        child: Text(
                          'A youth-led constitutional movement advocating safety, rapid justice, and independence across India.',

                          style:
                              AppTextStyles
                                  .heroSubtitle
                                  .copyWith(
                            fontSize:
                                isMobile
                                    ? 18
                                    : 24,

                            height:
                                1.8,
                          ),
                        ),
                      ),

                      const SizedBox(
                        height: 50,
                      ),

                      isMobile

                          ? Column(
                              crossAxisAlignment:
                                  CrossAxisAlignment
                                      .start,

                              children: [

                                SizedBox(
                                  width:
                                      double.infinity,

                                  child:
                                      ElevatedButton(
                                    onPressed:
                                        () {

                                      Navigator
                                          .pushNamed(
                                        context,
                                        '/manifesto',
                                      );
                                    },

                                    style:
                                        ElevatedButton.styleFrom(
                                      backgroundColor:
                                          AppColors.neonPink,

                                      padding:
                                          const EdgeInsets.symmetric(
                                        vertical:
                                            24,
                                      ),

                                      shape:
                                          RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(
                                          18,
                                        ),
                                      ),
                                    ),

                                    child:
                                        const Text(
                                      'READ MANIFESTO',
                                    ),
                                  ),
                                ),

                                const SizedBox(
                                  height:
                                      18,
                                ),

                                SizedBox(
                                  width:
                                      double.infinity,

                                  child:
                                      OutlinedButton(
                                    onPressed:
                                        () {
                                      _scrollToSection(
                                        _joinKey,
                                      );
                                    },

                                    style:
                                        OutlinedButton.styleFrom(
                                      side:
                                          const BorderSide(
                                        color:
                                            AppColors.neonCyan,
                                      ),

                                      padding:
                                          const EdgeInsets.symmetric(
                                        vertical:
                                            24,
                                      ),

                                      shape:
                                          RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(
                                          18,
                                        ),
                                      ),
                                    ),

                                    child:
                                        const Text(
                                      'JOIN THE FRONT',
                                    ),
                                  ),
                                ),
                              ],
                            )

                          : Row(
                              children: [

                                ElevatedButton(
                                  onPressed:
                                      () {

                                    Navigator
                                        .pushNamed(
                                      context,
                                      '/manifesto',
                                    );
                                  },

                                  style:
                                      ElevatedButton.styleFrom(
                                    backgroundColor:
                                        AppColors.neonPink,

                                    padding:
                                        const EdgeInsets.symmetric(
                                      horizontal:
                                          40,

                                      vertical:
                                          28,
                                    ),

                                    shape:
                                        RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(
                                        18,
                                      ),
                                    ),
                                  ),

                                  child:
                                      const Text(
                                    'READ MANIFESTO',
                                  ),
                                ),

                                const SizedBox(
                                  width:
                                      24,
                                ),

                                OutlinedButton(
                                  onPressed:
                                      () {
                                    _scrollToSection(
                                      _joinKey,
                                    );
                                  },

                                  style:
                                      OutlinedButton.styleFrom(
                                    side:
                                        const BorderSide(
                                      color:
                                          AppColors.neonCyan,
                                    ),

                                    padding:
                                        const EdgeInsets.symmetric(
                                      horizontal:
                                          40,

                                      vertical:
                                          28,
                                    ),

                                    shape:
                                        RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(
                                        18,
                                      ),
                                    ),
                                  ),

                                  child:
                                      const Text(
                                    'JOIN THE FRONT',
                                  ),
                                ),
                              ],
                            ),

                      const SizedBox(
                        height: 70,
                      ),

                      statsLoaded

                          ? Wrap(
                              spacing:
                                  40,

                              runSpacing:
                                  30,

                              children: [

                                _statItem(
                                  supporters
                                      .toString(),

                                  'SUPPORTERS',
                                ),

                                _statItem(
                                  chapters
                                      .toString(),

                                  'CHAPTERS',
                                ),

                                _statItem(
                                  volunteers
                                      .toString(),

                                  'VOLUNTEERS',
                                ),
                              ],
                            )

                          : const CircularProgressIndicator(),
                    ],
                  ),
                ),

                // =========================
                // MANIFESTO PREVIEW
                // =========================

                Container(
                  key:
                      _manifestoKey,

                  width:
                      double.infinity,

                  padding:
                      EdgeInsets.symmetric(
                    horizontal:
                        isMobile
                            ? 24
                            : 80,

                    vertical:
                        120,
                  ),

                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment
                            .start,

                    children: [

                      Text(
                        'OUR MANIFESTO',

                        style:
                            AppTextStyles
                                .sectionTitle
                                .copyWith(
                          fontSize:
                              isMobile
                                  ? 42
                                  : 72,
                        ),
                      ),

                      const SizedBox(
                        height: 20,
                      ),

                      Text(
                        'Healing the system. Not breaking it.',

                        style:
                            AppTextStyles
                                .heroSubtitle
                                .copyWith(
                          fontSize:
                              isMobile
                                  ? 18
                                  : 24,
                        ),
                      ),

                      const SizedBox(
                        height: 70,
                      ),

                      GridView.count(
                        crossAxisCount:
                            screenWidth >
                                    1100
                                ? 2
                                : 1,

                        shrinkWrap:
                            true,

                        physics:
                            const NeverScrollableScrollPhysics(),

                        crossAxisSpacing:
                            30,

                        mainAxisSpacing:
                            30,

                        childAspectRatio:
                            isMobile
                                ? 0.72
                                : 1.8,

                        children: [

                          _manifestoCard(
                            'UNCOMPROMISED SAFETY',

                            'Building stronger systems for public protection and women-led safety initiatives.',

                            [
                              'Women-led street safety initiatives',
                              'Public transport protection systems',
                              'Fast emergency response advocacy',
                            ],
                          ),

                          _manifestoCard(
                            'RAPID JUSTICE',

                            'Advocating constitutional accountability and faster legal action.',

                            [
                              'Fast-track courts',
                              'Anti-harassment legal reforms',
                              'Action against moral policing',
                            ],
                          ),

                          _manifestoCard(
                            'TOTAL INDEPENDENCE',

                            'Fighting for financial and biological equity.',

                            [
                              'Menstrual leave policies',
                              'Free sanitary pad access',
                              'Women-focused job support systems',
                            ],
                          ),

                          _manifestoCard(
                            'OUR PROMISE',

                            'ABF is rooted in constitutional and non-violent democratic advocacy.',

                            [
                              'Article 19(1)(c) alignment',
                              'Peaceful civic organization',
                              'Legislative advocacy focus',
                            ],
                          ),
                        ],
                      ),

                      const SizedBox(
                        height: 60,
                      ),

                      Center(
                        child:
                            ElevatedButton(
                          onPressed:
                              () {

                            Navigator
                                .pushNamed(
                              context,
                              '/manifesto',
                            );
                          },

                          style:
                              ElevatedButton.styleFrom(
                            backgroundColor:
                                AppColors
                                    .neonPink,

                            padding:
                                const EdgeInsets.symmetric(
                              horizontal:
                                  36,

                              vertical:
                                  24,
                            ),
                          ),

                          child:
                              const Text(
                            'READ FULL MANIFESTO',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // =========================
                // JOIN SECTION
                // =========================

                Container(
                  key: _joinKey,

                  width:
                      double.infinity,

                  padding:
                      EdgeInsets.symmetric(
                    horizontal:
                        isMobile
                            ? 24
                            : 80,

                    vertical:
                        120,
                  ),

                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment
                            .start,

                    children: [

                      Text(
                        'JOIN THE FRONT',

                        style:
                            AppTextStyles
                                .sectionTitle
                                .copyWith(
                          fontSize:
                              isMobile
                                  ? 42
                                  : 72,
                        ),
                      ),

                      const SizedBox(
                        height: 20,
                      ),

                      Text(
                        'Become part of a constitutional youth movement built for real-world impact.',

                        style:
                            AppTextStyles
                                .heroSubtitle
                                .copyWith(
                          fontSize:
                              isMobile
                                  ? 18
                                  : 24,
                        ),
                      ),

                      const SizedBox(
                        height: 60,
                      ),

                      GridView.count(
                        crossAxisCount:
                            screenWidth >
                                    1100
                                ? 3
                                : 1,

                        shrinkWrap:
                            true,

                        physics:
                            const NeverScrollableScrollPhysics(),

                        crossAxisSpacing:
                            30,

                        mainAxisSpacing:
                            30,

                        childAspectRatio:
                            isMobile
                                ? 1.1
                                : 1.1,

                        children: [

                          _joinCard(
                            'JOIN AS SUPPORTER',

                            'Become a #proudbaddie and support movement campaigns.',
                          ),

                          _joinCard(
                            'START A CHAPTER',

                            'Launch ABF in your city or university.',
                          ),

                          _joinCard(
                            'WORKING COMMITTEE',

                            'Apply for media, research, outreach, and operations teams.',
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                // =========================
                // FOOTER
                // =========================

                Container(
                  width:
                      double.infinity,

                  padding:
                      EdgeInsets.symmetric(
                    horizontal:
                        isMobile
                            ? 24
                            : 80,

                    vertical:
                        50,
                  ),

                  decoration:
                      BoxDecoration(
                    border: Border(
                      top: BorderSide(
                        color:
                            AppColors
                                .borderColor,
                      ),
                    ),
                  ),

                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment
                            .start,

                    children: [

                      Text(
                        'ALL BADDIES FRONT',

                        style:
                            AppTextStyles
                                .navText
                                .copyWith(
                          fontSize:
                              22,

                          fontWeight:
                              FontWeight
                                  .bold,
                        ),
                      ),

                      const SizedBox(
                        height: 16,
                      ),

                      Text(
                        'Healing the system. Not breaking it.',

                        style:
                            AppTextStyles
                                .heroSubtitle
                                .copyWith(
                          fontSize:
                              15,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // =========================
          // NAVBAR
          // =========================

          ABFNavbar(

            onHomeTap: () {
              _scrollToSection(
                _heroKey,
              );
            },

            onManifestoTap: () {

              Navigator.pushNamed(
                context,
                '/manifesto',
              );
            },

            onJoinTap: () {
              _scrollToSection(
                _joinKey,
              );
            },
          ),
        ],
      ),
    );
  }

  // =========================
  // STATS
  // =========================

  Widget _statItem(
    String number,
    String label,
  ) {

    return Column(
      crossAxisAlignment:
          CrossAxisAlignment.start,

      children: [

        Text(
          number,

          style: const TextStyle(
            fontSize: 52,
            fontWeight:
                FontWeight.bold,

            color:
                AppColors.neonPink,
          ),
        ),

        const SizedBox(
          height: 10,
        ),

        Text(
          label,

          style:
              AppTextStyles.navText
                  .copyWith(
            color:
                AppColors
                    .textSecondary,

            letterSpacing:
                2,
          ),
        ),
      ],
    );
  }

  // =========================
  // MANIFESTO CARD
  // =========================

  Widget _manifestoCard(
    String title,
    String description,
    List<String> points,
  ) {

    return Container(
      padding:
          const EdgeInsets.all(
        32,
      ),

      decoration:
          BoxDecoration(
        color:
            AppColors.cardBackground
                .withOpacity(
          0.82,
        ),

        borderRadius:
            BorderRadius.circular(
          28,
        ),

        border: Border.all(
          color:
              AppColors.borderColor,
        ),
      ),

      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start,

        children: [

          Text(
            title,

            style:
                AppTextStyles
                    .sectionTitle
                    .copyWith(
              fontSize:
                  28,
            ),
          ),

          const SizedBox(
            height: 20,
          ),

          Text(
            description,

            style:
                AppTextStyles
                    .heroSubtitle
                    .copyWith(
              fontSize:
                  16,

              height:
                  1.7,
            ),
          ),

          const SizedBox(
            height: 28,
          ),

          ...points.map(
            (point) =>
                Padding(
              padding:
                  const EdgeInsets.only(
                bottom:
                    14,
              ),

              child: Row(
                crossAxisAlignment:
                    CrossAxisAlignment
                        .start,

                children: [

                  const Padding(
                    padding:
                        EdgeInsets.only(
                      top:
                          8,
                    ),

                    child:
                        CircleAvatar(
                      radius:
                          3,

                      backgroundColor:
                          AppColors
                              .neonPink,
                    ),
                  ),

                  const SizedBox(
                    width:
                        12,
                  ),

                  Expanded(
                    child:
                        Text(
                      point,

                      style:
                          AppTextStyles
                              .heroSubtitle
                              .copyWith(
                        fontSize:
                            15,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // =========================
  // JOIN CARD
  // =========================

  Widget _joinCard(
    String title,
    String description,
  ) {

    return Container(
      padding:
          const EdgeInsets.all(
        32,
      ),

      decoration:
          BoxDecoration(
        color:
            AppColors.cardBackground,

        borderRadius:
            BorderRadius.circular(
          28,
        ),

        border: Border.all(
          color:
              AppColors.borderColor,
        ),
      ),

      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start,

        mainAxisAlignment:
            MainAxisAlignment
                .spaceBetween,

        children: [

          Column(
            crossAxisAlignment:
                CrossAxisAlignment
                    .start,

            children: [

              Text(
                title,

                style:
                    AppTextStyles
                        .sectionTitle
                        .copyWith(
                  fontSize:
                      24,
                ),
              ),

              const SizedBox(
                height: 20,
              ),

              Text(
                description,

                style:
                    AppTextStyles
                        .heroSubtitle
                        .copyWith(
                  fontSize:
                      16,

                  height:
                      1.7,
                ),
              ),
            ],
          ),

          const SizedBox(
            height: 40,
          ),

          ElevatedButton(
            onPressed: () {

              if (title ==
                  'JOIN AS SUPPORTER') {

                _openLink(
                  Uri.parse(
                    'https://forms.gle/kHDku6pNsfqBawdk7',
                  ),
                );
              }

              else if (title ==
                  'START A CHAPTER') {

                _openLink(
                  Uri.parse(
                    'https://forms.gle/MzkATLEiueuR3VoV6',
                  ),
                );
              }

              else if (title ==
                  'WORKING COMMITTEE') {

                _openLink(
                  Uri.parse(
                    'https://forms.gle/dbje2e2KiVcsBUB78',
                  ),
                );
              }
            },

            style:
                ElevatedButton.styleFrom(
              backgroundColor:
                  AppColors.neonPink,

              padding:
                  const EdgeInsets.symmetric(
                horizontal:
                    26,

                vertical:
                    18,
              ),

              shape:
                  RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(
                  14,
                ),
              ),
            ),

            child:
                const Text(
              'APPLY NOW',
            ),
          ),
        ],
      ),
    );
  }
}