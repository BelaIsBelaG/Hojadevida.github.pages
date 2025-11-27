import 'package:flutter/material.dart';

void main() {
  runApp(const Principal());
}

class Principal extends StatelessWidget {
  const Principal({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "IsaCorp",
      debugShowCheckedModeBanner: false,
      home: iniciarSesion(),
    );
  }
}

///Página de registro
class iniciarSesion extends StatefulWidget {
  const iniciarSesion({super.key});

  @override
  State<iniciarSesion> createState() => _iniciarSesionState();
}

class _iniciarSesionState extends State<iniciarSesion> {
  final TextEditingController userCtrl = TextEditingController();
  final TextEditingController passCtrl = TextEditingController();

  //Credenciales permitidas
  final String usuarioCorrecto = "Isabela";
  final String contrasenaCorrecta = "1234";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Inicio de sesión"),
        backgroundColor: Colors.pinkAccent,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.lock, size: 120, color: Colors.pink),
            TextField(
              controller: userCtrl,
              decoration: const InputDecoration(
                labelText: "Usuario",
                prefixIcon: Icon(Icons.person),
              ),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: passCtrl,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: "Contraseña",
                prefixIcon: Icon(Icons.key),
              ),
            ),
            const SizedBox(height: 25),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pink,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: 12,
                ),
              ),
              onPressed: () {
                if (userCtrl.text == usuarioCorrecto &&
                    passCtrl.text == contrasenaCorrecta) {
                  //Ir a Hoja de Vida
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const Base()),
                  );
                } else {
                  //Ir a página de error
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const InvalidCredentialsPage(),
                    ),
                  );
                }
              },
              child: const Text("Ingresar"),
            ),
          ],
        ),
      ),
    );
  }
}

//Error si no es un usuario válido
class InvalidCredentialsPage extends StatelessWidget {
  const InvalidCredentialsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red.shade100,
      appBar: AppBar(
        title: const Text("Error"),
        backgroundColor: Colors.redAccent,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error, size: 120, color: Colors.red),
            const SizedBox(height: 20),
            const Text(
              "Credenciales inválidas",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Volver"),
            ),
          ],
        ),
      ),
    );
  }
}

class Base extends StatefulWidget {
  const Base({super.key});

  @override
  State<Base> createState() => _BaseState();
}

