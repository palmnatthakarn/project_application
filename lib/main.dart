import 'package:dialog_flowtter/dialog_flowtter.dart';
import 'package:flutter/material.dart';
import 'package:project_application/constants.dart';
import 'package:project_application/screens/admin/manage_dorms.dart';
import 'package:project_application/screens/admin/manage_users.dart';
import 'package:project_application/screens/messages/components/dormdetail.dart';
//import 'package:project_application/screens/messages/message_screen.dart';
import 'package:project_application/screens/welcome/welcome_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Welcome',
      theme: ThemeData(
        fontFamily: "poppins,NotoSansThai",
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: Colors.white,
      ),
      initialRoute: '/',
      routes: {
         '/manageDorms': (context) => ManageDormsScreen(),
      '/manageUsers': (context) => ManageUsersScreen(),
      },
      onGenerateRoute: (settings) {
        if (settings.name?.startsWith('/dorm-detail/') ?? false) {
          return MaterialPageRoute(
            builder: (context) => DormDetail(),
            settings: settings,
          );
        }
        return null;
      },
      // กำหนด onUnknownRoute เพื่อจัดการเมื่อไม่พบ route
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            body: Center(
              child: Text('Route not found!'),
            ),
          ),
        );
      },
      home: WelcomeScreen(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late DialogFlowtter dialogFlowtter;
  final TextEditingController _controller = TextEditingController();

  List<Map<String, dynamic>> messages = [];

  @override
  void initState() {
    super.initState();
    _setupDialogFlowtter();
  }

  void _setupDialogFlowtter() async {
    try {
      dialogFlowtter =
          await DialogFlowtter.fromFile(path: 'assets/dialog_flow_auth.json');
      print('DialogFlowtter initialized successfully');
    } catch (e) {
      print('Error initializing DialogFlowtter: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AMBot'),
        backgroundColor: Color(0xFF3C1A80),
      ),
      body: Column(
        children: [
          /*Expanded(
              child: MessagesScreen(
            messages: messages,
            onChipSelected: (String selected) {
              _sendMessage(selected);
            },
          )),*/
          _buildInputArea(),
        ],
      ),
    );
  }

  Widget _buildInputArea() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      color: Color(0xFF3C1A80),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _controller,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: 'Type a message...',
                hintStyle: TextStyle(color: Colors.white70),
                border: InputBorder.none,
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.send, color: Colors.white),
            onPressed: () => _sendMessage(_controller.text),
          ),
        ],
      ),
    );
  }

  void _sendMessage(String text) async {
    if (text.isEmpty) {
      print('Message is empty');
      return;
    }

    _addMessage(Message(text: DialogText(text: [text])), true);
    _controller.clear();

    try {
      DetectIntentResponse response = await dialogFlowtter.detectIntent(
        queryInput: QueryInput(text: TextInput(text: text)),
      );

      if (response.message == null) {
        print('Received null message from Dialogflow');
        return;
      }

      // ดึง QueryResult จาก response
      QueryResult? queryResult = response.queryResult;

      if (queryResult?.fulfillmentMessages != null) {
        // วนลูปผ่านทุก message ที่ได้รับ
        for (Message message in queryResult!.fulfillmentMessages!) {
          print('Processing message: $message');
          print('Message text: ${message.text}');
          print('Message payload: ${message.payload}');

          // สร้าง Message ใหม่สำหรับแต่ละ response
          Message botMessage = Message(
            text: message.text,
            payload: message.payload,
          );

          _addMessage(botMessage);
        }
      }
    } catch (e) {
      print('Error sending message to Dialogflow: $e');
      print('Stack trace: ${e.toString()}');
    }
  }

  void _addMessage(Message message, [bool isUserMessage = false]) {
    setState(() {
      messages.add({
        'message': message,
        'isUserMessage': isUserMessage,
      });
    });
  }

  @override
  void dispose() {
    dialogFlowtter.dispose();
    super.dispose();
  }
}

