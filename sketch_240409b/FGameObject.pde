class FGameObject extends FBox {
  //final int L=-1;
  //final int R=1;
  //final int D=1;

  FGameObject() {
    super(gridSize-10, gridSize-10);
  }

  void act() {
  }

  //make better ocode for this, for touching
  boolean isTouching(String n) {
    ArrayList<FContact> contacts =getContacts();//list of things tougching
    for (int i=0; i<contacts.size(); i++) {//look @each contact item one at time
      FContact c = contacts.get(i);
      if (c.contains(n)) {
        return true;
      }
    }
    return false;
  }
}
