DSS9 - Data Products Project
The example shiny app is an extension of the project for DSS6 - Statistical Inference.
In that exercise, a simulation demonstrates the Central Limit Theorem in action by
taking 1000 runs of 40 samples of an exponential distribution.  The means of the 40
samples takes on the form of a normal distribution centred on the population mean.

In my work we often encounter mixtures of distributions because it is often not possible to
seperate the source populations geographically prior to the study.  One of the early steps 
in interpretation is sorting out how many source populations there are.  Looking at
simulated mixtures of populations can help become used to interpreting the shape of
density distributions.

This shiny app simulates a mixture of three source populations of the exponential
distribution.  The populations overlap, so for any given oberservation there is a 
probability that the sample represents each of the individual source populations.
Use the slider to change this between 1 and 100 and see how the probablitiy of each
source changes.  Some positions do not give surprising results, but as you get between 
the population means there are locations where the most likely source is not as obvious.
