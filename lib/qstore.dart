import 'question.dart';

class Qstore {
  int _questionNumber = 0;
  List<Question> _questions = [
    Question('You can lead a cow down stairs but not up stairs.', true),
    Question(
        'Approximately one quarter of human bones are in the feet.', false),
    Question('A slug\'s blood is green.', true),
    Question('Bangladesh is a land of robbers.', false),
    Question('Bangladesh is a land of robbers.', false),
  ];
  void nextQuestion() {
    if (_questionNumber < _questions.length - 1) {
      _questionNumber++;
    }
    print(_questionNumber);
    print(_questions.length);
  }

  getQuestion() {
    return _questions[_questionNumber].questionText;
  }

  getCorrectAnswer() {
    return _questions[_questionNumber].questionAnswer;
  }

  getFinished() {
    if (_questionNumber == _questions.length - 1) {
      return true;
    } else {
      return false;
    }
  }

  getReset() {
    _questionNumber = 0;
  }
}
