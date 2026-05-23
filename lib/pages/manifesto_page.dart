import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';
import '../theme/responsive.dart';

class ManifestoPage extends StatelessWidget {
  const ManifestoPage({super.key});

  @override
  Widget build(BuildContext context) {

    final isMobile =
        Responsive.isMobile(context);

    return Scaffold(
      backgroundColor: AppColors.background,

      body: Stack(
        children: [

          // =========================
          // SCROLLABLE CONTENT
          // =========================

          SingleChildScrollView(
            child: Column(
              children: [

                // =========================
                // HERO SECTION
                // =========================

                Container(
                  width: double.infinity,

                  constraints: BoxConstraints(
                    minHeight:
                        MediaQuery.of(context)
                            .size
                            .height,
                  ),

                  padding: EdgeInsets.symmetric(
                    horizontal:
                        isMobile ? 24 : 80,

                    vertical:
                        isMobile ? 120 : 160,
                  ),

                  decoration:
                      const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        'assets/images/hero_bg.jpg',
                      ),

                      fit: BoxFit.cover,
                      opacity: 0.08,
                    ),
                  ),

                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,

                    children: [

                      Container(
                        padding:
                            const EdgeInsets.symmetric(
                          horizontal: 18,
                          vertical: 8,
                        ),

                        decoration: BoxDecoration(
                          border: Border.all(
                            color:
                                AppColors.neonPink,
                          ),

                          borderRadius:
                              BorderRadius.circular(
                            30,
                          ),
                        ),

                        child: Text(
                          'THE ABF DOCTRINE',

                          style:
                              AppTextStyles.navText
                                  .copyWith(
                            fontSize:
                                isMobile
                                    ? 10
                                    : 14,
                          ),
                        ),
                      ),

                      const SizedBox(height: 50),

                      Text(
                        'OUR\nMANIFESTO.',

                        style: AppTextStyles
                            .heroTitle
                            .copyWith(
                          fontSize:
                              isMobile
                                  ? 64
                                  : 140,

                          height: 0.9,
                        ),
                      ),

                      const SizedBox(height: 40),

                      SizedBox(
                        width:
                            isMobile
                                ? double.infinity
                                : 700,

                        child: Text(
                          'Healing the system. Not breaking it.',

                          style: AppTextStyles
                              .heroSubtitle
                              .copyWith(
                            fontSize:
                                isMobile
                                    ? 20
                                    : 30,

                            height: 1.6,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // =========================
                // CONTENT
                // =========================

                Container(
                  width: double.infinity,

                  padding: EdgeInsets.symmetric(
                    horizontal:
                        isMobile ? 24 : 80,

                    vertical: 100,
                  ),

                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,

                    children: [

                      _sectionText(
                        '''
We’re tired of waiting for things to get better. So, we are stepping up.

Under Article 19(1)(c) of the Indian Constitution, we have the fundamental right to form associations. We are exercising that exact right to build the All Baddies Front (ABF). We aren't a political party, and we aren't vigilantes. We are a youth society, a brotherhood and sisterhood, deeply committed to fixing a broken system from the inside out.

We believe the government is our partner, not our enemy. We absolutely condemn violence and any breach of peace. But we also refuse to stay quiet while women's safety remains a talking point instead of a reality.
''',
                      ),

                      const SizedBox(height: 100),

                      _manifestoBlock(
                        context,

                        number: '01',

                        title:
                            'UNCOMPROMISED SAFETY',

                        description:
                            '''
Article 21 guarantees every citizen the right to life and personal liberty.

We are pushing for women-led protection systems, emergency response advocacy, public transport safety enforcement, and stronger legal deterrents against gender violence.

We demand:

• Capital punishment for rape

• Chemical castration for convicted offenders

• Capital punishment for dowry murders

• Criminalization of marital rape
''',
                      ),

                      const SizedBox(height: 40),

                      _manifestoBlock(
                        context,

                        number: '02',

                        title:
                            'RAPID JUSTICE',

                        description:
                            '''
Justice delayed is justice denied.

We demand dedicated fast-track courts for dowry and domestic abuse cases.

We advocate legal recognition of:

• Slut-shaming as hate speech

• Victim-blaming as defamation

• Eve-teasing as non-bailable harassment

We also demand strict legal action against moral policing and harassment of consenting adults in public spaces.
''',
                      ),

                      const SizedBox(height: 40),

                      _manifestoBlock(
                        context,

                        number: '03',

                        title:
                            'TOTAL INDEPENDENCE',

                        description:
                            '''
A woman should never have to rely on a man merely to survive.

We advocate:

• Job-seeking support for divorced women

• State-funded upskilling programs

• Financial independence systems

• Menstrual leave policies

• Free sanitary pad access nationwide

Healthcare and dignity are rights—not luxuries.
''',
                      ),

                      const SizedBox(height: 40),

                      _manifestoBlock(
                        context,

                        number: '04',

                        title:
                            'OUR PROMISE',

                        description:
                            '''
We are here to heal the system, not break it.

ABF is rooted in:

• Constitutional advocacy

• Peaceful civic action

• Democratic pressure

• Policy drafting

• Legislative engagement

We reject violence and extremism completely.
''',
                      ),

                      const SizedBox(height: 100),

                      Center(
                        child: Text(
                          'WOMEN DESERVE MORE THAN SURVIVAL.',

                          textAlign:
                              TextAlign.center,

                          style: AppTextStyles
                              .sectionTitle
                              .copyWith(
                            fontSize:
                                isMobile
                                    ? 34
                                    : 56,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // =========================
          // BACK BUTTON
          // =========================

          Positioned(
            top: 24,
            left: 20,

            child: SafeArea(
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },

                child: Container(
                  padding:
                      const EdgeInsets.all(12),

                  decoration: BoxDecoration(
                    color:
                        AppColors.cardBackground
                            .withOpacity(0.9),

                    borderRadius:
                        BorderRadius.circular(
                      14,
                    ),

                    border: Border.all(
                      color:
                          AppColors.borderColor,
                    ),
                  ),

                  child: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // =========================
  // INTRO TEXT
  // =========================

  Widget _sectionText(
    String text,
  ) {

    return Text(
      text,

      style: AppTextStyles
          .heroSubtitle
          .copyWith(
        fontSize: 18,
        height: 2,
      ),
    );
  }

  // =========================
  // MANIFESTO BLOCK
  // =========================

  Widget _manifestoBlock(
    BuildContext context, {

    required String number,
    required String title,
    required String description,
  }) {

    final isMobile =
        Responsive.isMobile(context);

    return Container(
      width: double.infinity,

      padding: EdgeInsets.all(
        isMobile ? 24 : 50,
      ),

      decoration: BoxDecoration(
        color:
            AppColors.cardBackground
                .withOpacity(0.82),

        borderRadius:
            BorderRadius.circular(30),

        border: Border.all(
          color: AppColors.borderColor,
        ),
      ),

      child: isMobile

          ? Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,

              children: [

                Text(
                  number,

                  style: AppTextStyles
                      .heroTitle
                      .copyWith(
                    fontSize: 64,
                    color:
                        AppColors.neonPink,
                  ),
                ),

                const SizedBox(height: 12),

                Text(
                  title,

                  style: AppTextStyles
                      .sectionTitle
                      .copyWith(
                    fontSize: 26,
                  ),
                ),

                const SizedBox(height: 24),

                Text(
                  description,

                  style: AppTextStyles
                      .heroSubtitle
                      .copyWith(
                    fontSize: 15,
                    height: 1.9,
                  ),
                ),
              ],
            )

          : Row(
              crossAxisAlignment:
                  CrossAxisAlignment.start,

              children: [

                SizedBox(
                  width: 180,

                  child: Text(
                    number,

                    style: AppTextStyles
                        .heroTitle
                        .copyWith(
                      fontSize: 120,
                      color:
                          AppColors.neonPink,
                    ),
                  ),
                ),

                const SizedBox(width: 50),

                Expanded(
                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment
                            .start,

                    children: [

                      Text(
                        title,

                        style: AppTextStyles
                            .sectionTitle
                            .copyWith(
                          fontSize: 44,
                        ),
                      ),

                      const SizedBox(
                        height: 30,
                      ),

                      Text(
                        description,

                        style:
                            AppTextStyles
                                .heroSubtitle
                                .copyWith(
                          fontSize: 18,
                          height: 2,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}