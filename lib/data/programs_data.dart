import 'package:flutter/material.dart';
import 'models/program.dart';

const List<Program> allPrograms = [
  Program(
    id: 'dharma-protection',
    title: {
      'en': 'Dharma & Temple Protection',
      'hi': 'धर्म एवं मंदिर संरक्षण',
    },
    shortDescription: {
      'en':
          'Protecting Hindu temples, Gaushalas, and preserving Sanatan religious heritage.',
      'hi': 'हिंदू मंदिरों, गौशालाओं एवं सनातन धार्मिक धरोहरों का संरक्षण।',
    },
    longDescription: {
      'en':
          'The Samiti is dedicated to protecting Hindu temples, Gaushalas, sacred wells, and preserving Sanatan traditions. Through community participation, it works to safeguard religious heritage and promote cultural values for future generations.',
      'hi':
          'समिति हिंदू मंदिरों, गौशालाओं, पवित्र कुओं एवं सनातन संस्कृति के संरक्षण के लिए समर्पित है। समाज की सहभागिता के माध्यम से धार्मिक धरोहरों की रक्षा तथा सांस्कृतिक मूल्यों के संवर्धन का कार्य करती है।',
    },
    category: {
      'en': 'Dharma Protection',
      'hi': 'धर्म संरक्षण',
    },
    icon: Icons.temple_hindu,
    progress: 0.0,
    goalAmount: '-',
    raisedAmount: '-',
    imageUrl: 'assets/images/dharmSeva.jpg',
  ),
  Program(
    id: 'narayan-seva',
    title: {
      'en': 'Narayan Seva',
      'hi': 'नारायण सेवा',
    },
    shortDescription: {
      'en':
          'Serving poor and needy families through food, clothing, blankets, and humanitarian support.',
      'hi':
          'गरीब एवं जरूरतमंद परिवारों को भोजन, वस्त्र, कंबल एवं आवश्यक सहायता प्रदान करना।',
    },
    longDescription: {
      'en':
          'Narayan Seva is one of the Samiti\'s core initiatives. Volunteers regularly organize food distribution, blanket distribution, clothing distribution, and humanitarian assistance to support economically weaker sections of society.',
      'hi':
          'नारायण सेवा समिति की प्रमुख सेवा गतिविधियों में से एक है। इसके अंतर्गत भोजन वितरण, कंबल वितरण, वस्त्र वितरण एवं अन्य मानवीय सहायता कार्यक्रम नियमित रूप से आयोजित किए जाते हैं।',
    },
    category: {
      'en': 'Social Service',
      'hi': 'समाज सेवा',
    },
    icon: Icons.volunteer_activism,
    progress: 0.0,
    goalAmount: '-',
    raisedAmount: '-',
    imageUrl: 'assets/images/narayanSeva.jpg',
  ),
  Program(
    id: 'education-support',
    title: {
      'en': 'Education Support',
      'hi': 'शिक्षा सहायता',
    },
    shortDescription: {
      'en':
          'Helping children from underprivileged families continue their education.',
      'hi': 'आर्थिक रूप से कमजोर बच्चों की शिक्षा में सहयोग।',
    },
    longDescription: {
      'en':
          'The Samiti supports children whose families cannot afford education by providing notebooks, pens, pencils, educational materials, and assistance whenever possible so that every child has an opportunity to learn.',
      'hi':
          'समिति आर्थिक रूप से कमजोर परिवारों के बच्चों को कॉपी, पेन, पेंसिल तथा अन्य शैक्षणिक सामग्री उपलब्ध कराने का प्रयास करती है ताकि प्रत्येक बच्चा शिक्षा प्राप्त कर सके।',
    },
    category: {
      'en': 'Education',
      'hi': 'शिक्षा',
    },
    icon: Icons.school,
    progress: 0.0,
    goalAmount: '-',
    raisedAmount: '-',
    imageUrl: 'assets/images/education.jpg',
  ),
  Program(
    id: 'medical-assistance',
    title: {
      'en': 'Medical Assistance',
      'hi': 'चिकित्सा सहायता',
    },
    shortDescription: {
      'en':
          'Providing medicines, wheelchairs, and healthcare assistance to needy people.',
      'hi':
          'जरूरतमंद लोगों को दवा, व्हीलचेयर एवं स्वास्थ्य सहायता प्रदान करना।',
    },
    longDescription: {
      'en':
          'The Samiti extends medical assistance to financially weaker individuals by helping them obtain medicines, wheelchairs, and other essential healthcare support whenever possible.',
      'hi':
          'समिति आर्थिक रूप से कमजोर लोगों को दवा, व्हीलचेयर तथा अन्य आवश्यक चिकित्सा सहायता उपलब्ध कराने का प्रयास करती है।',
    },
    category: {
      'en': 'Healthcare',
      'hi': 'स्वास्थ्य सेवा',
    },
    icon: Icons.health_and_safety,
    progress: 0.0,
    goalAmount: '-',
    raisedAmount: '-',
    imageUrl: 'assets/images/health.jpg',
  ),
  Program(
    id: 'family-support',
    title: {
      'en': 'Family & Child Welfare',
      'hi': 'परिवार एवं बाल कल्याण',
    },
    shortDescription: {
      'en': 'Supporting orphan children and economically weaker families.',
      'hi': 'अनाथ बच्चों एवं आर्थिक रूप से कमजोर परिवारों की सहायता।',
    },
    longDescription: {
      'en':
          'The Samiti provides food, clothing, and essential support for orphan children. It also assists financially weaker families in arranging the marriage of daughters and meeting other essential family needs whenever possible.',
      'hi':
          'समिति अनाथ बच्चों के लिए भोजन, वस्त्र एवं आवश्यक सहायता उपलब्ध कराती है। साथ ही आर्थिक रूप से कमजोर परिवारों की बेटियों के विवाह एवं अन्य आवश्यक जरूरतों में यथासंभव सहयोग करती है।',
    },
    category: {
      'en': 'Community Welfare',
      'hi': 'जनकल्याण',
    },
    icon: Icons.family_restroom,
    progress: 0.0,
    goalAmount: '-',
    raisedAmount: '-',
    imageUrl: 'assets/images/family.jpg',
  ),
  Program(
    id: 'disaster-relief',
    title: {
      'en': 'Disaster Relief',
      'hi': 'आपदा राहत सेवा',
    },
    shortDescription: {
      'en':
          'Providing emergency relief and humanitarian assistance during natural disasters.',
      'hi': 'प्राकृतिक आपदाओं के समय राहत एवं मानवीय सहायता प्रदान करना।',
    },
    longDescription: {
      'en':
          "Whenever natural disasters occur anywhere in India, the Samiti's volunteers unite to provide relief materials, food, clothing, and humanitarian assistance to affected communities with dedication and compassion.",
      'hi':
          'भारत में कहीं भी प्राकृतिक आपदा आने पर समिति के कार्यकर्ता एकजुट होकर राहत सामग्री, भोजन, वस्त्र एवं अन्य आवश्यक सहायता प्रदान करते हैं।',
    },
    category: {
      'en': 'Emergency Relief',
      'hi': 'आपदा राहत',
    },
    icon: Icons.emergency_share,
    progress: 0.0,
    goalAmount: '-',
    raisedAmount: '-',
    imageUrl: 'assets/images/disaster.jpg',
  ),
];

Program? findProgramById(String id) {
  for (final p in allPrograms) {
    if (p.id == id) return p;
  }
  return null;
}
