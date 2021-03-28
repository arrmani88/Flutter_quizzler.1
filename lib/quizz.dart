class Quizz {
  List<Item> _questionsList = [
    Item('QST1 IS TRUE', true),
    Item('QST2 IS FALSE', false),
    Item('QST3 IS FALSE', false),
    Item('QST4 IS TRUE', true),
    Item('QST5 IS TRUE', true),
    Item('QST6 IS FALSE', false),
    Item('QST7 IS TRUE', true),
  ];
  int itemNb = 0;

  void getNextItem() {
      itemNb++;
  }
  void  resetItemIndex(){
    itemNb = 0;
  }
  String retQuestion(){
    return _questionsList[itemNb].question;
  }
  bool retAnswer(){
    return _questionsList[itemNb].corrAnswer;
  }

  int listLen(){
    return _questionsList.length;
  }
}

class Item {
  String question;
  bool corrAnswer;

  Item(this.question, this.corrAnswer);
}