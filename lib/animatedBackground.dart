// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:flutter_animate/flutter_animate.dart';
// import 'package:url_launcher/url_launcher.dart';
//
// void main() {
//   runApp(const MeuPortfolio());
// }
//
// class MeuPortfolio extends StatefulWidget {
//   const MeuPortfolio({super.key});
//
//   @override
//   State<MeuPortfolio> createState() => _MeuPortfolioState();
// }
//
// class _MeuPortfolioState extends State<MeuPortfolio> {
//   ThemeMode _themeMode = ThemeMode.system;
//
//   void _alternarTema() {
//     setState(() {
//       _themeMode = _themeMode == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Portfólio da Grazi',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData.light(useMaterial3: true),
//       darkTheme: ThemeData.dark(useMaterial3: true),
//       themeMode: _themeMode,
//       home: PortfolioPage(onThemeToggle: _alternarTema),
//     );
//   }
// }
//
// class PortfolioPage extends StatefulWidget {
//   final VoidCallback onThemeToggle;
//
//   const PortfolioPage({super.key, required this.onThemeToggle});
//
//   @override
//   State<PortfolioPage> createState() => _PortfolioPageState();
// }
//
// class _PortfolioPageState extends State<PortfolioPage> {
//   late Timer _timer;
//   double _angle = 0;
//
//   @override
//   void initState() {
//     super.initState();
//     _timer = Timer.periodic(const Duration(milliseconds: 100), (timer) {
//       setState(() {
//         _angle += 0.01;
//       });
//     });
//   }
//
//   @override
//   void dispose() {
//     _timer.cancel();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final largura = MediaQuery.of(context).size.width;
//     final isMobile = largura < 600;
//
//     return Scaffold(
//       floatingActionButton: FloatingActionButton(
//         onPressed: widget.onThemeToggle,
//         child: const Icon(Icons.brightness_6),
//       ),
//       body: Stack(
//         children: [
//           AnimatedContainer(
//             duration: const Duration(milliseconds: 500),
//             decoration: BoxDecoration(
//               gradient: LinearGradient(
//                 colors: [
//                   Colors.purple.withOpacity(0.6),
//                   Colors.blue.withOpacity(0.6),
//                   Colors.pink.withOpacity(0.6),
//                 ],
//                 begin: Alignment.topLeft,
//                 end: Alignment.bottomRight,
//                 transform: GradientRotation(_angle),
//               ),
//             ),
//           ),
//           Center(
//             child: SingleChildScrollView(
//               padding: const EdgeInsets.all(32),
//               child: LayoutBuilder(
//                 builder: (context, constraints) {
//                   return Column(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       const CircleAvatar(
//                         radius: 60,
//                         backgroundImage: NetworkImage('https://i.pravatar.cc/150?img=47'),
//                       ).animate().fadeIn().scale(),
//
//                       const SizedBox(height: 16),
//
//                       Text(
//                         'Grazi Dev',
//                         style: TextStyle(
//                           fontSize: isMobile ? 28 : 36,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ).animate().fadeIn().slideY(begin: 0.2),
//
//                       const SizedBox(height: 8),
//
//                       Text(
//                         'Desenvolvedora Full Stack • Flutter Lover 💙',
//                         style: TextStyle(fontSize: isMobile ? 16 : 20),
//                       ).animate().fadeIn().slideY(begin: 0.3),
//
//                       const SizedBox(height: 24),
//
//                       Wrap(
//                         alignment: WrapAlignment.center,
//                         spacing: 16,
//                         children: [
//                           IconButton(
//                             icon: const Icon(Icons.code),
//                             tooltip: 'GitHub',
//                             onPressed: () => _abrirLink('https://github.com/seuusuario'),
//                           ),
//                           IconButton(
//                             icon: const Icon(Icons.work),
//                             tooltip: 'LinkedIn',
//                             onPressed: () => _abrirLink('https://linkedin.com/in/seuusuario'),
//                           ),
//                           IconButton(
//                             icon: const Icon(Icons.email),
//                             tooltip: 'E-mail',
//                             onPressed: () => _abrirLink('mailto:seu@email.com'),
//                           ),
//                         ],
//                       ).animate().fadeIn().slideY(begin: 0.1),
//
//                       const SizedBox(height: 32),
//
//                       Text(
//                         'Projetos',
//                         style: TextStyle(
//                           fontSize: isMobile ? 22 : 26,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ).animate().fadeIn().slideY(begin: 0.2),
//
//                       const SizedBox(height: 16),
//
//                       _buildProjetoCard(
//                         titulo: 'App de Finanças',
//                         descricao: 'Controle seus gastos com Flutter.',
//                         link: 'https://github.com/seuusuario/app-financas',
//                         delay: 100,
//                       ),
//                       _buildProjetoCard(
//                         titulo: 'Site pessoal',
//                         descricao: 'Portfólio moderno com Flutter Web.',
//                         link: 'https://seuportfolio.com',
//                         delay: 200,
//                       ),
//                     ],
//                   );
//                 },
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildProjetoCard({
//     required String titulo,
//     required String descricao,
//     required String link,
//     int delay = 0,
//   }) {
//     return Card(
//       margin: const EdgeInsets.symmetric(vertical: 8),
//       child: ListTile(
//         title: Text(titulo),
//         subtitle: Text(descricao),
//         trailing: IconButton(
//           icon: const Icon(Icons.open_in_new),
//           onPressed: () => _abrirLink(link),
//         ),
//       ),
//     ).animate().fadeIn().slideX(begin: 0.1, delay: delay.ms);
//   }
//
//   Future<void> _abrirLink(String url) async {
//     final uri = Uri.parse(url);
//     if (await canLaunchUrl(uri)) {
//       await launchUrl(uri, mode: LaunchMode.externalApplication);
//     }
//   }
// }
