import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../core/constants/breakpoints.dart';
import '../../core/localization/localized_text.dart';
import '../../core/theme/app_colors.dart';
import '../../l10n/generated/app_localizations.dart';
import '../../shared/widgets/page_scaffold.dart';
import '../../shared/widgets/responsive_layout.dart';

class TeamMember {
  final String image;
  final String Function(AppLocalizations) name;
  final String Function(AppLocalizations) designation;

  const TeamMember({
    required this.image,
    required this.name,
    required this.designation,
  });
}

class Milestone {
  final String year;
  final LocalizedText description;
  const Milestone(this.year, this.description);
}

// The actual localized team list
final List<TeamMember> kTeam = [
  TeamMember(
    image: 'assets/team/founder0.jpeg', // Add your actual asset paths
    name: (l10n) => l10n.founderName,
    designation: (l10n) => l10n.founderRole,
  ),
  TeamMember(
    image: 'assets/team/JitendraDubey.jpeg',
    name: (l10n) => l10n.presidentName,
    designation: (l10n) => l10n.presidentRole,
  ),
  TeamMember(
    image: 'assets/team/SnehLata.jpeg',
    name: (l10n) => l10n.womenPresidentName,
    designation: (l10n) => l10n.womenPresidentRole,
  ),
  TeamMember(
    image: 'assets/team/KrishnappaH.jpeg',
    name: (l10n) => l10n.vicePresidentName,
    designation: (l10n) => l10n.vicePresidentRole,
  ),
  TeamMember(
    image: 'assets/team/AnandKumarVishwakarma.jpeg',
    name: (l10n) => l10n.secretaryName,
    designation: (l10n) => l10n.secretaryRole,
  ),
  TeamMember(
    image: 'assets/team/DilipKumarSIngh.jpeg',
    name: (l10n) => l10n.deputySecretaryName,
    designation: (l10n) => l10n.deputySecretaryRole,
  ),
  TeamMember(
    image: 'assets/team/SantoshYadav.jpeg',
    name: (l10n) => l10n.treasurerName,
    designation: (l10n) => l10n.treasurerRole,
  ),
  TeamMember(
    image: 'assets/images/team/deputy_treasurer.png',
    name: (l10n) => l10n.deputyTreasurerName,
    designation: (l10n) => l10n.deputyTreasurerRole,
  ),
  TeamMember(
    image: 'assets/team/RanBharoshaYadav.jpeg',
    name: (l10n) => l10n.chiefMentorName,
    designation: (l10n) => l10n.chiefMentorRole,
  ),
  TeamMember(
    image: 'assets/team/RanjitKumarRai.jpeg',
    name: (l10n) => l10n.deputyChiefMentorName,
    designation: (l10n) => l10n.deputyChiefMentorRole,
  ),
  TeamMember(
    image: 'assets/team/AbhishekBraharshi.jpeg',
    name: (l10n) => l10n.nationalAdvisorName,
    designation: (l10n) => l10n.nationalAdvisorRole,
  ),
  // TeamMember(
  //   image: 'assets/images/team/deputy_national_advisor.png',
  //   name: (l10n) => l10n.deputyNationalAdvisorName,
  //   designation: (l10n) => l10n.deputyNationalAdvisorRole,
  // ),
];

