import 'package:flutter/material.dart';
import '../models/exam.dart';
import '../widgets/exam_card.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final List<Exam> exams = [
    Exam(ime: 'Вовед во наука за податоци', datum: DateTime(2025, 11, 2, 9, 0), prostorii: ['Лаб 138', 'Лаб 215']),
    Exam(ime: 'Мобилни информациски системи', datum: DateTime(2025, 11, 09, 12, 0), prostorii: ['Лаб 215']),
    Exam(ime: 'Веројатност и статистика', datum: DateTime(2025, 11, 10, 10, 0), prostorii: ['255','317']),
    Exam(ime: 'Интегрирани системи', datum: DateTime(2025, 11, 20, 14, 0), prostorii: ['Лаб 13']),
    Exam(ime: 'Дизајн на образовен софтвер', datum: DateTime(2025, 11, 22, 13, 0), prostorii: ['АМФ ФИНКИ голем']),
    Exam(ime: 'Електронска и мобилна трговија', datum: DateTime(2025, 11, 23, 9, 0), prostorii: ['Лаб 138',]),
    Exam(ime: 'Калкулус', datum: DateTime(2025, 11, 25, 10, 0), prostorii: ['255','317']),
    Exam(ime: 'Дискретна математика', datum: DateTime(2025, 11, 27, 12, 0), prostorii: ['Лаб 13''Лаб 215']),
    Exam(ime: 'Оперативни системи', datum: DateTime(2025, 11, 29, 15, 0), prostorii: ['Лаб 138','Лаб 13']),
    Exam(ime: 'Вештачка интелегенција', datum: DateTime(2025, 12, 01, 14, 0), prostorii: ['Лаб 13']),
    Exam(ime: 'Напредно програмирање', datum: DateTime(2025, 12, 04, 15, 0), prostorii: ['Лаб 215']),
    Exam(ime: 'Web програмирање', datum: DateTime(2025, 12, 06, 14, 0), prostorii: ['Лаб 138']),
  ];

  @override
  Widget build(BuildContext context) {
    exams.sort((a, b) => a.datum.compareTo(b.datum));

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        title: const Text(
          'Распоред за испити - 221063',
          style: TextStyle(color: Colors.black54,fontWeight: FontWeight.bold),
        ),
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(12),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                mainAxisSpacing: 6,
                crossAxisSpacing: 6,
                childAspectRatio: 3.1
              ),
              itemCount: exams.length,
              itemBuilder: (context, index) {
                return ExamCard(exam: exams[index]);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Chip(
              label: Text('Вкупно испити: ${exams.length}',
                  style: const TextStyle(
                     fontSize: 20,
                     fontWeight: FontWeight.bold,
    )),
              backgroundColor: Colors.deepOrangeAccent[200],
            ),
          ),
        ],
      ),
    );
  }
}
