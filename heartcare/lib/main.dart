import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(const HeartCareApp());

class HeartCareApp extends StatelessWidget {
  const HeartCareApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'HeartCare',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SplashScreen(),
    );
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Bienvenido a HaertCare',
              style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
            ),
            const Text('Tu compañera de salud cardiaca',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                );
              },
              child: const Text('Comenzar'),
            ),
          ],
        ),
      ),
    );
  }
}

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inicio de Sesión'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const TextField(
              decoration: InputDecoration(
                labelText: 'Usuario',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Contraseña',
                border: OutlineInputBorder(),
              ),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const HeartCare()),
                );
              },
              child: const Text('Iniciar Sesión'),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SignUpPage()),
                );
              },
              child: const Text('¿No tienes cuenta? Regístrate aquí'),
            ),
          ],
        ),
      ),
    );
  }
}

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  void _showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registro'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                // Implementar registro con correo electrónico
                 //_showSnackBar(context, 'Registro con Correo Electrónico exitoso.');
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HeartCare()),
                );
              },
              child: const Text('Registrarse con Correo Electrónico'),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () {
                // Simula el registro con Google
               Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HeartCare()),
                );
                _showSnackBar(context, 'Registro con Google exitoso.');
              },
              icon: const Icon(Icons.g_mobiledata),
              label: const Text('Registrarse con Google'),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () {
                // Simula el registro con Facebook  
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HeartCare()),
                );
                _showSnackBar(context, 'Registro con Facebook exitoso.');
              },
              icon: const Icon(Icons.facebook),
              label: const Text('Registrarse con Facebook'),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil de Usuario'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Menú de Configuración',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Configuración de la App'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SettingsPage()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Cerrar sesión'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                );
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage('https://example.com/profile.jpg'), 
            ),
            const SizedBox(height: 20),
            Text(
              'Juan Pérez',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 10),
            Text(
              'Desarrollador Flutter',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const EditProfilePage()),
                );
              },
              child: const Text('Editar Perfil'),
            ),
          ],
        ),
      ),
    );
  }
}

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Configuración de la App'),
      ),
      body: const Center(
        child: Text(
          'Aquí puedes añadir las opciones de configuración de la aplicación.',
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Editar Perfil'),
      ),
      body: const Center(
        child: Text(
          'Aquí puedes editar la información del perfil.',
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}

class HeartCare extends StatelessWidget {
   const HeartCare({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'HeartCare - Inicio',
      theme: ThemeData(primarySwatch: Colors.red),
      home: const _HomePage(),
    );
  }
}

class _HomePage extends StatefulWidget {
   const _HomePage({Key? key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<_HomePage> {
  int _selectedIndex = 0;

  static final List<Widget> _pages = <Widget>[
    const DashboardPage(),
    const StatsPage(),
    const MedicationsPage(),
    const ProfilePage(),
    const EmergencyPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HeartCare'),
        centerTitle: true,
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Colors.black,
              ), 
              label: 'Inicio'
            ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.show_chart,
              color: Colors.black,
            ), 
            label: 'Estadísticas'
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.medical_services,
              color: Colors.black,
            ), 
            label: 'Medicamentos'
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              color: Colors.black,            
            ), 
            label: 'Perfil'
          )
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: const Color.fromARGB(255, 2, 2, 2),
        onTap: _onItemTapped,
      ),
    );
  }
}

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Panel Principal', style: Theme.of(context).textTheme.headlineSmall),
          const SizedBox(height: 16),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              MetricCard(icon: FontAwesomeIcons.heartPulse, value: '72', label: 'Ritmo Cardíaco', color: Colors.red),
              MetricCard(icon: FontAwesomeIcons.stethoscope, value: '120/80', label: 'Presión Arterial', color: Colors.blue),
              MetricCard(icon: FontAwesomeIcons.personWalking, value: '8,467', label: 'Pasos', color: Colors.green),
            ],
          ),
          const SizedBox(height: 16),
          const ReminderSection(
            title: 'Próximos Medicamentos',
            items: [
              ReminderItem(label: 'Aspirina 100mg', time: '8:00 AM'),
              ReminderItem(label: 'Enalapril 10mg', time: '2:00 PM'),
            ],
          ),
          const SizedBox(height: 16),
          const ReminderSection(
            title: 'Próxima Cita',
            items: [
              ReminderItem(label: 'Dr. González - Cardiólogo', time: 'Mar 15'),
            ],
          ),
          const SizedBox(height: 16),
          ElevatedButton.icon(
            onPressed: () async {
              final Uri phoneUri = Uri(scheme: 'tel', path: '911');
              if (await canLaunchUrl(phoneUri)) {
                await launchUrl(phoneUri);
              } else {
                throw 'Could not launch $phoneUri';
              }
            },
            icon: const Icon(FontAwesomeIcons.truckMedical),
            label: const Text('Llamada de Emergencia'),
          ),
        ],
      ),
    );
  }
}

