import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../constants/styles/app_colors.dart';
import '../../../../constants/styles/text_style.dart';

class ArtistAvailability extends StatefulWidget {
  const ArtistAvailability({super.key});

  @override
  State<ArtistAvailability> createState() => _ArtistAvailabilityState();
}

class _ArtistAvailabilityState extends State<ArtistAvailability> {
  final Map<String, Map<String, dynamic>> weekDays = {
    'Monday': {'enabled': true, 'start': '8:00 AM', 'end': '8:00 PM'},
    'Tuesday': {'enabled': false, 'start': '8:00 AM', 'end': '8:00 PM'},
    'Wednesday': {'enabled': true, 'start': '8:00 AM', 'end': '8:00 PM'},
    'Thursday': {'enabled': false, 'start': '8:00 AM', 'end': '8:00 PM'},
    'Friday': {'enabled': true, 'start': '8:00 AM', 'end': '8:00 PM'},
    'Saturday': {'enabled': true, 'start': '8:00 AM', 'end': '8:00 PM'},
    'Sunday': {'enabled': true, 'start': '8:00 AM', 'end': '8:00 PM'},
  };

  int daysBefore = 3;
  int daysAfter = 3;

  final List<String> timeSlots = [
    '6:00 AM', '6:30 AM', '7:00 AM', '7:30 AM', '8:00 AM', '8:30 AM',
    '9:00 AM', '9:30 AM', '10:00 AM', '10:30 AM', '11:00 AM', '11:30 AM',
    '12:00 PM', '12:30 PM', '1:00 PM', '1:30 PM', '2:00 PM', '2:30 PM',
    '3:00 PM', '3:30 PM', '4:00 PM', '4:30 PM', '5:00 PM', '5:30 PM',
    '6:00 PM', '6:30 PM', '7:00 PM', '7:30 PM', '8:00 PM', '8:30 PM',
    '9:00 PM', '9:30 PM', '10:00 PM', '10:30 PM', '11:00 PM', '11:30 PM',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: AppColors.textColor1),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Center(
              child: Text(
                'Step 5/7',
                style: AppTextStyles.body2(
                  color: AppColors.grey2,
                  weight: AppTextStyles.regularText,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'When Are You Available?',
                    style: AppTextStyles.h5(
                      color: AppColors.textColor1,
                      weight: AppTextStyles.boldText,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  Center(
                    child: Text(
                      'Set your working hours. You can update this anytime in settings.',
                      style: AppTextStyles.caption1(
                        color: AppColors.grey2,
                        weight: AppTextStyles.regularText,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 32),
                  ...weekDays.entries.map((entry) {
                    final day = entry.key;
                    final data = entry.value;
                    
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                day,
                                style: AppTextStyles.body1(
                                  color: AppColors.textColor1,
                                  weight: AppTextStyles.mediumText,
                                ),
                              ),
                              Switch.adaptive(
                                value: data['enabled'],
                                onChanged: (value) {
                                  setState(() {
                                    weekDays[day]!['enabled'] = value;
                                  });
                                },
                                activeThumbColor: Colors.white,
                                activeTrackColor: AppColors.orange,
                                inactiveThumbColor: Colors.white,
                                inactiveTrackColor: AppColors.grey4,

                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              Expanded(
                                child: DropdownButtonFormField<String>(
                                  value: data['start'],
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: data['enabled'] ? AppColors.grey5 : const Color(0xFFF5F5F5),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: BorderSide.none,
                                    ),
                                    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                                  ),
                                  icon: Icon(Icons.keyboard_arrow_down, color: data['enabled'] ? AppColors.grey2 : AppColors.grey4),
                                  style: AppTextStyles.body2(color: data['enabled'] ? AppColors.textColor1 : AppColors.grey3),
                                  items: timeSlots.map((time) => DropdownMenuItem(
                                    value: time,
                                    child: Text(time, style: AppTextStyles.body2(color: AppColors.textColor1)),
                                  )).toList(),
                                  onChanged: data['enabled'] ? (value) {
                                    setState(() {
                                      weekDays[day]!['start'] = value!;
                                    });
                                  } : null,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 12),
                                child: Text(
                                  'To',
                                  style: AppTextStyles.caption1(
                                    color: AppColors.grey2,
                                    weight: AppTextStyles.regularText,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: DropdownButtonFormField<String>(
                                  value: data['end'],
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: data['enabled'] ? AppColors.grey5 : const Color(0xFFF5F5F5),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: BorderSide.none,
                                    ),
                                    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                                  ),
                                  icon: Icon(Icons.keyboard_arrow_down, color: data['enabled'] ? AppColors.grey2 : AppColors.grey4),
                                  style: AppTextStyles.body2(color: data['enabled'] ? AppColors.textColor1 : AppColors.grey3),
                                  items: timeSlots.map((time) => DropdownMenuItem(
                                    value: time,
                                    child: Text(time, style: AppTextStyles.body2(color: AppColors.textColor1)),
                                  )).toList(),
                                  onChanged: data['enabled'] ? (value) {
                                    setState(() {
                                      weekDays[day]!['end'] = value!;
                                    });
                                  } : null,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  }),
                  const SizedBox(height: 32),
                  Text(
                    'Multi-City Booking Settings',
                    style: AppTextStyles.body1(
                      color: AppColors.textColor1,
                      weight: AppTextStyles.semiBoldText,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'When booked in one city, block other cities for:',
                    style: AppTextStyles.caption1(
                      color: AppColors.grey2,
                      weight: AppTextStyles.regularText,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          if (daysBefore > 0) {
                            setState(() => daysBefore--);
                          }
                        },
                        icon: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            border: Border.all(color: AppColors.grey4),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Icon(Icons.remove, color: AppColors.grey2),
                        ),
                      ),
                      Expanded(
                        child: Center(
                          child: Text(
                            daysBefore.toString(),
                            style: AppTextStyles.h6(
                              color: AppColors.textColor1,
                              weight: AppTextStyles.mediumText,
                            ),
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() => daysBefore++);
                        },
                        icon: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            border: Border.all(color: AppColors.grey4),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Icon(Icons.add, color: AppColors.grey2),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Text(
                        'days before',
                        style: AppTextStyles.body2(
                          color: AppColors.textColor1,
                          weight: AppTextStyles.regularText,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          if (daysAfter > 0) {
                            setState(() => daysAfter--);
                          }
                        },
                        icon: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            border: Border.all(color: AppColors.grey4),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Icon(Icons.remove, color: AppColors.grey2),
                        ),
                      ),
                      Expanded(
                        child: Center(
                          child: Text(
                            daysAfter.toString(),
                            style: AppTextStyles.h6(
                              color: AppColors.textColor1,
                              weight: AppTextStyles.mediumText,
                            ),
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() => daysAfter++);
                        },
                        icon: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            border: Border.all(color: AppColors.grey4),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Icon(Icons.add, color: AppColors.grey2),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Text(
                        'days after',
                        style: AppTextStyles.body2(
                          color: AppColors.textColor1,
                          weight: AppTextStyles.regularText,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Example: If booked in Riyadh on Jan 10, Khobar will be blocked Jan 9-11',
                    style: AppTextStyles.caption2(
                      color: AppColors.grey3,
                      weight: AppTextStyles.regularText,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(24),
            child: SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                onPressed: () {
                  context.push('/artist/onboarding/verify-certificate');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.orange,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  elevation: 0,
                ),
                child: Text(
                  'Continue',
                  style: AppTextStyles.body1(
                    color: AppColors.textColor,
                    weight: AppTextStyles.semiBoldText,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