// 1. Additional Advisors List
final List<TeamMember> kAdditionalAdvisors = [
  TeamMember(
      image: 'assets/images/team/placeholder.png',
      name: (l10n) => l10n.advisorAjayName,
      designation: (l10n) => l10n.generalAdvisorRole),
  TeamMember(
      image: 'assets/team/PankajKumarMahato.jpeg',
      name: (l10n) => l10n.advisorPankajName,
      designation: (l10n) => l10n.generalAdvisorRole),
  TeamMember(
      image: 'assets/team/DineshKumarRai.jpeg',
      name: (l10n) => l10n.advisorDineshName,
      designation: (l10n) => l10n.generalAdvisorRole),
  TeamMember(
      image: 'assets/images/team/placeholder.png',
      name: (l10n) => l10n.advisorNaginaName,
      designation: (l10n) => l10n.generalAdvisorRole),
  TeamMember(
      image: 'assets/team/BaljitSingh.jpeg',
      name: (l10n) => l10n.advisorBaljitName,
      designation: (l10n) => l10n.generalAdvisorRole),
  TeamMember(
      image: 'assets/images/team/placeholder.png',
      name: (l10n) => l10n.advisorDharmendraName,
      designation: (l10n) => l10n.generalAdvisorRole),
  TeamMember(
      image: 'assets/team/SureshKumarJain.jpeg',
      name: (l10n) => l10n.advisorSureshName,
      designation: (l10n) => l10n.generalAdvisorRole),
  TeamMember(
      image: 'assets/images/team/placeholder.png',
      name: (l10n) => l10n.advisorNeerajName,
      designation: (l10n) => l10n.generalAdvisorRole),
  TeamMember(
      image: 'assets/team/AnantSingh.jpeg',
      name: (l10n) => l10n.advisorAnantName,
      designation: (l10n) => l10n.generalAdvisorRole),
  TeamMember(
      image: 'assets/images/team/placeholder.png',
      name: (l10n) => l10n.advisorRamjitName,
      designation: (l10n) => l10n.generalAdvisorRole),
  TeamMember(
      image: 'assets/images/team/placeholder.png',
      name: (l10n) => l10n.advisorRupeshName,
      designation: (l10n) => l10n.generalAdvisorRole),
  TeamMember(
      image: 'assets/images/team/placeholder.png',
      name: (l10n) => l10n.advisorRajuName,
      designation: (l10n) => l10n.generalAdvisorRole),
  TeamMember(
      image: 'assets/images/team/placeholder.png',
      name: (l10n) => l10n.advisorKunalName,
      designation: (l10n) => l10n.generalAdvisorRole),
];

// 2. Women's Cell Bangalore List (Led by Smt. Sneha Lata Dubey & Smt. Neha Sharma)
final List<TeamMember> kWomensCellTeam = [
  TeamMember(
      image: 'assets/team/SnehLata.jpeg',
      name: (l10n) => l10n.womenPresidentName,
      designation: (l10n) => l10n.womenPresidentRole),
  TeamMember(
      image: 'assets/team/NehaSharma.jpeg',
      name: (l10n) => l10n.womenVPName,
      designation: (l10n) => l10n.womenVPRole),
  TeamMember(
      image: 'assets/team/UrmilaDevi.jpeg',
      name: (l10n) => l10n.supervisorUrmilaName,
      designation: (l10n) => l10n.supervisorRole),
  TeamMember(
      image: 'assets/images/team/placeholder.png',
      name: (l10n) => l10n.secShaunaName,
      designation: (l10n) => l10n.secRole),
  TeamMember(
      image: 'assets/images/team/placeholder.png',
      name: (l10n) => l10n.distPresRaginiName,
      designation: (l10n) => l10n.distPresRole),
  TeamMember(
      image: 'assets/team/SandhyaDevi.jpeg',
      name: (l10n) => l10n.supervisorSandhyaName,
      designation: (l10n) => l10n.supervisorRole),
  TeamMember(
      image: 'assets/team/ShivaniNisad.jpeg',
      name: (l10n) => l10n.organizerShivaniName,
      designation: (l10n) => l10n.organizerRole),
  TeamMember(
      image: 'assets/team/Rina Devi.jpeg',
      name: (l10n) => l10n.memberReenaName,
      designation: (l10n) => l10n.memberRole),
  TeamMember(
      image: 'assets/images/team/placeholder.png',
      name: (l10n) => l10n.memberRekhaName,
      designation: (l10n) => l10n.memberRole),
  TeamMember(
      image: 'assets/images/team/placeholder.png',
      name: (l10n) => l10n.memberPramilaName,
      designation: (l10n) => l10n.memberRole),
  TeamMember(
      image: 'assets/team/RinaDevi.jpeg',
      name: (l10n) => l10n.advisorReenaName,
      designation: (l10n) => l10n.advisorRole),
  TeamMember(
      image: 'assets/team/SanyuktaSingh.jpeg',
      name: (l10n) => l10n.memberSanyuktName,
      designation: (l10n) => l10n.memberRole),
  TeamMember(
      image: 'assets/team/SasmitaPatra.jpeg',
      name: (l10n) => l10n.memberSushmitaName,
      designation: (l10n) => l10n.memberRole),
  TeamMember(
      image: 'assets/team/PujaDevi.jpeg',
      name: (l10n) => l10n.memberPoojaName,
      designation: (l10n) => l10n.memberRole),
];