class _BaseState extends State<Base> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mi hoja de vida"),
        backgroundColor: const Color.fromRGBO(255, 89, 219, 1),
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Center(
            child: CircleAvatar(
              radius: 90,
              backgroundImage: AssetImage("assets/images/perfil.jpg"),
            ),
          ),
          Card(
            color: const Color.fromARGB(255, 255, 106, 223),
            child: ListTile(
              title: Text("Informacion Personal"),
              leading: Icon(Icons.person),
              trailing: Icon(Icons.arrow_drop_down),
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  builder: (context) {
                    return Scaffold(
                      appBar: AppBar(
                        title: Text("Información Personal"),
                        backgroundColor: Colors.pinkAccent,
                        foregroundColor: Colors.white,
                      ),
                      body: ListView(
                        padding: EdgeInsets.all(16),
                        children: [
                          Text(
                            "Datos Personales",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          SizedBox(height: 10),

                          ...infoPersonal.entries.map(
                            (item) => Card(
                              child: ListTile(
                                title: Text(item.key),
                                subtitle: Text(item.value),
                                leading: Icon(
                                  Icons.person,
                                  color: Colors.pinkAccent,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          ),
          Card(
            color: const Color.fromARGB(255, 255, 89, 241),
            child: ListTile(
              title: Text("Estudios Realizados"),
              leading: Icon(Icons.school),
              trailing: Icon(Icons.arrow_drop_down),
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  builder: (r) {
                    return Scaffold(
                      floatingActionButton: FloatingActionButton(
                        backgroundColor: const Color.fromARGB(
                          255,
                          252,
                          89,
                          238,
                        ),
                        foregroundColor: Colors.white,
                        child: Icon(Icons.plus_one),
                        onPressed: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (r) {
                              return Scaffold(
                                appBar: AppBar(
                                  title: Text("Nuevos Estudios"),
                                  backgroundColor: const Color.fromARGB(
                                    255,
                                    209,
                                    8,
                                    209,
                                  ),
                                  foregroundColor: Colors.white,
                                ),
                                body: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Column(
                                    //caja de texto
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
                      appBar: AppBar(
                        title: Text("Estudios Realizados"),
                        backgroundColor: const Color.fromARGB(
                          255,
                          174,
                          105,
                          175,
                        ),
                        foregroundColor: Colors.white,
                      ),
                      body: ListView.builder(
                        itemCount: estudios.length,
                        itemBuilder: (BuildContext context, int index) {
                          return ListTile(
                            title: Text(
                              estudios[index]["titulo"],
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(
                              estudios[index]["descripcion"],
                              style: TextStyle(fontStyle: FontStyle.italic),
                            ),
                            trailing: Text(estudios[index]["fecha"]),
                            onTap: () {
                              showModalBottomSheet(
                                context: context,
                                builder: (r) {
                                  return Scaffold(
                                    appBar: AppBar(
                                      title: Text(estudios[index]["titulo"]),
                                    ),
                                    body: Column(
                                      children: [
                                        Card(
                                          color: Colors.greenAccent,
                                          child: ListTile(
                                            title: Text("Actualizar"),
                                            leading: Icon(Icons.update),
                                          ),
                                        ),
                                        Card(
                                          color: Colors.red,
                                          child: ListTile(
                                            title: Text("Eliminar"),
                                            leading: Icon(Icons.delete),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              );
                            },
                          );
                        },
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

final List<Map<String, dynamic>> estudios = [
  {
    'titulo': 'Bachiller técnico con especialidad Agropecuario',
    'fecha': '2020-11-29',
    'descripcion':
        'Bachiller con conocimientos en producción agrícola, ganadera y manejo sostenible del medio ambiente.',
  },
  {
    'titulo': 'Curso especial en taller de emprendimiento',
    'fecha': '2019-11-28',
    'descripcion':
        'Curso especial en taller de emprendimiento impartido por SENA',
  },
  {
    'titulo': 'Certificado de Gestión de informacion en la nube',
    'fecha': '2020-11-11',
    'descripcion':
        'Certificado de gestión de información en la nube por por Geek Girls Latam',
  },
  {
    'titulo': 'Tecnologías de la 4ta revolución industrial',
    'fecha': '2020-12-21',
    'descripcion':
        'Certificado de tecnologías de la 4ta revolución industrial por por Geek Girls Latam',
  },
  {
    'titulo': 'Básico en agricultura ecológica',
    'fecha': '2021-01-29',
    'descripcion': 'Certificado básico en agricultura ecológica por SENA',
  },
  {
    'titulo': 'Bases de Datos SQL',
    'fecha': '2025-06-18',
    'descripcion': 'Modelado de datos y consultas en MySQL',
  },
  {
    'titulo': 'Ingeniería de software',
    'fecha': '2024-05-28',
    'descripcion':
        'Curso de ingeniería de software por la Universidad Antonio Jose Camacho',
  },
  {
    'titulo': 'Introducción a la ciencia de datos',
    'fecha': '2025-06-03',
    'descripcion':
        'Certificado de introducción a la ciencia de datos por Ie university',
  },
  {
    'titulo': 'Redes',
    'fecha': '2025-11-24',
    'descripcion': 'Curso de redes I por la Universidad Antonio Jose Camacho',
  },
  {
    'titulo': 'Curso de Arquitectura de Sistemas Computacionales',
    'fecha': '2025-06-20',
    'descripcion':
        'Curso de Arquitectura de Sistemas Computacionales por la Universidad Antonio Jose Camacho',
  },
  {
    'titulo': 'Programación',
    'fecha': '2023-11-28',
    'descripcion': 'Curso de programación orientada a objetos usando Java',
  },
  {
    'titulo': 'Fundamentos web',
    'fecha': '2024-05-28',
    'descripcion': 'Curso de fundamentos web, HTML, CSS & JavaScript',
  },
];

////////////////////
final List<Map<String, dynamic>> experiencias = [
  {
    'puesto': 'Desarrollador Flutter',
    'empresa': 'TechSolutions',
    'ubicacion': 'Ciudad de México, México',
    'fechaInicio': '2023-01-10',
    'fechaFin': '2024-06-30',
    'tecnologiaPrincipal': 'Flutter',
    'nivelExperiencia': 'Intermedio',
    'descripcion':
        'Desarrollo de aplicaciones móviles multiplataforma para clientes bancarios.',
  },
  {
    'puesto': 'Ingeniero de Datos',
    'empresa': 'DataCorp',
    'ubicacion': 'Bogotá, Colombia',
    'fechaInicio': '2022-04-01',
    'fechaFin': '2023-12-15',
    'tecnologiaPrincipal': 'Python',
    'nivelExperiencia': 'Avanzado',
    'descripcion':
        'Automatización de procesos ETL y análisis de datos para inteligencia de negocio.',
  },
  {
    'puesto': 'Administrador de Sistemas',
    'empresa': 'InfraRedes S.A.',
    'ubicacion': 'Santiago, Chile',
    'fechaInicio': '2021-06-01',
    'fechaFin': '2022-03-30',
    'tecnologiaPrincipal': 'Linux',
    'nivelExperiencia': 'Intermedio',
    'descripcion':
        'Mantenimiento de servidores, redes internas y políticas de respaldo.',
  },
  {
    'puesto': 'Desarrollador Backend',
    'empresa': 'CodeWorks',
    'ubicacion': 'Buenos Aires, Argentina',
    'fechaInicio': '2020-01-15',
    'fechaFin': '2021-05-20',
    'tecnologiaPrincipal': 'Node.js',
    'nivelExperiencia': 'Junior',
    'descripcion':
        'Implementación de APIs REST y conexión con bases de datos SQL.',
  },
  {
    'puesto': 'Especialista en Ciberseguridad',
    'empresa': 'SecureNet',
    'ubicacion': 'Madrid, España',
    'fechaInicio': '2019-08-10',
    'fechaFin': '2020-12-01',
    'tecnologiaPrincipal': 'Wireshark',
    'nivelExperiencia': 'Avanzado',
    'descripcion':
        'Auditorías de seguridad, detección de vulnerabilidades y formación a empleados.',
  },
];

//Agregue esta parte para la información personal
final Map<String, String> infoPersonal = {
  'Nombre': 'Isabela',
  'Apellido': 'Carabali Gonzalez',
  'Documento': '1106513303',
  'Fecha de nacimiento': '2003-10-08',
  'Ciudad': 'Santiago de Cali',
  'Dirección': 'Calle 123 #45-67',
  'Teléfono': '+57 314 655 9876',
  'Correo': 'icarabali@estudiante.uniajc.edu.co',
};
