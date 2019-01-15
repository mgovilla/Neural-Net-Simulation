class NeuralNet {
  
  int iNodes, hNodes1, hNodes2, oNodes;
  
  Matrix wih; // matrix containing weights between the input nodes and the hidden nodes
  Matrix whh; // matrix containing weights between the hidden nodes and the second layer hidden nodes
  Matrix who; // matrix containing weights between the second hidden layer nodes and the output nodes
  
  Matrix inputs, hidden1, hidden2, outputs;
  
  NeuralNet(int in, int h1, int h2, int out) {
    //set dimensions from parameters
    iNodes = in;
    oNodes = out;
    hNodes1 = h1;
    hNodes2 = h2;


    //create first layer weights 
    //included bias weight
    wih = new Matrix(hNodes1, iNodes +1);

    //create second layer weights
    //include bias weight
    whh = new Matrix(hNodes2, hNodes1 +1);

    //create second layer weights
    //include bias weight
    who = new Matrix(oNodes, hNodes2 +1);  

    //set the matricies to random values
    wih.randomize();
    whh.randomize();
    who.randomize();
    
    inputs   = new Matrix(iNodes, 1);
    hidden1  = new Matrix(hNodes1, 1);
    hidden2  = new Matrix(hNodes2, 1);
    outputs   = new Matrix(oNodes, 1);
    
  }
  
  
  
  void train(int iterations, float[] vision) {
    inputs.randomize();
    
    for(int i = 0; i < iterations; i++) {
      output(vision);
      //Matrix adjustments = ;
    }
  }
  
  
  
  void output(float[] vision) {
    
  }
  
  float cost() {
    
    return 2;
  }
  
  
 
  
  
  
  
  
}