// 3. Karnataka State & Bangalore Zone Team
final List<TeamMember> kKarnatakaTeam = [
  TeamMember(
      image: 'assets/team/MithileshKumarTripathi.jpeg',
      name: (l10n) => l10n.karnatakaPresName,
      designation: (l10n) => l10n.karnatakaPresRole),
  TeamMember(
      image: 'assets/team/BrijeshKumarKushwaha.jpeg',
      name: (l10n) => l10n.karnatakaVP1Name,
      designation: (l10n) => l10n.karnatakaVPRole),
  TeamMember(
      image: 'assets/team/MangalChoubey.jpeg',
      name: (l10n) => l10n.karnatakaVP2Name,
      designation: (l10n) => l10n.karnatakaVPRole),
  TeamMember(
      image: 'assets/images/team/placeholder.png',
      name: (l10n) => l10n.zoneSouthName,
      designation: (l10n) => l10n.zoneSouthRole),
  TeamMember(
      image: 'assets/team/AnjaniKumarMishra.jpeg',
      name: (l10n) => l10n.zoneNorthName,
      designation: (l10n) => l10n.zoneNorthRole),
  TeamMember(
      image: 'assets/images/team/placeholder.png',
      name: (l10n) => l10n.zoneEastName,
      designation: (l10n) => l10n.zoneEastRole),
  TeamMember(
      image: 'assets/images/team/placeholder.png',
      name: (l10n) => l10n.zoneCentralName,
      designation: (l10n) => l10n.zoneCentralRole),
];

// 4. Uttar Pradesh Chapter Team
final List<TeamMember> kUttarPradeshTeam = [
  TeamMember(
      image: 'assets/images/team/placeholder.png',
      name: (l10n) => l10n.upPresName,
      designation: (l10n) => l10n.upPresRole),
  TeamMember(
      image: 'assets/images/team/placeholder.png',
      name: (l10n) => l10n.upAzamgarhName,
      designation: (l10n) => l10n.upAzamgarhRole),
  TeamMember(
      image: 'assets/images/team/placeholder.png',
      name: (l10n) => l10n.upPrayagrajName,
      designation: (l10n) => l10n.upPrayagrajRole),
  TeamMember(
      image: 'assets/images/team/placeholder.png',
      name: (l10n) => l10n.upGondaName,
      designation: (l10n) => l10n.upGondaRole),
  TeamMember(
      image: 'assets/images/team/placeholder.png',
      name: (l10n) => l10n.upMauName,
      designation: (l10n) => l10n.upMauRole),
];

