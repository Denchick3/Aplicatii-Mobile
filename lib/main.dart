import 'package:first_flutter_project/domain/repositories/centers_repository.dart';
import 'package:flutter/material.dart';
import 'data/data_sourses/json_data_source.dart';
import 'data/repositories/doctor_repository_impl.dart';
import 'data/repositories/category_repository_impl.dart';
import 'data/repositories/centers_repository_impl.dart';
import 'data/repositories/banner_repository_impl.dart';
import 'presentation/pages/doctor_search_page.dart';
import 'domain/repositories/doctor_repository.dart';
import 'domain/repositories/category_repository.dart';
import 'domain/repositories/banner_repository.dart';

void main() {
  // Initialize data sources
  final jsonDataSource = JsonDataSource();

  // Initialize repositories with the data source
  final doctorRepository = DoctorRepositoryImpl(jsonDataSource);
  final categoryRepository = CategoryRepositoryImpl(jsonDataSource);
  final bannerRepository = BannerRepositoryImpl(jsonDataSource);
  final medicalCenterRepository = MedicalCenterRepositoryImpl(jsonDataSource);

  runApp(MyApp(
    doctorRepository: doctorRepository,
    categoryRepository: categoryRepository,
    bannerRepository: bannerRepository,
    medicalCenterRepository: medicalCenterRepository,
  ));
}

class MyApp extends StatelessWidget {
  final DoctorRepository doctorRepository;
  final CategoryRepository categoryRepository;
  final BannerRepository bannerRepository;
  final MedicalCenterRepository medicalCenterRepository;

  MyApp({
    required this.doctorRepository,
    required this.categoryRepository,
    required this.bannerRepository,
    required this.medicalCenterRepository,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DoctorSearchPage(
        doctorRepository: doctorRepository,
        categoryRepository: categoryRepository,
        bannerRepository: bannerRepository,
        medicalCenterRepository: medicalCenterRepository,
      ),
    );
  }
}
