import 'dart:async';
import 'dart:math' as math;

import 'package:dev_icons/dev_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class initialScreen extends StatefulWidget {
  const initialScreen({super.key});

  @override
  State<initialScreen> createState() => _initialScreenState();
}

class _initialScreenState extends State<initialScreen> {
  final Color _color1 = Color.fromRGBO(23, 21, 59, 1);
  final Color _color2 = Color.fromRGBO(46, 35, 108, 1);
  final Color _color3 = Color.fromRGBO(67, 61, 139, 1);
  final Color _color4 = Color.fromRGBO(200, 172, 214, 1);

  double _angle = 0;
  late Timer _timer;

  @override
  void initState(){
    super.initState();
    _timer = Timer.periodic(const Duration(milliseconds: 100), (timer){
      setState(() {
        _angle += 50;
        if (_angle > 750 * math.pi) _angle = 0;
      });
    });
  }

  Future<void> _enterLink(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)){
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  Widget _buildCertCard(String titulo, String subtitulo, String link) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      color: _color2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        title: Text(
          titulo,
          style: TextStyle(
              color: _color4,
              fontWeight: FontWeight.bold
          ),
        ),
        subtitle: Text(
          subtitulo,
          style: TextStyle(
              color: _color4,
              fontSize: 12
          ),
        ),
        trailing: IconButton(
          icon: Icon(Icons.open_in_new,
            color: _color4,
          ),
          hoverColor: _color1,
          onPressed: () => _enterLink(link),
        ),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    bool isMobile(BuildContext context) =>
        MediaQuery.of(context).size.width < 600;

    bool isTablet(BuildContext context) =>
        MediaQuery.of(context).size.width >= 600 &&
            MediaQuery.of(context).size.width < 1024;

    bool isDesktop(BuildContext context) =>
        MediaQuery.of(context).size.width >= 1024;

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
            color: _color4
        ),
        backgroundColor: _color1,
        leading: Builder(
            builder: (context) => IconButton(
                highlightColor: _color2,
                tooltip: "Projetos",
                onPressed: Scaffold.of(context).openDrawer,
                icon: Icon(Icons.code,
                  size: isMobile(context) ? 30 : 45,
                ))),
        actions: [
          Builder(
              builder: (context) => IconButton(
                  highlightColor: _color2,
                  tooltip: "Certificados",
                  onPressed: Scaffold.of(context).openEndDrawer,
                  icon: Icon(Icons.school,
                    size: isMobile(context) ? 30 : 45,
                  )
              )
          ),
        ],
      ),
      drawer: Container(
        color: _color1,
        width: MediaQuery.of(context).size.width * 0.8,
        padding: EdgeInsets.all(24),
        child: ListView(
          children: [
            Text("Meus projetos",
              style: TextStyle(
                  color: _color4,
                  fontSize: 25,
                  fontWeight: FontWeight.bold
              ),
            ),
            Divider(thickness: 2, color: _color4,),
            SizedBox(height: 14,),
            _buildCertCard(
                "Conversor de Moedas - JAVA",
                "Um desafio do programa Oracle Next Education (ONE) em parceria com a Alura. O objetivo foi desenvolver uma aplicação conversor de moedas utilizando Java 21, consumindo dados de uma API.",
                "https://github.com/Grazixz/conversor--de--moedas--challenge2--one"
            ),

            _buildCertCard(
                "Weather Forecast - JAVA",
                "Uma aplicação que consome uma API de prevosão do tempo e exibe informações climáticas com base no local informado pelo usuário.",
                "https://github.com/Grazixz/weather--forecast"
            ),

            _buildCertCard(
                "LiterAlura - JAVA",
                "Um desafio do programa Oracle Next Education (ONE) em parceria com a Alura. O objetivo foi desenvolver uma aplicação com um catálogo de livros interativo, consumindo dados de uma API e armazenando essas informações em um banco de dados relacional.",
                "https://github.com/Grazixz/literalura--challenge3--one"
            ),

            _buildCertCard(
                "ForumHub - JAVA(SPRING BOOT)",
                "Um desafio do programa Oracle Next Education (ONE) em parceria com a Alura. O objetivo foi desenvolver uma API Rest de um Forum e armazenar em um banco de dados com entidades Usuário, Curso, Tópico e Resposta.",
                "https://github.com/grazixzdev/forum-hub--challenge4--one"
            ),

            _buildCertCard(
                "NerdSpace - JAVA(SPRING BOOT), HTML/CSS, JAVASCRIPT",
                "O NerdSpace é uma API de catálogo e gerenciamento de mídias da cultura geek, abrangendo Animes, Filmes, Livros, Jogos e Mangás. O projeto foi desenvolvido com Java 21 e Spring Boot 3, com foco em uma arquitetura limpa, integridade de dados e filtragem dinâmica.",
                "https://github.com/grazixzdev/nerdspace"
            )
          ],
        ),
      ),
      endDrawer: Container(
        color: _color1,
        width: MediaQuery.of(context).size.width * 0.8,
        padding: EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 12),
            Text(
              "Meus Certificados",
              style: TextStyle(
                color: _color4,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            Divider(thickness: 2, color: _color4),
            SizedBox(height: 16),

            // Certificado 1
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
                "https://drive.google.com/drive/folders/1vErINPDyX_Q7Q5jJ8_iZYuiz62QDxUFH?usp=drive_link")
          ],
        ),
      ),

      body: Stack(
        children: [
          AnimatedContainer(
            duration: Duration(milliseconds: 100),
            width: double.maxFinite,
            height: double.maxFinite,
            color: _color1,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: isDesktop(context)
                      ? 200
                      : isTablet(context)
                      ? 80
                      : 16,
                  vertical: 10,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  spacing: 50,
                  children: [
                    AnimatedContainer(
                      duration: Duration(milliseconds: 100),
                      padding: EdgeInsets.symmetric(
                          vertical: 20, horizontal: 20),
                      width: isDesktop(context)
                          ? 450
                          : double.infinity,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [_color1, _color2, _color1],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              transform: GradientRotation(_angle)
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          border: Border.all(
                            color: _color3,
                            width: 2,
                          )
                      ),
                      child: LayoutBuilder(
                        builder: (context, constrains) {
                          return Column(
                            spacing: 20,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                radius: isMobile(context)
                                    ? 70
                                    : isTablet(context)
                                    ? 90
                                    : 110,
                                backgroundImage: AssetImage(
                                    "assets/image/graziela.jpg"
                                ),
                              ),
                              Text("Graziela Lucena",
                                style: TextStyle(
                                    color: _color4,
                                    fontSize: isMobile(context) ? 20 : 25,
                                    fontWeight: FontWeight.bold
                                ),),
                              Wrap(
                                alignment: WrapAlignment.center,
                                spacing: 8,
                                runSpacing: 8,
                                children: [
                                  IconButton(
                                    onPressed: (){},
                                    icon: FaIcon(FontAwesomeIcons.html5,
                                      color: Colors.deepOrange,
                                      size: 25,
                                    ),
                                    mouseCursor: MouseCursor.defer,
                                  ),
                                  IconButton(
                                    onPressed: (){},
                                    icon: FaIcon(FontAwesomeIcons.css3,
                                      color: Colors.blue,
                                      size: 25,
                                    ),
                                    mouseCursor: MouseCursor.defer,
                                  ),
                                  IconButton(
                                    onPressed: (){},
                                    icon: FaIcon(FontAwesomeIcons.js,
                                      color: Colors.amberAccent,
                                      size: 25,
                                    ),
                                    mouseCursor: MouseCursor.defer,
                                  ),
                                  IconButton(
                                    onPressed: (){},
                                    icon: FaIcon(FontAwesomeIcons.dartLang,
                                      color: Colors.blueAccent,
                                      size: 25,
                                    ),
                                    mouseCursor: MouseCursor.defer,
                                  ),
                                  IconButton(
                                    onPressed: (){},
                                    icon: FaIcon(FontAwesomeIcons.flutter,
                                      color: Colors.blue,
                                      size: 25,
                                    ),
                                    mouseCursor: MouseCursor.defer,
                                  ),
                                  IconButton(
                                    onPressed: (){},
                                    icon: FaIcon(FontAwesomeIcons.java,
                                      color: Colors.red,
                                      size: 25,
                                    ),
                                    mouseCursor: MouseCursor.defer,
                                  ),
                                  IconButton(
                                    onPressed: (){},
                                    icon: Icon(DevIcons.springPlain,
                                      color: Colors.green,
                                      size: 25,
                                    ),
                                    mouseCursor: MouseCursor.defer,
                                  ),
                                  IconButton(
                                    onPressed: (){},
                                    icon: Icon(DevIcons.mysqlPlain,
                                      color: Colors.lightBlue,
                                      size: 25,
                                    ),
                                    mouseCursor: MouseCursor.defer,
                                  ),
                                  IconButton(
                                    onPressed: (){},
                                    icon: Icon(DevIcons.postgresqlPlain,
                                      color: Colors.blueAccent,
                                      size: 25,
                                    ),
                                    mouseCursor: MouseCursor.defer,
                                  ),
                                ],
                              ),
                              Text(
                                "Sou estudante de Ciência da Computação, sendo apaixonada por tecnologia, tenho base em desenvolvimento web e mobile. Atualmente estou estudando Java, com objetivo de me tornar fullstack. Estou sempre em busca de novos desafios e oportunidades para aprender e crescer na área da tecnologia.",
                                style: TextStyle(
                                  color: _color4,
                                  fontSize: isMobile(context) ? 14 : 16,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  IconButton(onPressed: () => _enterLink("mailto:grazielalucena8@gmail.com?subject=Dúvidas&body=Olá, gostaria de saber mais sobre..."),
                                    tooltip: "E-mail",
                                    icon: Icon(Icons.email,
                                      color: _color4,
                                      size: 30,
                                    ),
                                  ),
                                  IconButton(onPressed: () => _enterLink("https://www.linkedin.com/in/grazixzdev/"),
                                    tooltip: "LinkedIn",
                                    icon: FaIcon(FontAwesomeIcons.linkedin,
                                      color: _color4,
                                      size: 30,
                                    ),
                                  ),
                                  IconButton(onPressed: () => _enterLink("https://github.com/grazixzdev"),
                                    tooltip: "GitHub",
                                    icon: FaIcon(FontAwesomeIcons.github,
                                      color: _color4,
                                      size: 30,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          );
                        },
                      ),
                    ),
                    //
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}