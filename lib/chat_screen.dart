import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:t_minus_one/background.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final List<Map<String, String>> questions = [
    {
      'question': 'What is global warming?',
      'answer':
          'Global warming refers to the long-term rise in Earth’s average temperature, largely caused by increased concentrations of greenhouse gases in the atmosphere.'
    },
    {
      'question': 'What are greenhouse gases?',
      'answer':
          'Greenhouse gases, such as carbon dioxide (CO₂), methane (CH₄), and nitrous oxide (N₂O), trap heat in the atmosphere, leading to the greenhouse effect and contributing to global warming.'
    },
    {
      'question': 'How does carbon dioxide affect global warming?',
      'answer':
          'Carbon dioxide (CO₂) is one of the most significant greenhouse gases. When fossil fuels are burned for energy, CO₂ is released into the atmosphere, trapping heat and contributing to global warming.'
    },
    {
      'question': 'What are the effects of global warming?',
      'answer':
          'Global warming causes extreme weather patterns, rising sea levels, melting glaciers, and increased frequency of natural disasters, affecting ecosystems and human life.'
    },
    {
      'question': 'What is the greenhouse effect?',
      'answer':
          'The greenhouse effect is a natural process where certain gases in the atmosphere trap heat from the sun, keeping the Earth warm. However, human activities have increased greenhouse gas concentrations, intensifying this effect and leading to global warming.'
    },
    {
      'question': 'What can be done to reduce global warming?',
      'answer':
          'Reducing global warming involves actions like reducing carbon emissions, transitioning to renewable energy sources, improving energy efficiency, and protecting forests and oceans, which absorb CO₂.'
    },
    {
      'question': 'How does methane contribute to global warming?',
      'answer':
          'Methane (CH₄) is a potent greenhouse gas with a greater heat-trapping ability than CO₂, although it is present in smaller amounts. It is released from agriculture, livestock, and the decay of organic waste.'
    },
    {
      'question':
          'What is the role of renewable energy in fighting global warming?',
      'answer':
          'Renewable energy sources, such as wind, solar, and hydropower, produce little to no greenhouse gases during operation and are key to reducing reliance on fossil fuels, thereby mitigating global warming.'
    },
  ];

  List<bool> isAnswerVisible = [];
  List<bool> isLoading = [];

  @override
  void initState() {
    super.initState();
    // Initially, all answers are hidden and not loading
    isAnswerVisible = List.generate(questions.length, (index) => false);
    isLoading = List.generate(questions.length, (index) => false);
  }

  void showAnswerWithDelay(int index) async {
    // Start loading
    setState(() {
      isLoading[index] = true;
    });

    await Future.delayed(const Duration(seconds: 1));

    setState(() {
      isLoading[index] = false;
      isAnswerVisible[index] = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BackGround(
      image: 'assets/bg.jpg',
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: const Text(
            'Ask AI',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          backgroundColor: Colors.transparent,
        ),
        body: ListView.builder(
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
          itemCount: questions.length,
          itemBuilder: (context, index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    if (!isAnswerVisible[index]) {
                      showAnswerWithDelay(index);
                    }
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    padding: const EdgeInsets.all(12.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.blueAccent),
                      borderRadius: BorderRadius.circular(15.0),
                      color: Colors.grey.shade200,
                    ),
                    child: Text(
                      questions[index]['question']!,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                // Loading indicator
                if (isLoading[index])
                  const Padding(
                    padding: EdgeInsets.only(left: 40.0, bottom: 8.0),
                    child: SpinKitWave(
                      color: Colors.white,
                      size: 20.0,
                    ),
                  ),
                if (isAnswerVisible[index] && !isLoading[index])
                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      margin: const EdgeInsets.only(left: 40.0, bottom: 8.0),
                      padding: const EdgeInsets.all(12.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.greenAccent),
                        borderRadius: BorderRadius.circular(15.0),
                        color: Colors.lightGreen.shade100,
                      ),
                      child: Text(
                        questions[index]['answer']!,
                        style: const TextStyle(
                          fontSize: 16,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }
}
