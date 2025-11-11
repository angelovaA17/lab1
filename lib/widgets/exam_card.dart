import 'package:flutter/material.dart';
import 'package:lab1/screens/home.dart';
import '../models/exam.dart';
import '../screens/details.dart';
import 'package:intl/intl.dart';

class ExamCard extends StatelessWidget {
  final Exam exam;

  const ExamCard({super.key, required this.exam});

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final isPast = exam.datum.isBefore(now);

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ExamDetailScreen(exam: exam),
          ),
        );
      },
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.blue.shade300, width: 2),
          borderRadius: BorderRadius.circular(10),
        ),
        color: isPast ? Colors.grey[300] : Colors.lightBlue[50],
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Icon(Icons.book, color: Colors.blueAccent),
                  const SizedBox(width: 10),
                  Text(
                    exam.ime,
                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Colors.brown),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  const Icon(Icons.calendar_today, color: Colors.orange),
                  const SizedBox(width: 8),
                  Text(
                    DateFormat('dd.MM.yyyy HH:mm').format(exam.datum),
                    style: const TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 6),
              Row(
                children: [
                  const Icon(Icons.room, color: Colors.redAccent),
                  const SizedBox(width: 8),
                  Text(
                    exam.prostorii.join(', '),
                    style: const TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

