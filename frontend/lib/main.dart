import 'screens/institution_selection_screen.dart';
import 'models/institution.dart';
import 'services/supabase_service.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SupabaseService.initialize();

  runApp(const TraceItApp());
}

class TraceItApp extends StatelessWidget {
  const TraceItApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TraceIt',
      theme: ThemeData(
        fontFamily: 'Roboto',
      ),
      home: const InstitutionSelectionScreen(),
    );
  }
}

class InstitutionDashboardScreen extends StatelessWidget {
  final Institution institution;

  const InstitutionDashboardScreen({
    super.key,
    required this.institution,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TraceIt"),
      ),
      body: Center(
        child: Text(
          "Selected Institution:\n${institution.name}",
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 24,
          ),
        ),
      ),
    );
  }
}