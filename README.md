# GeneticAlgortim_MazeSolver
This program is a [Genetic Algoritm](https://en.wikipedia.org/wiki/Genetic_algorithm) , that uses generations of "agents" to solve a maze 
that contains unknown obstacles. The program then uses a variety of techniques to achieve not only the path to the goal, but also the
fastest route.

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