const Map<String, Map<String, String>> kFounderTalk = {
  'title': {
    'en': 'A Message From Our National President',
    'hi': 'राष्ट्रीय अध्यक्ष का संदेश',
  },
  'heading': {
    'en': 'Dedicated to the Service of Bharat Mata and Sanatan Dharma',
    'hi': 'भारत माता और सनातन धर्म की सेवा के लिए समर्पित',
  },
  'message': {
    'en': 'I am Pandit Jitendra Kumar “Jeetu Dubey”, National President of '
        'Vishwa Hindu Dharma Rakshak Seva Samiti. I have dedicated myself '
        'to the service of Bharat Mata and to working for the welfare of the nation. '
        'I remain committed to the preservation and protection of Hindu Dharma, '
        'our cultural heritage, traditions, and Sanatan values. My purpose is to '
        'strengthen the spirit of unity, service, values, and love for the nation '
        'within society, while ensuring that our rich cultural heritage and values '
        'continue to inspire future generations.',
    'hi': 'मैं पंडित जितेंद्र कुमार “जीतू दुबे”, विश्व हिंदू धर्म रक्षक सेवा समिति का '
        'राष्ट्रीय अध्यक्ष हूँ। मैंने अपना जीवन भारत माता की सेवा और राष्ट्रहित के '
        'कार्यों के लिए समर्पित किया है। हिंदू धर्म, हमारी संस्कृति, परंपराओं और '
        'सनातन मूल्यों की रक्षा एवं संरक्षण के लिए मैं सदैव तत्पर रहता हूँ। मेरा '
        'उद्देश्य समाज में एकता, सेवा, संस्कार और राष्ट्रप्रेम की भावना को मजबूत '
        'करना तथा आने वाली पीढ़ियों तक हमारी गौरवशाली संस्कृति और मूल्यों को '
        'पहुँचाना है।',
  },
  'name': {
    'en': '— Pandit Jitendra Kumar “Jeetu Dubey”',
    'hi': '— पंडित जितेंद्र कुमार “जीतू दुबे”',
  },
  'designation': {
    'en': 'National President',
    'hi': 'राष्ट्रीय अध्यक्ष',
  },
};
const List<Milestone> kMilestones = [
  Milestone('2014', {
    'en':
        'Vishwa Hindu Dharma Rakshak Seva Samiti was established on 26 January after the flag hoisting ceremony under the guidance of Shri Ram Sevak Dubey. The organization was named by Pt. Jitendra Kumar Jeetu Dubey.',
    'hi':
        '26 जनवरी 2014 को ध्वजारोहण के पश्चात श्री राम सेवक दुबे जी के मार्गदर्शन में विश्व हिंदू धर्म रक्षक सेवा समिति की स्थापना हुई। संस्था का नामकरण पं. जितेंद्र कुमार जीतू दुबे जी द्वारा किया गया।',
  }),
  Milestone('2019', {
    'en':
        'The organization was officially registered on 29 December 2019, strengthening its legal identity and expanding its social and religious service activities.',
    'hi':
        '29 दिसंबर 2019 को संस्था का आधिकारिक पंजीकरण हुआ, जिससे सामाजिक एवं धार्मिक सेवा कार्यों को संगठित रूप से आगे बढ़ाया गया।',
  }),
  Milestone('2020', {
    'en':
        'Expanded humanitarian activities including food distribution, blanket distribution, clothing support, medicine assistance, and relief services for the needy.',
    'hi':
        'गरीब एवं जरूरतमंद लोगों के लिए भोजन, कंबल, वस्त्र, दवा सहायता तथा राहत सेवा जैसे सामाजिक कार्यों का विस्तार किया गया।',
  }),
  Milestone('2022', {
    'en':
        'Strengthened organizational presence by establishing state-level teams and expanding service activities across multiple regions of India.',
    'hi':
        'राज्य स्तरीय टीमों का गठन कर भारत के विभिन्न क्षेत्रों में संगठन का विस्तार एवं सेवा गतिविधियों को मजबूत किया गया।',
  }),
  Milestone('2024', {
    'en':
        'Established the Karnataka State Head Office in Yelahanka, Bengaluru, while continuing to expand organizational branches in Uttar Pradesh, Bihar, Rajasthan, and Punjab.',
    'hi':
        'येलहंका, बेंगलुरु में कर्नाटक राज्य का मुख्य कार्यालय स्थापित करते हुए उत्तर प्रदेश, बिहार, राजस्थान एवं पंजाब सहित विभिन्न राज्यों में संगठन का विस्तार किया गया।',
  }),
  Milestone('2026', {
    'en':
        'The organization continues serving society through Hindu Dharma protection, temple and cow shelter preservation, disaster relief, education support, healthcare assistance, and welfare programs across multiple states.',
    'hi':
        'संस्था वर्तमान में अनेक राज्यों में हिंदू धर्म संरक्षण, मंदिर एवं गौशालाओं की रक्षा, आपदा राहत, शिक्षा सहायता, स्वास्थ्य सेवा तथा समाजसेवा के विभिन्न कार्य निरंतर कर रही है।',
  }),
];

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = Breakpoints.isMobile(width);
    final locale = Localizations.localeOf(context);
    final l10n = AppLocalizations.of(context)!;

    return PageScaffold(
      title: 'About Us | VHDRSS',
      description:
          "Learn about VHDRSS's mission, history, and the team delivering education, healthcare, and relief programs worldwide.",
      body: Column(
        children: [
          // --- Mission / Story ---
          ContentContainer(
            padding: EdgeInsets.symmetric(
                vertical: 100, horizontal: isMobile ? 20 : 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(l10n.aboutHeading,
                        style: Theme.of(context).textTheme.displayMedium)
                    .animate()
                    .fadeIn(duration: 400.ms),
                const SizedBox(height: 20),
                ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 760),
                  child: Text(
                    l10n.aboutStoryBody,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
                const SizedBox(height: 40),

                isMobile
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const _FounderImage(),
                          const SizedBox(height: 24),
                          _FounderTalkContent(language: locale.languageCode),
                        ],
                      )
                    : Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Expanded(
                            flex: 5,
                            child: _FounderImage(),
                          ),
                          const SizedBox(width: 48),
                          Expanded(
                            flex: 6,
                            child: _FounderTalkContent(
                                language: locale.languageCode),
                          ),
                        ],
                      ),

                const SizedBox(height: 40),
                // isMobile?
                Column(
                  children: [
                    _ValueCard(
                      icon: Icons.visibility,
                      title: l10n.ourVisionTitle,
                      body: l10n.ourVisionBody,
                    ),
                    const SizedBox(height: 20),
                    _ValueCard(
                      icon: Icons.flag,
                      title: l10n.ourMissionTitle,
                      body: l10n.ourMissionBody,
                    ),
                  ],
                )
                // : Row(
                //     crossAxisAlignment: CrossAxisAlignment.start,
                //     children: [
                //       Expanded(
                //         child: _ValueCard(
                //           icon: Icons.visibility,
                //           title: l10n.ourVisionTitle,
                //           body: l10n.ourVisionBody,
                //         ),
                //       ),
                //       const SizedBox(width: 24),
                //       Expanded(
                //         child: _ValueCard(
                //           icon: Icons.flag,
                //           title: l10n.ourMissionTitle,
                //           body: l10n.ourMissionBody,
                //         ),
                //       ),
                //     ],
                //   ),
              ],
            ),
          ),

          // --- Timeline ---
          Container(
            color: AppColors.surfaceMuted,
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 80),
            child: ContentContainer(
              child: Column(
                children: [
                  Text(l10n.ourJourneyHeading,
                      style: Theme.of(context).textTheme.displayMedium),
                  const SizedBox(height: 48),
                  for (int i = 0; i < kMilestones.length; i++)
                    _TimelineRow(
                      milestone: kMilestones[i],
                      isLast: i == kMilestones.length - 1,
                      locale: locale,
                    ).animate().fadeIn(delay: (i * 100).ms, duration: 400.ms),
                ],
              ),
            ),
          ),

          // --- Team ---
          // --- Team ---
          // ContentContainer(
          //   padding: const EdgeInsets.symmetric(vertical: 80),
          //   child: Column(
          //     children: [
          //       Text(l10n.meetTheTeamHeading,
          //           style: Theme.of(context).textTheme.displayMedium),
          //       const SizedBox(height: 48),

          //       // First Row (Scrolls horizontally)
          //       SingleChildScrollView(
          //         scrollDirection: Axis.horizontal,
          //         padding: const EdgeInsets.symmetric(horizontal: 24),
          //         child: Row(
          //           children: [
          //             // Sublist for the first half of the team
          //             for (final member
          //                 in kTeam.take((kTeam.length / 2).ceil()))
          //               Padding(
          //                 padding: const EdgeInsets.only(right: 24),
          //                 child: _TeamCard(member: member, l10n: l10n),
          //               ),
          //           ],
          //         ),
          //       ),

          //       const SizedBox(height: 24), // Vertical spacing between lines

          //       // Second Row (Scrolls horizontally)
          //       SingleChildScrollView(
          //         scrollDirection: Axis.horizontal,
          //         padding: const EdgeInsets.symmetric(horizontal: 24),
          //         child: Row(
          //           children: [
          //             // Sublist for the second half of the team
          //             for (final member
          //                 in kTeam.skip((kTeam.length / 2).ceil()))
          //               Padding(
          //                 padding: const EdgeInsets.only(right: 24),
          //                 child: _TeamCard(member: member, l10n: l10n),
          //               ),
          //           ],
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
          //===========================================================================
          ContentContainer(
            padding: const EdgeInsets.symmetric(vertical: 80),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    l10n.meetTheTeamHeading,
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                ),
                const SizedBox(height: 48),

                // 1. Core Executive Team (From your previous step)
                TeamSectionGroup(
                    title: "Core Leadership", members: kTeam, l10n: l10n),

                // 2. Additional National Advisors
                TeamSectionGroup(
                    title: l10n.sectionNationalAdvisors,
                    members: kAdditionalAdvisors,
                    l10n: l10n),

                // 3. Women's Cell Bangalore
                TeamSectionGroup(
                    title: l10n.sectionWomenCell,
                    members: kWomensCellTeam,
                    l10n: l10n),

                // 4. Karnataka State & Zones
                TeamSectionGroup(
                    title: l10n.sectionKarnataka,
                    members: kKarnatakaTeam,
                    l10n: l10n),

                // 5. Uttar Pradesh Chapter
                TeamSectionGroup(
                    title: l10n.sectionUttarPradesh,
                    members: kUttarPradeshTeam,
                    l10n: l10n),
              ],
            ),
          ),

          //==============================================================================

          // --- Annual reports ---
          Container(
            color: AppColors.surfaceMuted,
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 60),
            child: ContentContainer(
              child: Column(
                children: [
                  Text(l10n.transparencyHeading,
                      style: Theme.of(context).textTheme.headlineMedium),
                  const SizedBox(height: 12),
                  Text(
                    l10n.transparencyBody,
                    style: Theme.of(context).textTheme.bodyMedium,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 24),
                  OutlinedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.download, size: 18),
                    label: Text(l10n.downloadReportCta),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ValueCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String body;
  const _ValueCard(
      {required this.icon, required this.title, required this.body});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.surfaceMuted,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: AppColors.primary, size: 28),
          const SizedBox(height: 12),
          Text(title, style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 8),
          Text(body, style: Theme.of(context).textTheme.bodyMedium),
        ],
      ),
    );
  }
}

