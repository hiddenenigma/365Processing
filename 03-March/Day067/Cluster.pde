// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

class Cluster {

  ArrayList<Node> nodes;

  // We’ll use this variable for the rest
  // length between all the nodes.
  float diameter;

  Cluster(int n, float d, Vec2D center) {
    nodes = new ArrayList<Node>();
    diameter = d;
    for (int i = 0; i < n; i++) {
      //[offset-down] Here’s a funny little detail.  We’re going to have a problem
      // if all the Node objects start in exactly the same location.
      // So we add a random vector to the center location so that each
      // Node is slightly offset.
      nodes.add(new Node(center.add(Vec2D.randomVector())));
     } 
       for (int i = 0; i < nodes.size()-1; i++) {
      VerletParticle2D ni = nodes.get(i);
            // Look how we start j at i + 1.
      for (int j = i+1; j < nodes.size(); j++) { //[bold]
        VerletParticle2D nj = nodes.get(j);
                // The Spring connects Nodes “ni” and “nj”.
        physics.addSpring(new VerletSpring2D(ni,nj,diameter,0.0003));
      }
    }
  }

    
    
  void display() {
 for (int i = 0; i < nodes.size(); i++) {
      Node n = (Node) nodes.get(i);
      n.display();
      
    }
   }
   
   void showConnections() {
    stroke(255,10);
    strokeWeight(.5);
    for (int i = 0; i < nodes.size(); i++) {
      VerletParticle2D pi = (VerletParticle2D) nodes.get(i);
      for (int j = i+1; j < nodes.size(); j++) {

        VerletParticle2D pj = (VerletParticle2D) nodes.get(j);
        line(pi.x,pi.y,pj.x,pj.y);
        }
      }
    }
  }

  
  
