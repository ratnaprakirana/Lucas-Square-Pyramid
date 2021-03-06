# Lucas-Square-Pyramid
The project is based on the interesting problem of elliptic curve theory , the problem of finding the perfect squares that are sums of consecutive squares. 
Course: Distributed Operating Systems [COP5612] - Fall 2018
Language: Elixir
Project 1: Lucas' Square Pyramid


Project Members
Eesh Kant Joshi [UFID: 1010-1069]
Ratna Prakirana [UFID: 3663-9969]


CONTENTS OF THIS FILE
1.Introduction
2.Requirements
3.Installation and Configuration
4.Program flow
5.Project Questions


INTRODUCTION
					
Our project has four different modules :-

1) MainServer: This module is used to run the project. This module calls the "main" function in proj1.exs file which passes arguments from the user directly from the input stream and starts the flow of execution. In our case the initial arguments are the 'n' ,which is the limit of the program till it will run , and 'k' which is the number of consecutive numbers for each iteration.
	
2) Supervisor: This module contains the "supervise" function which supervises of the workers and assign them values on which they have to work. The server calls three workers for calculating the result.

3)Worker: This module contains all the functions needed to parallelize the code by spawning various processes.

4)LucasPyramid: This module contains the "isPerfectSquare" function which is responsible for actually checking and generating the Lucas'Square Pyramid. We are required to find the sum of the squares of the k consecutive numbers and try to determine that whether the result that we have just obtained is itself a perfect square i.e. a Square Pyramid.
	
	
REQUIREMENTS
Elixir 1.7.3 
	

INSTALLATION AND CONFIGURATION
					
1) First we create a new mix project by running the command 'mix new project' on the terminal. 

2) This creates a new mix project with the respective lib and config folders along with the mix.exs file.

3) After saving the mix.exs file, we can run our project by  "mix run proj1.exs arg1 arg2" i.e. "mix run proj1.exs 10000 289". 

4) The first call is to the main function and it passes the value of n and k to the "Supervisor". The second call to the "Supervisor" sends the range of values to the worker, generated by the "Supervisor".

5) The worker checks the possibility of the Square Pyramid.

	
PROGRAM FLOW
    
First the main function accepts the arguments provided by the user which are the values of 'n' and 'k'. Then it calls the Supervisor module which divides the workload among three workers on the basis of value of n . The worker module then creates multiple actors and calls the isPerfectSquare function in parallel. The isPerfectSquare function in the LucasPyramid module tries to determine the set of numbers that are able to satisfy the requirement to be a Lucas' Square Pyramid.
	

PROJECT QUESTIONS

Q-1 Size of the work unit that you determined results in best performance for your implementation and an explanation on how you determined it. Size of the work unit refers to the number of sub-problems that a worker gets in a single request from the Supervisor.

Ans: We ran our project with 10, 1000, 10000 and 1000000 work units. We observed that dividing workload by 3 to the workers i.e n/3 work units gave the best performance. Our program works with First come first serve (FCFS) of the workers. When the workers are running simultaneously with the server, the worker which gets the correct result first reports it but our program works in such a way that the workers get connected to the server in the manner of FCFS. The workers get the value of n and k from the Supervisor in our project.

	
Q-2 The result of running your program for

Input: mix run proj1.exs 1000000 4
Output- []
		
Since there is no possible Lucas' Square Pyramid for the given set of values. There is no output for the given set of values.
	

Q-3 The running time for the above as reported by time for the above, i.e run time scala project1.scala 1000000 4 and report the time. The ratio of CPU time to REAL TIME tells you how many cores were effectively used in the computation. If your are close to 1 you have almost no parallelism (points will be subtracted).

-> real	0m7.542s
-> user	0m21.797s
-> sys	0m0.750s

We ran our programs on Windows 8 OS with 4 cores.
CPU time : - (User time + Sys time)/(Real time) = 22.547/7.542 = 2.9895


Q-4	The largest problem you managed to solve.
50000000 24
