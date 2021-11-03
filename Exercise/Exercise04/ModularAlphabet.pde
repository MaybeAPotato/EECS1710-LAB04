class ModularAlphabet{
  String theLetter;
  boolean debug = true;
  
  ModularAlphabet(){
    
  }
  
  void run(){
    update();
    draw();
  }
  
  void update(){
    switch(keyNum){
      case(65):
       theLetter = "A";
       break;
      case(66):
       theLetter = "B";
       break;
             case(67):
       theLetter = "C";
       break;
             case(68):
       theLetter = "D";
       break;
             case(69)://haha nice
       theLetter = "E";
       break;
             case(70):
       theLetter = "F";
       break;
             case(71):
       theLetter = "G";
       break;
             case(72):
       theLetter = "H";
       break;
             case(73):
       theLetter = "I";
       break;
             case(74):
       theLetter = "J";
       break;
             case(75):
       theLetter = "K";
       break;
             case(76):
       theLetter = "L";
       break;
             case(77):
       theLetter = "M";
       break;
             case(78):
       theLetter = "N";
       break;
             case(79):
       theLetter = "O";
       break;
             case(80):
       theLetter = "P";
       break;
             case(81):
       theLetter = "Q";
       break;
             case(82):
       theLetter = "R";
       break;
             case(83):
       theLetter = "S";
       break;
             case(84):
       theLetter = "T";
       break;
             case(85):
       theLetter = "U";
       break;
             case(86):
       theLetter = "V";
       break;
             case(87):
       theLetter = "W";
       break;
             case(88):
       theLetter = "X";
       break;
             case(89):
       theLetter = "Y";
       break;
             case(90):
       theLetter = "Z";
       break;
       
       default:
       theLetter = "PUSH A CHARACTER KEY";
       break;
    }
    
  }
  
  void draw(){
    
    
    
    //65 - 90 (A - Z)
    fill(0);
    textSize(32);
    text(theLetter,width/2,height/2);
  }
}
