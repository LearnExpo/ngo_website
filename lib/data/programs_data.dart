import 'package:flutter/material.dart';
import 'models/program.dart';

const List<Program> allPrograms = [
  Program(
    id: 'education-access',
    title: 'Education Access',
    shortDescription:
        'Building classrooms and supplying learning materials for children in underserved regions.',
    longDescription:
        'Our Education Access program partners with local communities to build classrooms, '
        'train teachers, and distribute books and learning materials. Since 2018 we\'ve opened '
        '14 schools and supported over 3,000 students across 6 countries. We focus on regions '
        'where the nearest school is more than a day\'s walk away, and work with local '
        'governments to ensure long-term sustainability once we hand off operations.',
    icon: Icons.school,
    progress: 0.72,
    goalAmount: '\$180,000',
    raisedAmount: '\$129,600',
    category: 'Education',
  ),
  Program(
    id: 'healthcare-outreach',
    title: 'Healthcare Outreach',
    shortDescription:
        'Mobile clinics and essential medicine delivery to remote communities.',
    longDescription:
        'Mobile medical units travel to communities with no permanent healthcare access, '
        'providing checkups, vaccinations, maternal care, and essential medicine. Each unit '
        'is staffed by a rotating team of volunteer doctors and local health workers, reaching '
        'roughly 40 villages a year.',
    icon: Icons.health_and_safety,
    progress: 0.58,
    goalAmount: '\$220,000',
    raisedAmount: '\$127,600',
    category: 'Healthcare',
  ),
  Program(
    id: 'disaster-relief',
    title: 'Disaster Relief',
    shortDescription:
        'Rapid-response emergency aid — food, water, and shelter after crises.',
    longDescription:
        'When disaster strikes, our rapid-response teams deploy within 48 hours with food, '
        'clean water, and emergency shelter kits. We maintain pre-positioned supply caches in '
        '5 regions specifically so response time stays fast when it matters most.',
    icon: Icons.emergency_share,
    progress: 0.85,
    goalAmount: '\$300,000',
    raisedAmount: '\$255,000',
    category: 'Emergency',
  ),
  Program(
    id: 'clean-water',
    title: 'Clean Water Initiative',
    shortDescription:
        'Drilling wells and installing filtration systems in water-scarce regions.',
    longDescription:
        'Access to clean water reduces disease and frees up hours in the day, especially for '
        'women and children who often walk miles to collect water. We\'ve drilled 62 wells and '
        'installed community filtration systems serving over 45,000 people.',
    icon: Icons.water_drop,
    progress: 0.63,
    goalAmount: '\$150,000',
    raisedAmount: '\$94,500',
    category: 'Infrastructure',
  ),
  Program(
    id: 'womens-empowerment',
    title: "Women's Empowerment",
    shortDescription:
        'Vocational training and microloans for women entrepreneurs.',
    longDescription:
        'This program provides vocational training, small-business mentorship, and microloans '
        'to women in the communities we serve, helping them build sustainable income sources '
        'and financial independence.',
    icon: Icons.diversity_1,
    progress: 0.41,
    goalAmount: '\$90,000',
    raisedAmount: '\$36,900',
    category: 'Economic',
  ),
  Program(
    id: 'child-nutrition',
    title: 'Child Nutrition',
    shortDescription:
        'School feeding programs to fight childhood malnutrition.',
    longDescription:
        'Daily nutritious meals at partner schools improve both health outcomes and school '
        'attendance. The program currently feeds over 8,000 children each school day.',
    icon: Icons.restaurant,
    progress: 0.77,
    goalAmount: '\$130,000',
    raisedAmount: '\$100,100',
    category: 'Health',
  ),
];

Program? findProgramById(String id) {
  for (final p in allPrograms) {
    if (p.id == id) return p;
  }
  return null;
}