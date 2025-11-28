import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../constants/styles/app_colors.dart';
import '../../../../constants/styles/text_style.dart';

class ArtistSetPricing extends StatefulWidget {
  const ArtistSetPricing({super.key});

  @override
  State<ArtistSetPricing> createState() => _ArtistSetPricingState();
}

class _ArtistSetPricingState extends State<ArtistSetPricing> {
  final List<Map<String, dynamic>> selectedServices = [
    {
      'title': 'Bridal Makeup',
      'icon': '💍',
      'priceController': TextEditingController(),
      'hours': 2,
      'minutes': 30,
      'detailsController': TextEditingController(),
      'expanded': true,
    },
  ];

  final List<int> hoursList = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12];
  final List<int> minutesList = [0, 15, 30, 45];

  @override
  void dispose() {
    for (var service in selectedServices) {
      (service['priceController'] as TextEditingController).dispose();
      (service['detailsController'] as TextEditingController).dispose();
    }
    super.dispose();
  }

  bool get canContinue {
    return true; // Always allow continue since we have default values
  }

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
                'Step 3/7',
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
                    'Set Prices & Duration',
                    style: AppTextStyles.h4(
                      color: AppColors.textColor1,
                      weight: AppTextStyles.boldText,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Center(
                    child: Text(
                      'Set your prices and service duration for each selected service',
                      style: AppTextStyles.caption1(
                        color: AppColors.grey2,
                        weight: AppTextStyles.regularText,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 32),
                  ...selectedServices.asMap().entries.map((entry) {
                    final index = entry.key;
                    final service = entry.value;
                    final isExpanded = service['expanded'] as bool;
                    
                    return Container(
                      margin: const EdgeInsets.only(bottom: 16),
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.grey4),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                selectedServices[index]['expanded'] = !isExpanded;
                              });
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(16),
                              child: Row(
                                children: [
                                  Text(
                                    service['icon'],
                                    style: const TextStyle(fontSize: 24),
                                  ),
                                  const SizedBox(width: 12),
                                  Expanded(
                                    child: Text(
                                      service['title'],
                                      style: AppTextStyles.body1(
                                        color: AppColors.textColor1,
                                        weight: AppTextStyles.mediumText,
                                      ),
                                    ),
                                  ),
                                  Icon(
                                    isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                                    color: AppColors.grey2,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          if (isExpanded) ...[
                            Padding(
                              padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Divider(color: AppColors.grey4, height: 1),
                                  const SizedBox(height: 16),
                                  Text(
                                    'Starting Price (SAR)',
                                    style: AppTextStyles.body2(
                                      color: AppColors.textColor1,
                                      weight: AppTextStyles.mediumText,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  TextField(
                                    controller: service['priceController'],
                                    keyboardType: TextInputType.number,
                                    style: AppTextStyles.body2(color: AppColors.textColor1),
                                    decoration: InputDecoration(
                                      hintText: '800',
                                      filled: true,
                                      fillColor: AppColors.grey5,
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        borderSide: BorderSide.none,
                                      ),
                                      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                                    ),
                                    onChanged: (value) => setState(() {}),
                                  ),
                                  const SizedBox(height: 16),
                                  Text(
                                    'Duration',
                                    style: AppTextStyles.body2(
                                      color: AppColors.textColor1,
                                      weight: AppTextStyles.mediumText,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: DropdownButtonFormField<int>(
                                          value: service['hours'],
                                          decoration: InputDecoration(
                                            filled: true,
                                            fillColor: AppColors.grey5,
                                            border: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(8),
                                              borderSide: BorderSide.none,
                                            ),
                                            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                                          ),
                                          icon: const Icon(Icons.keyboard_arrow_down, color: AppColors.grey2),
                                          items: hoursList.map((hour) => DropdownMenuItem(
                                            value: hour,
                                            child: Text(hour.toString(), style: AppTextStyles.body2(color: AppColors.textColor1)),
                                          )).toList(),
                                          onChanged: (value) {
                                            setState(() {
                                              service['hours'] = value!;
                                            });
                                          },
                                        ),
                                      ),
                                      const SizedBox(width: 12),
                                      Text('Hours', style: AppTextStyles.body2(color: AppColors.grey2)),
                                      const SizedBox(width: 24),
                                      Expanded(
                                        child: DropdownButtonFormField<int>(
                                          value: service['minutes'],
                                          decoration: InputDecoration(
                                            filled: true,
                                            fillColor: AppColors.grey5,
                                            border: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(8),
                                              borderSide: BorderSide.none,
                                            ),
                                            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                                          ),
                                          icon: const Icon(Icons.keyboard_arrow_down, color: AppColors.grey2),
                                          items: minutesList.map((minute) => DropdownMenuItem(
                                            value: minute,
                                            child: Text(minute.toString(), style: AppTextStyles.body2(color: AppColors.textColor1)),
                                          )).toList(),
                                          onChanged: (value) {
                                            setState(() {
                                              service['minutes'] = value!;
                                            });
                                          },
                                        ),
                                      ),
                                      const SizedBox(width: 12),
                                      Text('Minutes', style: AppTextStyles.body2(color: AppColors.grey2)),
                                    ],
                                  ),
                                  const SizedBox(height: 16),
                                  Text(
                                    'Service details',
                                    style: AppTextStyles.body2(
                                      color: AppColors.textColor1,
                                      weight: AppTextStyles.mediumText,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  TextField(
                                    controller: service['detailsController'],
                                    maxLines: 5,
                                    maxLength: 500,
                                    style: AppTextStyles.body2(color: AppColors.textColor1),
                                    decoration: InputDecoration(
                                      hintText: 'What your clients should know or prepare for',
                                      hintStyle: AppTextStyles.body2(color: AppColors.grey3),
                                      filled: true,
                                      fillColor: AppColors.grey5,
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        borderSide: BorderSide.none,
                                      ),
                                      contentPadding: const EdgeInsets.all(16),
                                      counterStyle: AppTextStyles.caption2(color: AppColors.grey2),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ],
                      ),
                    );
                  })
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
                onPressed: canContinue
                    ? () {
                        context.push('/artist/onboarding/showcase-work');
                      }
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.orange,
                  disabledBackgroundColor: AppColors.grey4,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  elevation: 0,
                  
                ),
                child: Text(
                  'Continue',
                  style: AppTextStyles.body1(
                    color: Colors.white,
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