class MetricCard extends StatelessWidget {
  final IconData icon;
  final String value;
  final String label;
  final Color color;

  const MetricCard({
    Key? key,
    required this.icon,
    required this.value,
    required this.label,
    required this.color,
  }) :super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: color, size: 40),
            Text(value, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            Text(label),
          ],
        ),
      ),
    );
  }
}

class ReminderSection extends StatelessWidget {
  final String title;
  final List<ReminderItem> items;

const ReminderSection({
  Key? key, 
  required this.title,
  required this.items,
}) : super(key: key); 

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Column(children: items),
          ],
        ),
      ),
    );
  }
}

class ReminderItem extends StatelessWidget {
  final String label;
  final String time;

 const ReminderItem({
    Key? key,
    required this.label,
    required this.time,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label),
          Text(time, style: const TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}

class StatsPage extends StatelessWidget {
   const StatsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Estadísticas de Salud', style: Theme.of(context).textTheme.headlineSmall),
          const SizedBox(height: 16),
          Card(
            elevation: 4,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Ritmo Cardíaco (Últimos 7 días)', style: Theme.of(context).textTheme.headlineMedium),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 200,
                    child: LineChart(
                      LineChartData(
                        lineBarsData: [
                          LineChartBarData(
                            spots: [
                              const FlSpot(0, 70),
                              const FlSpot(1, 72),
                              const FlSpot(2, 75),
                              const FlSpot(3, 73),
                              const FlSpot(4, 74),
                              const FlSpot(5, 76),
                              const FlSpot(6, 72),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          Card(
            elevation: 4,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Presión Arterial', style: Theme.of(context).textTheme.headlineMedium),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 200,
                    child: LineChart(
                      LineChartData(
                        lineBarsData: [
                          LineChartBarData(
                            spots: [
                              const FlSpot(0, 120),
                              const FlSpot(1, 122),
                              const FlSpot(2, 118),
                              const FlSpot(3, 121),
                              const FlSpot(4, 119),
                              const FlSpot(5, 123),
                              const FlSpot(6, 120),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MedicationsPage extends StatelessWidget {
   const MedicationsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Mis Medicamentos', style: Theme.of(context).textTheme.headlineSmall),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              // Acción para agregar medicamento
            },
            child: const Text('Agregar Medicamento'),
          ),
          const SizedBox(height: 16),
          const MedicationCard(
            name: 'Aspirina',
            time: '8:00 AM',
          ),
          const MedicationCard(
            name: 'Enalapril',
            time: '2:00 PM',
          ),
        ],
      ),
    );
  }
}

class MedicationCard extends StatelessWidget {
  final String name;
  final String time;

  const MedicationCard({
    Key? key,
    required this.name,
    required this.time,
  }):super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: ListTile(
        title: Text(name),
        subtitle: Text(time),
        leading: const Icon(Icons.medical_services),
      ),
    );
  }
}

class EmergencyPage extends StatelessWidget {
  const EmergencyPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () async {
          final Uri phoneUri = Uri(scheme: 'tel', path: '911');
          if (await canLaunchUrl(phoneUri)) {
            await launchUrl(phoneUri);
          } else {
            throw 'Could not launch $phoneUri';
          }
        },
        child: const Text('Llamar a Emergencias'),
      ),
    );
  }
}


class ProfilePag extends StatelessWidget {
  const ProfilePag({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil de Usuario'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Menú de Configuración',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Configuración de la App'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SettingsPage()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Cerrar sesión'),
              onTap: () {
                Navigator.pop(context);
                // Navegar a la pantalla de inicio de sesión
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                );
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage('https://example.com/profile.jpg'), // Cambia esta URL por una imagen real
            ),
            const SizedBox(height: 20),
            Text(
              'Juan Pérez',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 10),
            Text(
              'Desarrollador Flutter',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const EditProfilePage()),
                );
              },
              child: const Text('Editar Perfil'),
            ),
          ],
        ),
      ),
    );
  }
}

class SettingsPag extends StatelessWidget {
  const SettingsPag({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Configuración de la App'),
      ),
      body: const Center(
        child: Text(
          'Aquí puedes añadir las opciones de configuración de la aplicación.',
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}

class EditProfilePag extends StatelessWidget {
  const EditProfilePag({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Editar Perfil'),
      ),
      body: const Center(
        child: Text(
          'Aquí puedes editar la información del perfil.',
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
