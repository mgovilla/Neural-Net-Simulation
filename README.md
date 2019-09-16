# Neural-Net-Simulation
GT project to train a neural network to run a robot through an obstacle course. Inspired by https://www.youtube.com/watch?v=WtEYMELvRHI, but we didn't have a license to Matlab so we made a similar version in Processing.

![Environment] (/images/Environment.PNG)

This is the environment for a robot to learn how to avoid obstacles in search of some goal. The red circle is the goal, while the blue squares are the obstacles. 

The robot has a short cone of vision (45 degrees total) in 5 different lines of sight which simulate distance sensors in real life. In order to see around, the robot must turn. 

In the robot class, there is a "brain" that would be the artificial intelligence we are trying to train. The next steps are to implement a learning algorithm and attempt to train it in the environment.
