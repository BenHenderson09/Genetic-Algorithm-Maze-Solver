# Genetic-Algorithm-Maze-Solver
This program is a [Genetic Algorithm](https://en.wikipedia.org/wiki/Genetic_algorithm) , that uses generations of "agents" to solve a maze 
that contains unknown obstacles. The program then uses a variety of techniques to achieve not only the path to the goal, but also the
fastest route.

![](https://github.com/BenHenderson09/GeneticAlgortim_MazeSolver/blob/master/gen19.png)

## Program details
- Made with Processing (mainly used for shapes)
- Uses no external machine learning libraries, completely from scratch
- Can solve any maze that isn't overly complex.

## Genetic Algorithm
The Genetic Algorithm is a brilliant machine learning concept for this type of task, it is based of the theory of evolution that occurs
in biology. 

A generation of a few hundred agents are spawned, with completely random pathways and no optimization. Once the generation
has went extinct (ran out of moves or if every agent hit an obstacle) a variety of genetic operations will occur:
- Fitness Calculation
- Natural Selection
- Forming a new generation
- Mutation
- Killing all bad agents

Calculating the fitness shows which agents are performing the best, this gives the variables needed for natural selection.
Natural selection will calculate the parents for the next generation. This means that the fitness of each agent will be reviewed, and if
the agent has a high fitness it will have a high chance of becoming the parent for an agent in the next generation. Using this technique
we can form a new generation of optimized agents.

## Mutation
As you can see from the image above, no matter how fit the population of agents are, some will always die. This is not a flaw, but one
of the key components of genetic algoritms. The large blue dot is the best agent, this agent will never die once it completes the maze successfully, but the white dots will die even after completing the maze. This is because the white dots will be mutated slightly to
allow them to explore new routes. The algoritm may be able to get to the goal, but it could be going around a long path. By mutating these
white dots, they can change their directions to explore different routes, many will die, but a few will find an easier path. The algoritm
then learns from this new discovery.

## Killing bad agents
If agents are way off the goal or getting there too slowly, the program will kill them to cleanse the population from bad "genes", leaving only the good agents to form the next generation.
