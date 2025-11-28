import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:go_router/go_router.dart';
import '../../../../constants/styles/app_colors.dart';
import '../../../../constants/styles/text_style.dart';

class ArtistVerifyCertificate extends StatefulWidget {
  const ArtistVerifyCertificate({super.key});

  @override
  State<ArtistVerifyCertificate> createState() =>
      _ArtistVerifyCertificateState();
}

class _ArtistVerifyCertificateState extends State<ArtistVerifyCertificate> {
  List<PlatformFile> uploadedFiles = [];
  bool isUploading = false;

  @override
  void initState() {
    super.initState();
    // Add preset certificate
    uploadedFiles.add(
      PlatformFile(
        name: 'certificate.pdf',
        size: 8179, // actual file size
        path: 'assets/documents/certificate.pdf',
      ),
    );
  }

  Future<void> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'jpeg', 'png', 'pdf', 'mp4'],
      allowMultiple: false,
    );

    if (result != null) {
      final file = result.files.first;
      if (file.size > 50 * 1024 * 1024) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('File size must be less than 50MB'),
            backgroundColor: AppColors.error1,
          ),
        );
        return;
      }

      setState(() {
        uploadedFiles.add(file);
        isUploading = true;
      });

      // Simulate upload
      await Future.delayed(const Duration(seconds: 2));

      setState(() {
        isUploading = false;
      });
    }
  }

  void _removeFile(int index) {
    setState(() {
      uploadedFiles.removeAt(index);
    });
  }

  bool get canContinue => uploadedFiles.any((file) => !isUploading);

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
                'Step 6/7',
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
          Text(
            'Verify Your Work Certificate',
            style: AppTextStyles.h5(
              color: AppColors.textColor1,
              weight: AppTextStyles.boldText,
            ),
            textAlign: TextAlign.center,
          ),

          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Column(
                      children: [
                        Text(
                          '(وثيقة عمل حر)',
                          style: AppTextStyles.h6(
                            color: AppColors.textColor1,
                            weight: AppTextStyles.mediumText,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'To prevent fraud, please upload your freelance work certificate.',
                          style: AppTextStyles.caption1(
                            color: AppColors.grey2,
                            weight: AppTextStyles.regularText,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 32),
                  Text(
                    'Upload work certificate',
                    style: AppTextStyles.body1(
                      color: AppColors.textColor1,
                      weight: AppTextStyles.mediumText,
                    ),
                  ),
                  const SizedBox(height: 16),
                  GestureDetector(
                    onTap: _pickFile,
                    child: Container(
                      padding: const EdgeInsets.all(40),
                      decoration: BoxDecoration(
                        color: AppColors.grey5,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        children: [
                          Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              color: AppColors.orange.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Icon(
                              Icons.description_outlined,
                              color: AppColors.orange,
                              size: 32,
                            ),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'Upload file',
                            style: AppTextStyles.body1(
                              color: AppColors.textColor1,
                              weight: AppTextStyles.mediumText,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'JPEG, PNG, PDF, and MP4 formats, up to 50MB',
                            style: AppTextStyles.caption1(
                              color: AppColors.grey2,
                              weight: AppTextStyles.regularText,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 16),
                          TextButton(
                            onPressed: _pickFile,
                            child: Text(
                              'Upload file',
                              style: AppTextStyles.body2(
                                color: AppColors.orange,
                                weight: AppTextStyles.mediumText,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  if (uploadedFiles.isNotEmpty) ...[
                    const SizedBox(height: 24),
                    Text(
                      'Uploaded Files',
                      style: AppTextStyles.body1(
                        color: AppColors.textColor1,
                        weight: AppTextStyles.mediumText,
                      ),
                    ),
                    const SizedBox(height: 12),
                    ...uploadedFiles.asMap().entries.map((entry) {
                      final index = entry.key;
                      final file = entry.value;
                      final isUploading =
                          index == uploadedFiles.length - 1 && this.isUploading;

                      return Container(
                        margin: const EdgeInsets.only(bottom: 12),
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          border: Border.all(color: AppColors.grey4),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 48,
                              height: 48,
                              decoration: BoxDecoration(
                                color: AppColors.error1.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Center(
                                child: Text(
                                  'PDF',
                                  style: AppTextStyles.caption1(
                                    color: AppColors.error1,
                                    weight: AppTextStyles.boldText,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    file.name,
                                    style: AppTextStyles.body2(
                                      color: AppColors.textColor1,
                                      weight: AppTextStyles.mediumText,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  const SizedBox(height: 4),
                                  Row(
                                    children: [
                                      Text(
                                        '${(file.size / (1024 * 1024)).toStringAsFixed(1)}MB',
                                        style: AppTextStyles.caption2(
                                          color: AppColors.grey2,
                                          weight: AppTextStyles.regularText,
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      Text(
                                        '•',
                                        style: AppTextStyles.caption2(
                                          color: AppColors.grey2,
                                          weight: AppTextStyles.regularText,
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      if (isUploading) ...[
                                        Text(
                                          '55% • 37 sec left',
                                          style: AppTextStyles.caption2(
                                            color: AppColors.grey2,
                                            weight: AppTextStyles.regularText,
                                          ),
                                        ),
                                        const SizedBox(width: 8),
                                        const SizedBox(
                                          width: 12,
                                          height: 12,
                                          child: CircularProgressIndicator(
                                            strokeWidth: 2,
                                            valueColor: AlwaysStoppedAnimation(
                                              AppColors.success1,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: 4),
                                        Text(
                                          'Uploading',
                                          style: AppTextStyles.caption2(
                                            color: AppColors.success1,
                                            weight: AppTextStyles.regularText,
                                          ),
                                        ),
                                      ] else
                                        Text(
                                          '100% • Uploaded ',
                                          style: AppTextStyles.caption2(
                                            color: AppColors.success1,
                                            weight: AppTextStyles.regularText,
                                          ),
                                        ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            IconButton(
                              onPressed: () => _removeFile(index),
                              icon: const Icon(
                                Icons.delete_outline,
                                color: AppColors.error1,
                                size: 20,
                              ),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  ],
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
                        context.push('/artist/onboarding/review');
                      }
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.orange,
                  disabledBackgroundColor: AppColors.grey4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
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