class _TimelineRow extends StatelessWidget {
  final Milestone milestone;
  final bool isLast;
  final Locale locale;
  const _TimelineRow(
      {required this.milestone, required this.isLast, required this.locale});

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 70,
            child: Text(milestone.year,
                style: const TextStyle(
                    fontWeight: FontWeight.w700, color: AppColors.primary)),
          ),
          Column(
            children: [
              Container(
                width: 14,
                height: 14,
                decoration: const BoxDecoration(
                    color: AppColors.primary, shape: BoxShape.circle),
              ),
              if (!isLast)
                Expanded(child: Container(width: 2, color: AppColors.divider)),
            ],
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 32),
              child: Text(milestone.description.resolve(locale),
                  style: Theme.of(context).textTheme.bodyMedium),
            ),
          ),
        ],
      ),
    );
  }
}

class _TeamCard extends StatelessWidget {
  final TeamMember member;
  final AppLocalizations l10n;

  const _TeamCard({required this.member, required this.l10n});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Your image widget here using member.image
        Container(
          width: 120,
          height: 120,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.amber,
            image: DecorationImage(
              image: AssetImage(member.image),
              fit: BoxFit.fill,
            ),
          ),
        ),
        Text(
          member.name(l10n), // Dynamically gets Hindi or English name
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(
          member.designation(l10n), // Dynamically gets Hindi or English role
          style: const TextStyle(color: Colors.grey),
        ),
      ],
    );
  }
}

