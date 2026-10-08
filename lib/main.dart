import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.indigo),
      home: const KartuProfil(),
    );
  }
}

class KartuProfil extends StatelessWidget {
  const KartuProfil({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FA),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 700),
            child: Card(
              color: Colors.white,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
                side: const BorderSide(color: Color(0xFFE5E7EB)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(24),
                // Responsif: lebar > 600 berdampingan, sempit bertumpuk
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    if (constraints.maxWidth > 600) {
                      return const Row(
                        children: [
                          Foto(),
                          SizedBox(width: 32),
                          Expanded(child: Info(tengah: false)),
                        ],
                      );
                    }
                    return const Column(
                      children: [
                        Foto(),
                        SizedBox(height: 24),
                        Info(tengah: true),
                      ],
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// Foto profil + badge "Available" (Stack + Positioned)
class Foto extends StatelessWidget {
  const Foto({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      height: 150,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          const CircleAvatar(
            radius: 75,
            backgroundColor: Color(0xFFEEF0FF),
            backgroundImage: AssetImage('aset/profil.jpeg'),
          ),
          Positioned(
            bottom: 4,
            right: -8,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.white, width: 2),
              ),
              child: const Text(
                'Available',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Nama, prodi, deskripsi, ikon kontak, dan skill
class Info extends StatelessWidget {
  final bool tengah;
  const Info({super.key, required this.tengah});

  @override
  Widget build(BuildContext context) {
    final align = tengah ? TextAlign.center : TextAlign.start;

    return Column(
      crossAxisAlignment:
      tengah ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        Text(
          'Nabila Khustia Rohmah',
          textAlign: align,
          style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 4),
        Text(
          'Mahasiswa Sistem Informasi',
          textAlign: align,
          style: const TextStyle(fontSize: 15, color: Colors.indigo),
        ),
        const SizedBox(height: 12),
        Text(
          'mahasiswa semester 5 kelas A, NIM 4124021',
          textAlign: align,
          style: const TextStyle(color: Colors.black54, height: 1.5),
        ),
        const SizedBox(height: 16),

        // Row: 3 ikon kontak
        Row(
          mainAxisAlignment:
          tengah ? MainAxisAlignment.center : MainAxisAlignment.start,
          children: const [
            Icon(Icons.mail_outline, color: Colors.indigo),
            SizedBox(width: 20),
            Icon(Icons.phone_outlined, color: Colors.indigo),
            SizedBox(width: 20),
            Icon(Icons.code, color: Colors.indigo),
          ],
        ),
        const SizedBox(height: 16),

        // Wrap: Chip otomatis pindah baris
        Wrap(
          spacing: 8,
          runSpacing: 8,
          alignment: tengah ? WrapAlignment.center : WrapAlignment.start,
          children: const [
            Chip(label: Text('Flutter')),
            Chip(label: Text('Dart')),
            Chip(label: Text('UI/UX')),
            Chip(label: Text('Basis Data')),
            Chip(label: Text('Analisis Sistem')),
          ],
        ),
      ],
    );
  }
}