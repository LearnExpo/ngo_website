import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_hi.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'generated/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('hi')
  ];

  /// No description provided for @name.
  ///
  /// In en, this message translates to:
  /// **'Vishwa Hindu \nDharamarakshak Seva Samithi'**
  String get name;

  /// No description provided for @navName.
  ///
  /// In en, this message translates to:
  /// **'Vishwa Hindu Dharamarakshak Seva Samithi'**
  String get navName;

  /// No description provided for @address.
  ///
  /// In en, this message translates to:
  /// **'Door No. 173, First Floor \nS.L.I.G., 15th Block, 5th Phase \nYelahanka New Town \nBengaluru, Karnataka – 560064 \nIndia'**
  String get address;

  /// No description provided for @tagLine.
  ///
  /// In en, this message translates to:
  /// **'Protection of Dharma • Service to the Nation • Welfare of Humanity'**
  String get tagLine;

  /// No description provided for @navHome.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get navHome;

  /// No description provided for @navAbout.
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get navAbout;

  /// No description provided for @navPrograms.
  ///
  /// In en, this message translates to:
  /// **'Programs'**
  String get navPrograms;

  /// No description provided for @navEvents.
  ///
  /// In en, this message translates to:
  /// **'Events'**
  String get navEvents;

  /// No description provided for @navGallery.
  ///
  /// In en, this message translates to:
  /// **'Gallery'**
  String get navGallery;

  /// No description provided for @navBlog.
  ///
  /// In en, this message translates to:
  /// **'Blog'**
  String get navBlog;

  /// No description provided for @navContact.
  ///
  /// In en, this message translates to:
  /// **'Contact'**
  String get navContact;

  /// No description provided for @navDonate.
  ///
  /// In en, this message translates to:
  /// **'Donate'**
  String get navDonate;

  /// No description provided for @languageLabel.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get languageLabel;

  /// No description provided for @heroBadge.
  ///
  /// In en, this message translates to:
  /// **'12,000+ lives impacted since 2014'**
  String get heroBadge;

  /// No description provided for @heroTitle.
  ///
  /// In en, this message translates to:
  /// **'Protecting Dharma,\nServing Humanity'**
  String get heroTitle;

  /// No description provided for @heroSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Dedicated to preserving Sanatan values through social service, education, healthcare, disaster relief, and compassionate support for those in need.'**
  String get heroSubtitle;

  /// No description provided for @heroDonateBtn.
  ///
  /// In en, this message translates to:
  /// **'Donate Now'**
  String get heroDonateBtn;

  /// No description provided for @heroProgramsBtn.
  ///
  /// In en, this message translates to:
  /// **'See Our Programs'**
  String get heroProgramsBtn;

  /// No description provided for @statLivesImpacted.
  ///
  /// In en, this message translates to:
  /// **'Lives Impacted'**
  String get statLivesImpacted;

  /// No description provided for @statProgramsDelivered.
  ///
  /// In en, this message translates to:
  /// **'Programs Delivered'**
  String get statProgramsDelivered;

  /// No description provided for @statCountriesReached.
  ///
  /// In en, this message translates to:
  /// **'State Reached'**
  String get statCountriesReached;

  /// No description provided for @statFundsRaised.
  ///
  /// In en, this message translates to:
  /// **'Funds Raised'**
  String get statFundsRaised;

  /// No description provided for @footerAboutBlurb.
  ///
  /// In en, this message translates to:
  /// **'Working alongside communities to deliver education, healthcare, and disaster relief where it\'s needed most.'**
  String get footerAboutBlurb;

  /// No description provided for @footerQuickLinks.
  ///
  /// In en, this message translates to:
  /// **'Quick Links'**
  String get footerQuickLinks;

  /// No description provided for @footerStayUpdated.
  ///
  /// In en, this message translates to:
  /// **'Stay Updated'**
  String get footerStayUpdated;

  /// No description provided for @footerNewsletterBody.
  ///
  /// In en, this message translates to:
  /// **'Get our latest news and impact stories.'**
  String get footerNewsletterBody;

  /// No description provided for @footerEmailHint.
  ///
  /// In en, this message translates to:
  /// **'Your email'**
  String get footerEmailHint;

  /// No description provided for @footerThanks.
  ///
  /// In en, this message translates to:
  /// **'Thanks for subscribing! 🎉'**
  String get footerThanks;

  /// No description provided for @footerCopyright.
  ///
  /// In en, this message translates to:
  /// **'All rights reserved.'**
  String get footerCopyright;

  /// No description provided for @programsHeading.
  ///
  /// In en, this message translates to:
  /// **'Our Programs'**
  String get programsHeading;

  /// No description provided for @programsSubheading.
  ///
  /// In en, this message translates to:
  /// **'Every program below is funded directly by donors and run with local partners on the ground. Tap any program to see full details.'**
  String get programsSubheading;

  /// No description provided for @allPrograms.
  ///
  /// In en, this message translates to:
  /// **'All Programs'**
  String get allPrograms;

  /// No description provided for @programNotFound.
  ///
  /// In en, this message translates to:
  /// **'Program not found'**
  String get programNotFound;

  /// No description provided for @percentFunded.
  ///
  /// In en, this message translates to:
  /// **'{percent}% funded'**
  String percentFunded(int percent);

  /// No description provided for @goalLabel.
  ///
  /// In en, this message translates to:
  /// **'Goal: {amount}'**
  String goalLabel(String amount);

  /// No description provided for @raisedLabel.
  ///
  /// In en, this message translates to:
  /// **'{amount} raised'**
  String raisedLabel(String amount);

  /// No description provided for @supportThisProgram.
  ///
  /// In en, this message translates to:
  /// **'Support This Program'**
  String get supportThisProgram;

  /// No description provided for @detailsCta.
  ///
  /// In en, this message translates to:
  /// **'Details'**
  String get detailsCta;

  /// No description provided for @blogHeading.
  ///
  /// In en, this message translates to:
  /// **'Blog & News'**
  String get blogHeading;

  /// No description provided for @blogSubheading.
  ///
  /// In en, this message translates to:
  /// **'Updates, milestones, and stories from our programs.'**
  String get blogSubheading;

  /// No description provided for @allPosts.
  ///
  /// In en, this message translates to:
  /// **'All Posts'**
  String get allPosts;

  /// No description provided for @postNotFound.
  ///
  /// In en, this message translates to:
  /// **'Post not found'**
  String get postNotFound;

  /// No description provided for @readCta.
  ///
  /// In en, this message translates to:
  /// **'Read'**
  String get readCta;

  /// No description provided for @byAuthorReadTime.
  ///
  /// In en, this message translates to:
  /// **'By {author} · {minutes} min read'**
  String byAuthorReadTime(String author, int minutes);

  /// No description provided for @blogDonateCta.
  ///
  /// In en, this message translates to:
  /// **'Want to support programs like this?'**
  String get blogDonateCta;

  /// No description provided for @aboutHeading.
  ///
  /// In en, this message translates to:
  /// **'Our Story'**
  String get aboutHeading;

  /// No description provided for @aboutStoryBody.
  ///
  /// In en, this message translates to:
  /// **'Vishwa Hindu Dharma Rakshak Seva Samiti was founded on 26 January 2014, following the national flag hoisting ceremony, with the vision of protecting Sanatan Dharma and serving society. On this historic occasion, the name of the organization was proposed by Pt. Jitendra Kumar \"Jeetu\" Dubey. To lay a strong foundation for the organization, he entrusted its establishment to his revered father, Late Shri Ram Sevak Dubey, under whose guidance and leadership the Samiti was formed. On 29 December 2019, the organization was officially registered, marking an important milestone that enabled it to expand its charitable and social service initiatives in a structured and organized manner. Today, Vishwa Hindu Dharma Rakshak Seva Samiti has established its presence across multiple Indian states. The organization\'s National Headquarters is located in Yelahanka, Bengaluru, Karnataka, from where its administrative and service activities are coordinated under the leadership of the National President, Pt. Jitendra Kumar \"Jeetu\" Dubey. With the dedicated efforts of its national, state, district, and local volunteers, the Samiti continues to expand its mission across Karnataka, Uttar Pradesh, Bihar, Rajasthan, and Punjab, with plans for further growth throughout India. In Karnataka, the organization actively serves across several districts of Bengaluru through district-level leadership. Its volunteers work tirelessly to support underprivileged families by providing educational assistance, medical support, disaster relief, humanitarian aid, and other community welfare initiatives. The journey of Vishwa Hindu Dharma Rakshak Seva Samiti is driven by a commitment to protecting Sanatan Dharma, serving humanity, preserving cultural values, and contributing to the nation\'s development through selfless service and collective responsibility.'**
  String get aboutStoryBody;

  /// No description provided for @ourVisionTitle.
  ///
  /// In en, this message translates to:
  /// **'Our Vision'**
  String get ourVisionTitle;

  /// No description provided for @ourVisionBody.
  ///
  /// In en, this message translates to:
  /// **'The core objective of our organization is the selfless service of Dharma, culture, and humanity. Our vision is to build a society where our heritage is protected, and no individual is deprived of their basic needs. It is our supreme duty to protect and promote the Hindu Dharma by organizing religious ceremonies (Pooja and Pratishtha) and maintaining the temples of our deities, Gaushalas (cow shelters), and traditional water bodies like Baolis (stepwells) and wells. Beyond cultural preservation, serving the poor, helpless, and underprivileged with utmost dedication is the primary goal of our committee and all its members. We are deeply committed to providing all possible support and financial assistance to underprivileged families who are unable to bear the marriage expenses of their daughters and sisters due to poverty. Recognizing our responsibility toward the future, the committee facilitates the education of underprivileged children who have a strong desire to study by arranging for their schooling and regularly distributing necessary stationery items. In the realm of healthcare, we strive to ensure that no poor individual is deprived of medical treatment by providing necessary medical assistance and medicines to those in need. Furthermore, in the event of any natural calamity or disaster anywhere in India, all our volunteers stand united to carry out extensive relief operations on the ground. Ultimately, organizing regular \'Narayan Seva\' to feed the hungry and conducting continuous drives for the distribution of blankets, clothes, and essential items to the needy remain an integral and regular part of our mission.'**
  String get ourVisionBody;

  /// No description provided for @ourMissionTitle.
  ///
  /// In en, this message translates to:
  /// **'Our Mission'**
  String get ourMissionTitle;

  /// No description provided for @ourMissionBody.
  ///
  /// In en, this message translates to:
  /// **'To build a society dedicated to the protection of Dharma, preservation of cultural heritage, and the progress of India, inspiring every individual to uphold the values of Sanatan Dharma, selfless service, unity, and national responsibility for a stronger and more prosperous nation.'**
  String get ourMissionBody;

  /// No description provided for @ourJourneyHeading.
  ///
  /// In en, this message translates to:
  /// **'Our Journey'**
  String get ourJourneyHeading;

  /// No description provided for @meetTheTeamHeading.
  ///
  /// In en, this message translates to:
  /// **'Meet the Team'**
  String get meetTheTeamHeading;

  /// No description provided for @transparencyHeading.
  ///
  /// In en, this message translates to:
  /// **'Transparency & Reports'**
  String get transparencyHeading;

  /// No description provided for @transparencyBody.
  ///
  /// In en, this message translates to:
  /// **'We publish an annual report every year detailing exactly how funds are used.'**
  String get transparencyBody;

  /// No description provided for @downloadReportCta.
  ///
  /// In en, this message translates to:
  /// **'Download 2025 Annual Report'**
  String get downloadReportCta;

  /// No description provided for @backToPrograms.
  ///
  /// In en, this message translates to:
  /// **'All Programs'**
  String get backToPrograms;

  /// No description provided for @founderName.
  ///
  /// In en, this message translates to:
  /// **'Shri Ram Sevak Dubey'**
  String get founderName;

  /// No description provided for @founderRole.
  ///
  /// In en, this message translates to:
  /// **'Chief Founder'**
  String get founderRole;

  /// No description provided for @presidentName.
  ///
  /// In en, this message translates to:
  /// **'Pt. Jitendra Kumar \"Jeetu\" Dubey'**
  String get presidentName;

  /// No description provided for @presidentRole.
  ///
  /// In en, this message translates to:
  /// **'National President'**
  String get presidentRole;

  /// No description provided for @womenPresidentName.
  ///
  /// In en, this message translates to:
  /// **'Smt. Sneha Lata Dubey'**
  String get womenPresidentName;

  /// No description provided for @womenPresidentRole.
  ///
  /// In en, this message translates to:
  /// **'Women\'s Cell National President'**
  String get womenPresidentRole;

  /// No description provided for @vicePresidentName.
  ///
  /// In en, this message translates to:
  /// **'Shri Krishnappa H.'**
  String get vicePresidentName;

  /// No description provided for @vicePresidentRole.
  ///
  /// In en, this message translates to:
  /// **'National Vice President'**
  String get vicePresidentRole;

  /// No description provided for @secretaryName.
  ///
  /// In en, this message translates to:
  /// **'Shri Anand Kumar Vishwakarma'**
  String get secretaryName;

  /// No description provided for @secretaryRole.
  ///
  /// In en, this message translates to:
  /// **'National Secretary'**
  String get secretaryRole;

  /// No description provided for @deputySecretaryName.
  ///
  /// In en, this message translates to:
  /// **'Shri Dilip Kumar Singh'**
  String get deputySecretaryName;

  /// No description provided for @deputySecretaryRole.
  ///
  /// In en, this message translates to:
  /// **'Deputy National Secretary'**
  String get deputySecretaryRole;

  /// No description provided for @treasurerName.
  ///
  /// In en, this message translates to:
  /// **'Shri Santosh Yadav'**
  String get treasurerName;

  /// No description provided for @treasurerRole.
  ///
  /// In en, this message translates to:
  /// **'National Treasurer'**
  String get treasurerRole;

  /// No description provided for @deputyTreasurerName.
  ///
  /// In en, this message translates to:
  /// **'Shri Vijay Kumar Sharma'**
  String get deputyTreasurerName;

  /// No description provided for @deputyTreasurerRole.
  ///
  /// In en, this message translates to:
  /// **'Deputy National Treasurer'**
  String get deputyTreasurerRole;

  /// No description provided for @chiefMentorName.
  ///
  /// In en, this message translates to:
  /// **'Shri Ram Bharosa Yadav'**
  String get chiefMentorName;

  /// No description provided for @chiefMentorRole.
  ///
  /// In en, this message translates to:
  /// **'Chief Advisor / Mentor'**
  String get chiefMentorRole;

  /// No description provided for @deputyChiefMentorName.
  ///
  /// In en, this message translates to:
  /// **'Shri Ranjit Kumar Rai'**
  String get deputyChiefMentorName;

  /// No description provided for @deputyChiefMentorRole.
  ///
  /// In en, this message translates to:
  /// **'Deputy Chief Advisor / Mentor'**
  String get deputyChiefMentorRole;

  /// No description provided for @nationalAdvisorName.
  ///
  /// In en, this message translates to:
  /// **'Shri Abhishek Brahmarshi'**
  String get nationalAdvisorName;

  /// No description provided for @nationalAdvisorRole.
  ///
  /// In en, this message translates to:
  /// **'National Consultant / Advisor'**
  String get nationalAdvisorRole;

  /// No description provided for @deputyNationalAdvisorName.
  ///
  /// In en, this message translates to:
  /// **'Shri Ajay Kumar Pandey'**
  String get deputyNationalAdvisorName;

  /// No description provided for @deputyNationalAdvisorRole.
  ///
  /// In en, this message translates to:
  /// **'Deputy National Consultant / Advisor'**
  String get deputyNationalAdvisorRole;

  /// No description provided for @sectionNationalAdvisors.
  ///
  /// In en, this message translates to:
  /// **'Additional National Advisors'**
  String get sectionNationalAdvisors;

  /// No description provided for @sectionWomenCell.
  ///
  /// In en, this message translates to:
  /// **'Bangalore Women\'s Cell'**
  String get sectionWomenCell;

  /// No description provided for @sectionKarnataka.
  ///
  /// In en, this message translates to:
  /// **'Karnataka State & Zone Team'**
  String get sectionKarnataka;

  /// No description provided for @sectionUttarPradesh.
  ///
  /// In en, this message translates to:
  /// **'Uttar Pradesh Chapter'**
  String get sectionUttarPradesh;

  /// No description provided for @advisorAjayName.
  ///
  /// In en, this message translates to:
  /// **'Shri Ajay Kumar Pandey'**
  String get advisorAjayName;

  /// No description provided for @advisorPankajName.
  ///
  /// In en, this message translates to:
  /// **'Shri Pankaj Mahto'**
  String get advisorPankajName;

  /// No description provided for @advisorDineshName.
  ///
  /// In en, this message translates to:
  /// **'Shri Dinesh Kumar Rai'**
  String get advisorDineshName;

  /// No description provided for @advisorNaginaName.
  ///
  /// In en, this message translates to:
  /// **'Shri Nagina Verma'**
  String get advisorNaginaName;

  /// No description provided for @advisorBaljitName.
  ///
  /// In en, this message translates to:
  /// **'Shri Baljit Singh'**
  String get advisorBaljitName;

  /// No description provided for @advisorDharmendraName.
  ///
  /// In en, this message translates to:
  /// **'Shri Dharmendra Yadav'**
  String get advisorDharmendraName;

  /// No description provided for @advisorSureshName.
  ///
  /// In en, this message translates to:
  /// **'Shri Suresh Jain'**
  String get advisorSureshName;

  /// No description provided for @advisorNeerajName.
  ///
  /// In en, this message translates to:
  /// **'Shri Neeraj Kumar Yadav'**
  String get advisorNeerajName;

  /// No description provided for @advisorAnantName.
  ///
  /// In en, this message translates to:
  /// **'Shri Anant Singh'**
  String get advisorAnantName;

  /// No description provided for @advisorRamjitName.
  ///
  /// In en, this message translates to:
  /// **'Shri Ramjit Saroj'**
  String get advisorRamjitName;

  /// No description provided for @advisorRupeshName.
  ///
  /// In en, this message translates to:
  /// **'Shri Rupesh Prasad'**
  String get advisorRupeshName;

  /// No description provided for @advisorRajuName.
  ///
  /// In en, this message translates to:
  /// **'Shri Raju Rana'**
  String get advisorRajuName;

  /// No description provided for @advisorKunalName.
  ///
  /// In en, this message translates to:
  /// **'Shri Kunal Kumar Singh'**
  String get advisorKunalName;

  /// No description provided for @generalAdvisorRole.
  ///
  /// In en, this message translates to:
  /// **'Deputy National Advisor'**
  String get generalAdvisorRole;

  /// No description provided for @womenVPName.
  ///
  /// In en, this message translates to:
  /// **'Smt. Neha Sharma'**
  String get womenVPName;

  /// No description provided for @womenVPRole.
  ///
  /// In en, this message translates to:
  /// **'National Women\'s Cell Vice President'**
  String get womenVPRole;

  /// No description provided for @supervisorUrmilaName.
  ///
  /// In en, this message translates to:
  /// **'Smt. Urmila Devi'**
  String get supervisorUrmilaName;

  /// No description provided for @supervisorRole.
  ///
  /// In en, this message translates to:
  /// **'Women\'s Cell Supervisor'**
  String get supervisorRole;

  /// No description provided for @secShaunaName.
  ///
  /// In en, this message translates to:
  /// **'Smt. Shauna Devi'**
  String get secShaunaName;

  /// No description provided for @secRole.
  ///
  /// In en, this message translates to:
  /// **'Women\'s Cell Secretary'**
  String get secRole;

  /// No description provided for @distPresRaginiName.
  ///
  /// In en, this message translates to:
  /// **'Smt. Ragini Jha'**
  String get distPresRaginiName;

  /// No description provided for @distPresRole.
  ///
  /// In en, this message translates to:
  /// **'Women\'s Cell District President'**
  String get distPresRole;

  /// No description provided for @supervisorSandhyaName.
  ///
  /// In en, this message translates to:
  /// **'Smt. Sandhya Devi'**
  String get supervisorSandhyaName;

  /// No description provided for @organizerShivaniName.
  ///
  /// In en, this message translates to:
  /// **'Kumari Shivani Nishad'**
  String get organizerShivaniName;

  /// No description provided for @organizerRole.
  ///
  /// In en, this message translates to:
  /// **'Women\'s Cell Organizer'**
  String get organizerRole;

  /// No description provided for @memberReenaName.
  ///
  /// In en, this message translates to:
  /// **'Smt. Reena Devi'**
  String get memberReenaName;

  /// No description provided for @memberRekhaName.
  ///
  /// In en, this message translates to:
  /// **'Smt. Rekha Devi'**
  String get memberRekhaName;

  /// No description provided for @memberPramilaName.
  ///
  /// In en, this message translates to:
  /// **'Smt. Pramila Devi'**
  String get memberPramilaName;

  /// No description provided for @advisorReenaName.
  ///
  /// In en, this message translates to:
  /// **'Smt. Reena Devi'**
  String get advisorReenaName;

  /// No description provided for @advisorRole.
  ///
  /// In en, this message translates to:
  /// **'Women\'s Cell Advisor'**
  String get advisorRole;

  /// No description provided for @memberSanyuktName.
  ///
  /// In en, this message translates to:
  /// **'Smt. Sanyukt Devi'**
  String get memberSanyuktName;

  /// No description provided for @memberSushmitaName.
  ///
  /// In en, this message translates to:
  /// **'Smt. Sushmita Patra'**
  String get memberSushmitaName;

  /// No description provided for @memberPoojaName.
  ///
  /// In en, this message translates to:
  /// **'Smt. Pooja Devi'**
  String get memberPoojaName;

  /// No description provided for @memberRole.
  ///
  /// In en, this message translates to:
  /// **'Women\'s Cell Member'**
  String get memberRole;

  /// No description provided for @karnatakaPresName.
  ///
  /// In en, this message translates to:
  /// **'Shri Mithlesh Tripathi'**
  String get karnatakaPresName;

  /// No description provided for @karnatakaPresRole.
  ///
  /// In en, this message translates to:
  /// **'Karnataka State President'**
  String get karnatakaPresRole;

  /// No description provided for @karnatakaVP1Name.
  ///
  /// In en, this message translates to:
  /// **'Shri Brijesh Kushwaha'**
  String get karnatakaVP1Name;

  /// No description provided for @karnatakaVP2Name.
  ///
  /// In en, this message translates to:
  /// **'Shri Mangal Choubey'**
  String get karnatakaVP2Name;

  /// No description provided for @karnatakaVPRole.
  ///
  /// In en, this message translates to:
  /// **'Karnataka State Vice President'**
  String get karnatakaVPRole;

  /// No description provided for @zoneSouthName.
  ///
  /// In en, this message translates to:
  /// **'Shri Vijay Shankar Mishra'**
  String get zoneSouthName;

  /// No description provided for @zoneSouthRole.
  ///
  /// In en, this message translates to:
  /// **'South Zone President (Bangalore)'**
  String get zoneSouthRole;

  /// No description provided for @zoneNorthName.
  ///
  /// In en, this message translates to:
  /// **'Shri Anjani Kumar Mishra'**
  String get zoneNorthName;

  /// No description provided for @zoneNorthRole.
  ///
  /// In en, this message translates to:
  /// **'North Zone President (Bangalore)'**
  String get zoneNorthRole;

  /// No description provided for @zoneEastName.
  ///
  /// In en, this message translates to:
  /// **'Shri Shailesh Lahoti'**
  String get zoneEastName;

  /// No description provided for @zoneEastRole.
  ///
  /// In en, this message translates to:
  /// **'East Zone President (Bangalore)'**
  String get zoneEastRole;

  /// No description provided for @zoneCentralName.
  ///
  /// In en, this message translates to:
  /// **'Shri Bechan Prajapati'**
  String get zoneCentralName;

  /// No description provided for @zoneCentralRole.
  ///
  /// In en, this message translates to:
  /// **'Central Zone President (Bangalore)'**
  String get zoneCentralRole;

  /// No description provided for @upPresName.
  ///
  /// In en, this message translates to:
  /// **'Shri Shailendra Dwivedi'**
  String get upPresName;

  /// No description provided for @upPresRole.
  ///
  /// In en, this message translates to:
  /// **'Uttar Pradesh State President'**
  String get upPresRole;

  /// No description provided for @upAzamgarhName.
  ///
  /// In en, this message translates to:
  /// **'Shri Pankaj Mishra'**
  String get upAzamgarhName;

  /// No description provided for @upAzamgarhRole.
  ///
  /// In en, this message translates to:
  /// **'Azamgarh District President'**
  String get upAzamgarhRole;

  /// No description provided for @upPrayagrajName.
  ///
  /// In en, this message translates to:
  /// **'Shri Neeraj Mishra'**
  String get upPrayagrajName;

  /// No description provided for @upPrayagrajRole.
  ///
  /// In en, this message translates to:
  /// **'Prayagraj District President'**
  String get upPrayagrajRole;

  /// No description provided for @upGondaName.
  ///
  /// In en, this message translates to:
  /// **'Shri Naveen Yadav'**
  String get upGondaName;

  /// No description provided for @upGondaRole.
  ///
  /// In en, this message translates to:
  /// **'Gonda District President'**
  String get upGondaRole;

  /// No description provided for @upMauName.
  ///
  /// In en, this message translates to:
  /// **'Shri Ram Pratap Singh'**
  String get upMauName;

  /// No description provided for @upMauRole.
  ///
  /// In en, this message translates to:
  /// **'Mau District President'**
  String get upMauRole;

  /// No description provided for @featuredProgramsHeading.
  ///
  /// In en, this message translates to:
  /// **'Our Programs'**
  String get featuredProgramsHeading;

  /// No description provided for @featuredProgramsSubheading.
  ///
  /// In en, this message translates to:
  /// **'Every donation and volunteer hour goes directly into one of these initiatives.'**
  String get featuredProgramsSubheading;

  /// No description provided for @viewAllPrograms.
  ///
  /// In en, this message translates to:
  /// **'View All Programs'**
  String get viewAllPrograms;

  /// No description provided for @testimonialsHeading.
  ///
  /// In en, this message translates to:
  /// **'Voices From Our Community'**
  String get testimonialsHeading;

  /// No description provided for @ctaHeading.
  ///
  /// In en, this message translates to:
  /// **'Ready to Make a Difference?'**
  String get ctaHeading;

  /// No description provided for @ctaBody.
  ///
  /// In en, this message translates to:
  /// **'Whether it\'s a one-time gift or your time as a volunteer, every contribution moves us closer to the communities that need it.'**
  String get ctaBody;

  /// No description provided for @ctaVolunteerBtn.
  ///
  /// In en, this message translates to:
  /// **'Become a Volunteer'**
  String get ctaVolunteerBtn;

  /// No description provided for @fpDharmaTitle.
  ///
  /// In en, this message translates to:
  /// **'Dharma & Temple Protection'**
  String get fpDharmaTitle;

  /// No description provided for @fpDharmaDesc.
  ///
  /// In en, this message translates to:
  /// **'Protecting Hindu temples, Gaushalas, and preserving Sanatan religious heritage. We work to safeguard sacred places, promote cultural values, and encourage community participation in preserving our spiritual traditions.'**
  String get fpDharmaDesc;

  /// No description provided for @fpNarayanTitle.
  ///
  /// In en, this message translates to:
  /// **'Narayan Seva'**
  String get fpNarayanTitle;

  /// No description provided for @fpNarayanDesc.
  ///
  /// In en, this message translates to:
  /// **'Serving poor and needy families through food distribution, clothing, blankets, and essential support. Our volunteers are committed to extending compassion, dignity, and timely assistance to those facing hardship.'**
  String get fpNarayanDesc;

  /// No description provided for @fpEducationTitle.
  ///
  /// In en, this message translates to:
  /// **'Education Support'**
  String get fpEducationTitle;

  /// No description provided for @fpEducationDesc.
  ///
  /// In en, this message translates to:
  /// **'Helping children from economically weaker families continue their education by providing study materials and educational assistance. We believe every child deserves the opportunity to learn, grow, and build a brighter future.'**
  String get fpEducationDesc;

  /// No description provided for @testimonial1Quote.
  ///
  /// In en, this message translates to:
  /// **'The Samiti stood by our family during a difficult time by providing food, clothing, and essential support. Their kindness gave us hope when we needed it most.'**
  String get testimonial1Quote;

  /// No description provided for @testimonial1Role.
  ///
  /// In en, this message translates to:
  /// **'Community Beneficiary'**
  String get testimonial1Role;

  /// No description provided for @testimonial2Quote.
  ///
  /// In en, this message translates to:
  /// **'Being a volunteer with the Samiti has been a meaningful journey. Serving people with dedication and working together for society has been a truly rewarding experience.'**
  String get testimonial2Quote;

  /// No description provided for @testimonial2Role.
  ///
  /// In en, this message translates to:
  /// **'Volunteer'**
  String get testimonial2Role;

  /// No description provided for @testimonial3Quote.
  ///
  /// In en, this message translates to:
  /// **'The Samiti\'s commitment to preserving our cultural values while serving humanity is truly inspiring. Their efforts make a positive difference in the lives of many families.'**
  String get testimonial3Quote;

  /// No description provided for @testimonial3Role.
  ///
  /// In en, this message translates to:
  /// **'Community Supporter'**
  String get testimonial3Role;

  /// No description provided for @eventsHeading.
  ///
  /// In en, this message translates to:
  /// **'Events'**
  String get eventsHeading;

  /// No description provided for @eventsSubheading.
  ///
  /// In en, this message translates to:
  /// **'Join us in person or online.'**
  String get eventsSubheading;

  /// No description provided for @upcomingEvents.
  ///
  /// In en, this message translates to:
  /// **'Upcoming'**
  String get upcomingEvents;

  /// No description provided for @pastEvents.
  ///
  /// In en, this message translates to:
  /// **'Past Events'**
  String get pastEvents;

  /// No description provided for @rsvpCta.
  ///
  /// In en, this message translates to:
  /// **'RSVP'**
  String get rsvpCta;

  /// No description provided for @galleryHeading.
  ///
  /// In en, this message translates to:
  /// **'Gallery'**
  String get galleryHeading;

  /// No description provided for @gallerySubheading.
  ///
  /// In en, this message translates to:
  /// **'Moments from our programs around the world.'**
  String get gallerySubheading;

  /// No description provided for @rsvpDialogTitle.
  ///
  /// In en, this message translates to:
  /// **'RSVP for {eventTitle}'**
  String rsvpDialogTitle(String eventTitle);

  /// No description provided for @rsvpNameLabel.
  ///
  /// In en, this message translates to:
  /// **'Full name'**
  String get rsvpNameLabel;

  /// No description provided for @rsvpEmailLabel.
  ///
  /// In en, this message translates to:
  /// **'Email address'**
  String get rsvpEmailLabel;

  /// No description provided for @rsvpConfirmBtn.
  ///
  /// In en, this message translates to:
  /// **'Confirm RSVP'**
  String get rsvpConfirmBtn;

  /// No description provided for @rsvpCancelBtn.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get rsvpCancelBtn;

  /// No description provided for @rsvpConfirmedLabel.
  ///
  /// In en, this message translates to:
  /// **'You\'re Registered'**
  String get rsvpConfirmedLabel;

  /// No description provided for @rsvpSuccessSnackbar.
  ///
  /// In en, this message translates to:
  /// **'RSVP confirmed! See you there.'**
  String get rsvpSuccessSnackbar;

  /// No description provided for @contactUs.
  ///
  /// In en, this message translates to:
  /// **'Contact Us'**
  String get contactUs;

  /// No description provided for @contactUsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'We\'d love to hear from you.'**
  String get contactUsSubtitle;

  /// No description provided for @fullName.
  ///
  /// In en, this message translates to:
  /// **'Full name'**
  String get fullName;

  /// No description provided for @emailAddress.
  ///
  /// In en, this message translates to:
  /// **'Email address'**
  String get emailAddress;

  /// No description provided for @subject.
  ///
  /// In en, this message translates to:
  /// **'Subject'**
  String get subject;

  /// No description provided for @message.
  ///
  /// In en, this message translates to:
  /// **'Message'**
  String get message;

  /// No description provided for @pleaseEnterName.
  ///
  /// In en, this message translates to:
  /// **'Please enter your name'**
  String get pleaseEnterName;

  /// No description provided for @pleaseEnterEmail.
  ///
  /// In en, this message translates to:
  /// **'Please enter your email'**
  String get pleaseEnterEmail;

  /// No description provided for @pleaseEnterValidEmail.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid email'**
  String get pleaseEnterValidEmail;

  /// No description provided for @pleaseEnterSubject.
  ///
  /// In en, this message translates to:
  /// **'Please enter a subject'**
  String get pleaseEnterSubject;

  /// No description provided for @pleaseEnterMessage.
  ///
  /// In en, this message translates to:
  /// **'Please enter a message'**
  String get pleaseEnterMessage;

  /// No description provided for @sendMessage.
  ///
  /// In en, this message translates to:
  /// **'Send Message'**
  String get sendMessage;

  /// No description provided for @messageSent.
  ///
  /// In en, this message translates to:
  /// **'Message Sent'**
  String get messageSent;

  /// No description provided for @messageSentDescription.
  ///
  /// In en, this message translates to:
  /// **'Thanks for reaching out, {name}. Our team would normally reply within 1-2 business days.'**
  String messageSentDescription(String name);
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'hi'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'hi':
      return AppLocalizationsHi();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
