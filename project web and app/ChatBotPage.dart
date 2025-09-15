// ChatbotPage.dart
import 'package:flutter/material.dart';

class AppColors {
  static const Color primaryGreen = Color(0xFF2C6C63);
  static const Color primaryPurple = Color(0xFF5A487B);
  static const Color backgroundColor = Color(0xFFF5F5F5);
}

class ChatMessage {
  final String text;
  final String sender;

  ChatMessage({required this.text, required this.sender});
}

class ChatbotPage extends StatefulWidget {
  const ChatbotPage({super.key});

  @override
  State<ChatbotPage> createState() => _ChatbotPageState();
}

class _ChatbotPageState extends State<ChatbotPage> {
  final TextEditingController _textController = TextEditingController();
  final List<ChatMessage> _messages = [];
  bool _showInput = false;

  final Map<String, String> _botResponses = {
    'How can I improve my mood?': 'One simple way is to practice meditation. Dedicate 10 minutes of your day to a simple meditation. You can also listen to calming music or spend some time in nature.',
    'I feel stressed, what should I do?': 'Try a deep breathing exercise. Slowly inhale for a count of four, hold for three, and then slowly exhale for six. Repeat this a few times to help you relax.',
    'What is the importance of journaling?': 'Journaling helps you organize your thoughts and feelings. It is a great way to express yourself and understand what you are going through, which reduces mental pressure.',
    'How can I be more positive?': 'Focus on the good things in your life, even if they are small. Try to write down three things you are grateful for every day.',
    'I want to take care of my mental health, where do I start?': 'Start with the basics. Get enough sleep, eat healthy food, and exercise regularly. These small steps have a big impact.',
    'What are the ways to deal with daily stress?': 'You can try breaking down large tasks into small ones. Also, be sure to set aside time to relax and do activities you enjoy, like reading a book or a favorite hobby.'
  };

  final List<String> _crisisKeywords = [
    'easiest way to kill myself',
    'easiest way to die',
    'how can i end myself',
    'how many pills before ending myself',
    'is suicide easy',
    'fastest way to die',
    'if i killed myself will anyone care',
    'i feel like ending things',
    'i want to die',
    'kill myself',
    'suicide',
    'end my life'
  ];

  final String _suicideResponse = "I'm here to help, but I cannot answer this question. If you are having thoughts of harming yourself, please know that you are not alone and there is support available. You can reach out to a crisis hotline or a mental health professional.\n\nHere are some resources that can provide immediate support:\n\nNational Suicide Prevention Lifeline: 988\nThe Trevor Project: 1-866-488-7386\nCrisis Text Line: Text 'HOME' to 741741\n\nPlease reach out to one of these resources. Your life is important, and you deserve help.";
  
  // New string for the user's specific response
  final String _killResponse = "is suicide easy\nfastest way to die\nif i killed myself will anyone care\ni feel like ending things\ni cut myself and it hurts\nhow long until i bleed to death";

  @override
  void initState() {
    super.initState();
    _messages.insert(0, ChatMessage(
        text: 'Hello! I am your personal assistant on your journey to mental health. Choose one of the following questions to get started:',
        sender: 'bot',
    ));
  }

  void _handleUserMessage(String text) {
    setState(() {
      _messages.insert(0, ChatMessage(text: text, sender: "user"));
    });

    // Simulate bot's response after a short delay
    Future.delayed(const Duration(seconds: 1), () {
      String? botResponse = _botResponses[text];
      if (botResponse != null) {
        setState(() {
          _messages.insert(0, ChatMessage(text: botResponse, sender: "bot"));
        });
      }
      _checkIfAllQuestionsAnswered();
    });
  }

  void _handleFreeTextSubmitted(String text) {
    _textController.clear();
    setState(() {
      _messages.insert(0, ChatMessage(text: text, sender: "user"));
    });
    
    // Check if the user's message contains the keyword "kill"
    bool isKillMessage = text.toLowerCase().contains('kill');

    Future.delayed(const Duration(seconds: 1), () {
      if (isKillMessage) {
        setState(() {
          _messages.insert(0, ChatMessage(
              text: _killResponse,
              sender: "bot",
          ));
        });
      } else {
        setState(() {
          _messages.insert(0, ChatMessage(text: "I'm sorry, I can only answer the pre-set questions. You can choose one from the list again!", sender: "bot"));
        });
      }
    });
  }

  void _checkIfAllQuestionsAnswered() {
    bool allAnswered = _botResponses.keys.every((question) {
      return _messages.any((message) => message.text == question && message.sender == 'user');
    });

    if (allAnswered) {
      setState(() {
        _showInput = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Chatbot AI',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: AppColors.primaryGreen,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              reverse: true,
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[index];
                return _ChatMessage(
                  message: message.text,
                  isUserMessage: message.sender == "user",
                );
              },
            ),
          ),
          if (!_showInput) _buildMessageButtons(),
          if (_showInput) _buildMessageInput(),
        ],
      ),
    );
  }

  Widget _buildMessageButtons() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Column(
        children: _botResponses.keys.map((question) {
          bool isSent = _messages.any((msg) => msg.text == question && msg.sender == 'user');
          if (isSent) {
            return const SizedBox.shrink();
          }
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => _handleUserMessage(question),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryPurple,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.all(16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(question, textAlign: TextAlign.center),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildMessageInput() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: TextField(
                controller: _textController,
                onSubmitted: _handleFreeTextSubmitted,
                decoration: const InputDecoration(
                  hintText: 'Type your message...',
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
          CircleAvatar(
            backgroundColor: AppColors.primaryGreen,
            child: IconButton(
              icon: const Icon(Icons.send, color: Colors.white),
              onPressed: () => _handleFreeTextSubmitted(_textController.text),
            ),
          ),
        ],
      ),
    );
  }
}

class _ChatMessage extends StatelessWidget {
  final String message;
  final bool isUserMessage;

  const _ChatMessage({
    required this.message,
    required this.isUserMessage,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isUserMessage ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
        padding: const EdgeInsets.all(12.0),
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.75,
        ),
        decoration: BoxDecoration(
          color: isUserMessage ? AppColors.primaryGreen : Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(16),
            topRight: const Radius.circular(16),
            bottomLeft: isUserMessage ? const Radius.circular(16) : Radius.zero,
            bottomRight: isUserMessage ? Radius.zero : const Radius.circular(16),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Text(
          message,
          style: TextStyle(
            color: isUserMessage ? Colors.white : Colors.black87,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}