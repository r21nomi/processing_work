ArrayList<ArrayList<Particle>> particleGeneration;
ArrayList<ArrayList<Connection>> connectionGeneration;
ArrayList<ArrayList<Connection>> boneGeneration;

int count = 10;
int radius = 300;
int distance = 360 / count;

void setup() {
  size(displayWidth, displayHeight);
  
  particleGeneration = new ArrayList();
  connectionGeneration = new ArrayList();
  boneGeneration = new ArrayList();
  
  for (int k = 0; radius > 0; k++) {
    ArrayList<Particle> particles = new ArrayList();
    ArrayList<Connection> connections = new ArrayList();
    
    for (int i = 0; i < count; i++) {
      Particle particle = new Particle(new PVector(radius * cos(radians(i*distance)), radius * sin(radians(i*distance))));
      particles.add(particle);
      
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
    
    for (int i = 0; i < count; i++) {
      if (k != 0) {
        ArrayList<Connection> bones = new ArrayList();
        for (int h = 0, len = particleGeneration.get(k).size(); h < len; h++) {
          Connection bone = new Connection(particleGeneration.get(k).get(h), particleGeneration.get(k-1).get(h));
          bones.add(bone);
        }
        boneGeneration.add(bones);
      }
    }
  
    radius -= 30;
  }
}

void draw() {
  background(#ffffff);
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
  for (ArrayList<Connection> c : boneGeneration) {
    for (Connection bone : c) {
      bone.display();
    }
  }
}
