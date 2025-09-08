import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key});

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  final Color _color1 = Color.fromRGBO(23, 21, 59, 1);
  final Color _color2 = Color.fromRGBO(46, 35, 108, 1);
  final Color _color3 = Color.fromRGBO(67, 61, 139, 1);
  final Color _color4 = Color.fromRGBO(200, 172, 214, 1);

  double _angle = 0;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(milliseconds: 100), (timer) {
      setState(() {
        _angle += 50;
        if (_angle > 750 * math.pi) _angle = 0;
      });
    });
  }

  Future<void> _enterLink(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  Widget _buildCertCard(String titulo, String subtitulo, String link) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      color: _color2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        title: Text(
          titulo,
          style: TextStyle(color: _color4, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          subtitulo,
          style: TextStyle(color: _color4, fontSize: 12),
        ),
        trailing: IconButton(
          icon: Icon(Icons.open_in_new, color: _color4),
          hoverColor: _color1,
          onPressed: () => _enterLink(link),
        ),
      ),
    );
  }

  Widget _IconsWidget(String location) {
    return SvgPicture.asset(location, width: 35, height: 35);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: _color4),
        backgroundColor: _color1,
        leading: Builder(
          builder: (context) => IconButton(
            highlightColor: _color2,
            tooltip: "Projetos",
            onPressed: Scaffold.of(context).openDrawer,
            icon: Icon(Icons.code, size: 45),
          ),
        ),
        actions: [
          Builder(
            builder: (context) => IconButton(
              highlightColor: _color2,
              tooltip: "Certificados",
              onPressed: Scaffold.of(context).openEndDrawer,
              icon: Icon(Icons.school, size: 45),
            ),
          ),
        ],
      ),
      drawer: Container(
        color: _color1,
        width: 500,
        padding: EdgeInsets.all(24),
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Projetos",
                  style: TextStyle(
                    color: _color4,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: Icon(Icons.exit_to_app, color: _color4, size: 30),
                ),
              ],
            ),
            Divider(thickness: 2, color: _color4),
            SizedBox(height: 14),
            _buildCertCard(
              "Conversor de Moedas - JAVA",
              "Um desafio do programa Oracle Next Education (ONE) em parceria com a Alura. O objetivo foi desenvolver uma aplicação de conversor de moedas utilizando Java 21, consumindo dados de uma API.",
              "https://github.com/Grazixz/conversor--de--moedas--challenge2--one",
            ),

            _buildCertCard(
              "Weather Forecast - JAVA",
              "Uma aplicação que consome uma API de previsão do tempo que exibe informações climáticas com base no local informado pelo usuário.",
              "https://github.com/Grazixz/weather--forecast",
            ),

            _buildCertCard(
              "LiterAlura - JAVA",
              "Um desafio do programa Oracle Next Education (ONE) em parceria com a Alura. O objetivo foi desenvolver uma aplicação com um catálogo de livros, consumindo dados de uma API e armazenando essas informações em um banco de dados relacional.",
              "https://github.com/Grazixz/literalura--challenge3--one",
            ),

            _buildCertCard(
              "ForumHub - JAVA",
              "Um desafio do programa Oracle Next Education (ONE) em parceria com a Alura. O objetivo foi desenvolver uma API Rest de um Forum e armazenar em um banco de dados com entidades Usuário, Curso, Tópico e Resposta.",
              "https://github.com/Grazixz/forum-hub--challenge4--one",
            )
          ],
        ),
      ),
      endDrawer: Container(
        color: _color1,
        width: 500,
        padding: EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Certificados",
                  style: TextStyle(
                    color: _color4,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: Icon(Icons.exit_to_app, color: _color4, size: 30),
                ),
              ],
            ),
            Divider(thickness: 2, color: _color4),
            SizedBox(height: 16),
            _buildCertCard(
              "Análise e Desenvolvimento de Sistemas",
              "Curso Técnico - Concluído - 1200h",
              "https://drive.google.com/file/d/1ENaWXOiFe151btSa2moIdlmei0teujR4/view?usp=sharing",
            ),

            _buildCertCard(
              "Lógica de Programação",
              "Concluído - 14h",
              "https://drive.google.com/file/d/1VAzPwFTC8XCdkdpB5X1YXKBOouDMWC9V/view?usp=drive_link",
            ),

            _buildCertCard(
              "Desenvolvimento de Jogos",
              "Concluído - 400h",
              "https://drive.google.com/file/d/1tkjiWhVXwp4Xhb33ClEFsW9LiRBcP3VP/view?usp=drive_link",
            ),

            _buildCertCard(
              "Certificados da Alura",
              "HTML/CSS - JavaScript - Java",
              "https://drive.google.com/drive/folders/1vErINPDyX_Q7Q5jJ8_iZYuiz62QDxUFH?usp=drive_link",
            ),
          ],
        ),
      ),

      body: Stack(
        children: [
          Container(
            width: double.maxFinite,
            height: double.maxFinite,
            color: _color1,
            child: Padding(
              padding: const EdgeInsets.all(2),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: MediaQuery.of(context).size.height,
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(1),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          AnimatedContainer(
                            duration: Duration(milliseconds: 100),
                            padding: EdgeInsets.all(15),
                            width: 450,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [_color1, _color2, _color1],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                transform: GradientRotation(_angle),
                              ),
                              borderRadius: BorderRadius.all(
                                Radius.circular(20),
                              ),
                              border: Border.all(color: _color3, width: 2),
                            ),
                            child: LayoutBuilder(
                              builder: (context, constrains) {
                                return Column(
                                  spacing: 20,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    CircleAvatar(
                                      radius: 110,
                                      backgroundImage: AssetImage(
                                        "assets/image/graziela.jpg",
                                      ),
                                    ),
                                    Text(
                                      "Graziela Lucena",
                                      style: TextStyle(
                                        color: _color4,
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      spacing: 3,
                                      children: [
                                        IconButton(
                                          onPressed: () {},
                                          icon: _IconsWidget(
                                            "assets/icons/html5.svg",
                                          ),
                                          mouseCursor: MouseCursor.defer,
                                        ),
                                        IconButton(
                                          onPressed: () {},
                                          icon: _IconsWidget(
                                            "assets/icons/css.svg",
                                          ),
                                          mouseCursor: MouseCursor.defer,
                                        ),
                                        IconButton(
                                          onPressed: () {},
                                          icon: _IconsWidget(
                                            "assets/icons/js.svg",
                                          ),
                                          mouseCursor: MouseCursor.defer,
                                        ),
                                        IconButton(
                                          onPressed: () {},
                                          icon: _IconsWidget(
                                            "assets/icons/dart.svg",
                                          ),
                                          mouseCursor: MouseCursor.defer,
                                        ),
                                        IconButton(
                                          onPressed: () {},
                                          icon: _IconsWidget(
                                            "assets/icons/flutter.svg",
                                          ),
                                          mouseCursor: MouseCursor.defer,
                                        ),
                                        IconButton(
                                          onPressed: () {},
                                          icon: _IconsWidget(
                                            "assets/icons/java.svg",
                                          ),
                                          mouseCursor: MouseCursor.defer,
                                        ),
                                      ],
                                    ),
                                    Text(
                                      "Sou estudante de Ciência da Computação, sendo apaixonada por tecnologia, tenho base em desenvolvimento web e mobile. Atualmente estou estudando Java, com objetivo de me tornar fullstack. Estou sempre em busca de novos desafios e oportunidades para aprender e crescer na área da tecnologia.",
                                      style: TextStyle(
                                        color: _color4,
                                        fontSize: 16,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        IconButton(
                                          onPressed: () => _enterLink(
                                            "mailto:grazielalucena8@gmail.com?body=Olá...",
                                          ),
                                          tooltip: "E-mail",
                                          icon: _IconsWidget(
                                            "assets/icons/email.svg",
                                          ),
                                        ),
                                        IconButton(
                                          onPressed: () => _enterLink(
                                            "https://www.linkedin.com/in/grazixzdev/",
                                          ),
                                          tooltip: "LinkedIn",
                                          icon: _IconsWidget(
                                            "assets/icons/linkedin.svg",
                                          ),
                                        ),
                                        IconButton(
                                          onPressed: () => _enterLink(
                                            "https://github.com/grazixzdev",
                                          ),
                                          tooltip: "GitHub",
                                          icon: _IconsWidget(
                                            "assets/icons/github1.svg",
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
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
