ArrayList<ArrayList<Particle>> particleGeneration;  // 各点の位置用
ArrayList<ArrayList<Connection>> connectionGeneration;  // 各点を繋ぐ線用
ArrayList<ArrayList<Connection>> boneGeneration;  // 外から内に向かう線用

int count = 12;
int radius;
int distance = 360 / count;

void setup() {
  size(displayWidth, displayHeight);
  
  radius = displayHeight / 2;
  particleGeneration = new ArrayList();
  connectionGeneration = new ArrayList();
  boneGeneration = new ArrayList();
  
  for (int k = 0; radius > 0; k++) {
    ArrayList<Particle> particles = new ArrayList();
    ArrayList<Connection> connections = new ArrayList();
    
    for (int i = 0; i < count; i++) {
      // 点を作成
      Particle particle = new Particle(new PVector(radius * cos(radians(i*distance)), radius * sin(radians(i*distance))));
      particles.add(particle);
      
      // 点同士を繋ぐ線を作成
      if (i != 0) {
        Connection connection = new Connection(particle, particles.get(i-1));
        connections.add(connection);
      }
      if (i == count - 1) {
        Connection connection = new Connection(particle, particles.get(0));
        connections.add(connection);
      }
    }
    
    particleGeneration.add(particles);
    connectionGeneration.add(connections);
    
    // 外から内に向かう線を作成
    for (int i = 0; i < count; i++) {
      if (k != 0) {
        ArrayList<Connection> bones = new ArrayList();
        Connection bone = new Connection(particleGeneration.get(k).get(i), particleGeneration.get(k-1).get(i));
        bones.add(bone);
        boneGeneration.add(bones);
      }
    }
  
    radius -= radius * 0.1;
  }
}

void draw() {
  background(0);
  translate(width/2, height/2);
  for (ArrayList<Particle> p : particleGeneration) {
    for (Particle particle : p) {
      particle.update();
      particle.display();
    }
  }
  for (ArrayList<Connection> c : connectionGeneration) {
    for (Connection connection : c) {
      connection.display();
    }
  }
  for (ArrayList<Connection> b : boneGeneration) {
    for (Connection bone : b) {
      bone.display();
    }
  }
}
