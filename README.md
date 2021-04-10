# Welcome to Microsoft challenge at QCHack 2021!

We are excited to offer this challenge to [QCHack 2021](https://www.qchack.io/) participants, and we are looking forward to the solutions you will come up with!

## Challenge overview

Grover's search algorithm is one of the fundamental algorithms of quantum computing. At the same time it is frequently misinterpreted and misrepresented, and figuring out how to apply it to solve a given problem can be quite challenging! The main part of the challenge is implementing the given problem as a *quantum oracle* - the core part of Grover's algorithm.

This challenge consists of two parts. In part 1, you will explore implementing given classical problems of varying complexity as quantum oracles. In part 2, you will come up with an interesting problem yourself, and solve it using Grover's search.

**To participate in this challenge, you must use Q# programming language and tools available as part of the Microsoft Quantum Development Kit.** 
You do not need to use Azure Quantum to run your solutions on quantum hardware.

## Part 1: Automatically judged tasks

Part 1 of this challenge can be found in folder [Part1](./Part1). It contains 4 independent tasks of increasing difficulty: task 1 is the easiest one, and task 4 is quite challenging.

In each task you need to implement a marking quantum oracle for a classical function by filling in the code in the given Q# operation. The task description and the operation skeleton are given in the file Tasks.qs; this is the only file you should modify in the task.

The file Tests.qs contains the testing harness for the task. Once you solved the task and wrote the code for it, you can run the provided test to verify that the your solution to the task is correct. 
The workflow of working on the task is extremely similar to that of working on the [Quantum Katas](https://github.com/microsoft/QuantumKatas/). 
You can read more about opening the project and running the test [here](https://github.com/microsoft/QuantumKatas/#run-a-kata-as-a-q-project-).

We will evaluate your solutions to the tasks using similar testing harnesses, possibly including more tests than were provided to you. If your solution to a task passes the tests, you get the points for that task! The point values for tasks are:

* [Task 1. f(x) = 1 if x is divisible by 4](./Part1/Task1/) - 1 point.
* [Task 2. f(x) = 1 if at least two of three input bits are different - easy](./Part1/Task2/) - 2 points.
* [Task 3. f(x) = 1 if at least two of three input bits are different - hard](./Part1/Task3/) - 5 points.
* [Task 4. f(x) = 1 if the graph edge coloring is triangle-free](./Part1/Task4/) - 12 points.


## Part 2: Free-form project

In part 2 of the challenge, you will come up with a problem you'd like to solve using Grover's search, and create a project that solves this problem! There is no "right" or "wrong" way to solve this challenge; you have the freedom to decide what you want to do and how far you want to go!

Your project for part 2:

* Must include a problem description and instructions on running the project in README.md file.
* Must solve a small instance of the problem using a full-state simulator without any user input, or with a well-documented user input. If your solution requires an input, its format should be documented in README.md, including an example.
* Must produce an output presenting the instance of the problem solved and the solution in human-readable format.
* Must be original, i.e., not previously covered in Quantum Development Kit samples, learning materials, or the Quantum Katas.

The judging for part 2 of the challenge will be more flexible than for part 2. Since there is no single "right" solution, we'll be evaluating the projects based on several criteria. Here is the list of criteria and example questions we'll consider when evaluating the projects:

* *Technical depth* (6 points). How complicated is the selected problem? How well is it solved?
* *Use of tools* (5 points). Evaluates the breadth of Quantum Development Kit tools used in the project. Is the project relying on the libraries to maximize code readability? Is the oracle implementation covered by unit tests? Does the project use specialized simulators and/or resource estimation? Is the solution to the problem displayed using a clever visualization?
* *Creativity* (4 points). How original is the problem selection? How creative is the output presentation?
* *Educational value* (5 points): Is this project valuable for helping others learn? Did the team write a blog post about the project sharing their learnings with others? Is the project structured as a tutorial?

For the general guidelines on judging projects, please refer to the [Official QCHack Hacking Rules 2021](https://docs.google.com/document/d/1_Jln3lIfNmYPlUtJ17zgwi5FQtNtzhHR-fH15QqW3xc/edit).

## Submitting your solutions

To submit your solutions:
1. Fork this repository to your GitHub account.
2. Work on the solutions to the tasks from part 1 and the project from part 2.
3. Commit your work to your forked repository.  
   For part 1 tasks, you should only modify Tasks.qs files. For part 2 project, commit any files you consider relevant: the project itself, screenshots of results, any visualizations you've done, etc. 
4. To submit your project, submit the link to your repository.  
   Your repository has to be made public at the time of the Hackathon end for us to be able to judge your solutions. We don't recommend making your work public early during the Hackathon, so as not to tempt other teams to borrow from your work. Let everybody enjoy their exploration!
5. If your project for part 2 includes a blog post about your project, publish it shortly after the Hackathon end and add a link to it to your GitHub repository.

For the general guidelines on judging projects, please refer to the [Official QCHack Hacking Rules 2021](https://docs.google.com/document/d/1_Jln3lIfNmYPlUtJ17zgwi5FQtNtzhHR-fH15QqW3xc/edit).


## Eligibility and prizes

The (6) highest cumulative team scores from parts 1 and 2 of the challenge will receive a **$250 Visa Gift Card** (physical or virtual) for the team. The winning teams will have an opportunity to present their projects to the Microsoft Quantum Team, at a later date and time (to be scheduled after the results announcement).

Government officials and Microsoft employees are not eligible to participate in this challenge.

For the general rules on eligibility and prizes, please refer to the [Official QCHack Hacking Rules 2021](https://docs.google.com/document/d/1_Jln3lIfNmYPlUtJ17zgwi5FQtNtzhHR-fH15QqW3xc/edit).

## Resources

Here is a list of resources to help you learn more about various parts of our challenge:

#### Microsoft Quantum Development Kit installation

For this Hackathon, you will need to install at least the [standalone QDK](https://docs.microsoft.com/en-us/azure/quantum/install-command-line-qdk), and possibly (depending on what kind of project you decide to do) integration with [Q# Jupyter Notebooks](https://docs.microsoft.com/en-us/azure/quantum/install-jupyter-qkd) or with [Python](https://docs.microsoft.com/en-us/azure/quantum/install-python-qdk).

We also recommend you to install the [Quantum Katas](https://github.com/Microsoft/QuantumKatas/#kata-locally), since a lot of learning and practice resources in this list are from that resource.

#### Quantum oracles (tutorials and programming exercises)

* ["Oracles"](https://github.com/microsoft/QuantumKatas/blob/main/tutorials/Oracles) tutorial
* [Microsoft's workshop at QCHack](https://www.twitch.tv/videos/979926267)
* [Simple practice problems](https://github.com/microsoft/QuantumKatas/blob/main/DeutschJozsaAlgorithm)
* Microsoft Learn module ["Solve graph coloring problems by using Grover's search"](https://docs.microsoft.com/en-us/learn/modules/solve-graph-coloring-problems-grovers-search/)
* Microsoft Learn page ["Write an oracle to validate ISBNs"](https://docs.microsoft.com/en-us/learn/modules/use-qsharp-libraries/4-write-oracle) 

#### Grover's search algorithm (with more practice for oracles implementation)

* Microsoft Learn module ["Solve graph coloring problems by using Grover's search"](https://docs.microsoft.com/en-us/learn/modules/solve-graph-coloring-problems-grovers-search/)
* [Microsoft's workshop at QCHack](https://www.twitch.tv/videos/979926267)
* [Simple Grover's search sample in Q#](https://github.com/microsoft/Quantum/tree/main/samples/algorithms/simple-grover) - an implementation for a trivial problem "find 0101... state", and an example of a standalone Q# project implementation
* [Solving Sudoku using Grover's search](https://github.com/microsoft/Quantum/tree/main/samples/algorithms/sudoku-grover) - an implementation for a Sudoku solver, an example of more interesting oracles, and a template for calling Q# code from C# classical host
* ["Implementing Grover's algorithm" kata](https://github.com/microsoft/QuantumKatas/blob/main/GroversAlgorithm) - step-by-step implementation of the algorithm itself
* ["Exploring Grover's search algorithm" tutorial](https://github.com/microsoft/QuantumKatas/blob/main/tutorials/ExploringGroversAlgorithm) - exploring high-level behaviors of the algorithm, such as retrying in case of a failure, the required number of iterations, etc.
* ["Solving SAT problems using Grover's algorithm" kata](https://github.com/microsoft/QuantumKatas/blob/main/SolveSATWithGrover) - practice implementing oracles and using Grover's algorithm to solve a problem
* ["Solving graph coloring problems using Grover's algorithm" kata](https://github.com/microsoft/QuantumKatas/blob/main/GraphColoring) - practice implementing oracles and using Grover's algorithm to solve a problem
* ["Solving bounded knapsack problem using Grover's algorithm" kata (work in progress)](https://github.com/microsoft/QuantumKatas/pull/457)

## Rules

This page lists Microsoft additional unique rules for its Challenge, including judging criteria, submission guidelines, eligibility and prizes. Please refer to the [Official QCHack Hacking Rules 2021](https://docs.google.com/document/d/1_Jln3lIfNmYPlUtJ17zgwi5FQtNtzhHR-fH15QqW3xc/edit) for general QCHack rules.


[![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/quantumcoalition/qchack-microsoft-challenge/master)
