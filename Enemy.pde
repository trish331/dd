class Enemy extends GameObject {

  Enemy() {
    location = new PVector (width/2, height/2);
    velocity = new PVector (0, 0);
    hp = 100;
    size = 50;
    roomX = 1;
    roomY= 1;
  }

  void show () {

    stroke (black);
    strokeWeight (2);
    fill (dark);
    circle(location.x, location.y, size);
    fill (black);
    textSize (20);
    text(hp, location.x, location.y);
  }
  
  void act () {
    super.act();
    
    int i =0;
    while (i <myObjects.size()){
      GameObject obj = myObjects.get(i);
      if (obj instanceof Bullet) {
        float d = dist(obj.location.x, obj.location.y, location.x, location.y);
        if (d<= size/2 + obj.size/2) {
          hp = hp - int(obj.velocity.mag());
          obj.hp=0;
        }
      }
      i++;
    }
    
    
  }
}
