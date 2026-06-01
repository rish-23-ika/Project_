import 'package:flutter/material.dart';

void main() {
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

class Institution {
  final String id;
  final String name;
  final String domain;

  Institution({
    required this.id,
    required this.name,
    required this.domain,
  });
}

class InstitutionSelectionScreen extends StatelessWidget {
  const InstitutionSelectionScreen({super.key});

  static final List<Institution> institutions = [
    Institution(
      id: "1",
      name: "Bennett University",
      domain: "bennett.traceit.in",
    ),
    Institution(
      id: "2",
      name: "Amity University",
      domain: "amity.traceit.in",
    ),
    Institution(
      id: "3",
      name: "Lovely Professional University",
      domain: "lpu.traceit.in",
    ),
    Institution(
      id: "4",
      name: "SRM University",
      domain: "srm.traceit.in",
    ),
    Institution(
      id: "5",
      name: "Galgotias University",
      domain: "galgotias.traceit.in",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff5f7fa),
      body: Center(
        child: Container(
          width: 550,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.08),
                blurRadius: 20,
                spreadRadius: 2,
              )
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 28),
                decoration: const BoxDecoration(
                  color: Color(0xfff8f9fb),
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(20),
                  ),
                ),
                child: const Center(
                  child: Text(
                    "TraceIt",
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 30),

              const Text(
                "Select your institution",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                ),
              ),

              const SizedBox(height: 25),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Institution",
                    style: TextStyle(
                      color: Colors.grey.shade700,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 8),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Autocomplete<Institution>(
                  displayStringForOption: (Institution option) =>
                      option.name,
                  optionsBuilder: (TextEditingValue textEditingValue) {
                    if (textEditingValue.text.isEmpty) {
                      return const Iterable<Institution>.empty();
                    }

                    return institutions.where(
                      (institution) => institution.name
                          .toLowerCase()
                          .contains(textEditingValue.text.toLowerCase()),
                    );
                  },
                  onSelected: (Institution institution) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => InstitutionDashboardScreen(
                          institution: institution,
                        ),
                      ),
                    );
                  },
                  fieldViewBuilder: (
                    context,
                    controller,
                    focusNode,
                    onEditingComplete,
                  ) {
                    return TextField(
                      controller: controller,
                      focusNode: focusNode,
                      decoration: InputDecoration(
                        hintText: "Type your institution name",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(height: 12),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: const Color(0xffdff3ff),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: const Text(
                    "Please type your Institution name to search. "
                    "You can type the first 3 letters of your Institution "
                    "to see the list.",
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 13,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
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