class TeamSectionGroup extends StatelessWidget {
  final String title;
  final List<TeamMember> members;
  final AppLocalizations l10n;

  const TeamSectionGroup({
    super.key,
    required this.title,
    required this.members,
    required this.l10n,
  });

  @override
  Widget build(BuildContext context) {
    // final halfLength = (members.length / 2).ceil();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Text(
            title,
            style: Theme.of(context)
                .textTheme
                .headlineSmall
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        // First Horizontal Row
        ScrollConfiguration(
          behavior: ScrollConfiguration.of(context).copyWith(
            dragDevices: {
              PointerDeviceKind.touch,
              PointerDeviceKind.mouse,
              PointerDeviceKind.trackpad,
            },
          ),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              children: [
                for (final member in members)
                  //.take(halfLength)
                  Padding(
                    padding: const EdgeInsets.only(right: 24),
                    child: _TeamCard(member: member, l10n: l10n),
                  ),
              ],
            ),
          ),
        ),
        // const SizedBox(height: 24),
        // // Second Horizontal Row
        // SingleChildScrollView(
        //   scrollDirection: Axis.horizontal,
        //   padding: const EdgeInsets.symmetric(horizontal: 24),
        //   child: Row(
        //     children: [
        //       for (final member in members.skip(halfLength))
        //         Padding(
        //           padding: const EdgeInsets.only(right: 24),
        //           child: _TeamCard(member: member, l10n: l10n),
        //         ),
        //     ],
        //   ),
        // ),
        const SizedBox(height: 48),
      ],
    );
  }
}

class _FounderImage extends StatelessWidget {
  const _FounderImage();

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 4 / 5,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.asset(
          'assets/team/founder.jpg',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _FounderTalkContent extends StatelessWidget {
  const _FounderTalkContent({
    required this.language,
  });

  final String language;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          kFounderTalk['title']![language]!,
          style: Theme.of(context).textTheme.labelLarge?.copyWith(
                color: Colors.blue,
                fontWeight: FontWeight.w700,
                letterSpacing: 1.2,
              ),
        ),
        const SizedBox(height: 12),
        Text(
          kFounderTalk['heading']![language]!,
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.w800,
                height: 1.15,
              ),
        ),
        const SizedBox(height: 20),
        Text(
          kFounderTalk['message']![language]!,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: Colors.black87,
                height: 1.7,
              ),
        ),
        const SizedBox(height: 24),
        Text(
          kFounderTalk['name']![language]!,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          kFounderTalk['designation']![language]!,
          style: TextStyle(
            color: Colors.grey.shade600,
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}
