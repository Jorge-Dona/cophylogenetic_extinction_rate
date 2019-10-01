# This function computes the “cophylogenetic extinction rate” (Ec), a statistics that uses data from event-based cophylogenetic analyses and might be informative to assess symbiont extinction risks.
# See Doña & Johnson 2019 for more details. 

require(DescTools)

#Load the function
ec <- function(L,E,S) {
  
  est<-BinomCI(L, (E+S),
              conf.level = 0.95,
              method = "modified wilson")
  paste("Ec=", est[1],";","Lower CI=", est[2],";", "Upper CI=", est[3])
}

#L = number of losses
#E = Total number of events resulting from the cophylogenetic reconstruction (i.e., Losses+switches+duplications, etc.)
#S = Number of host-switches

# Example of usage:
# L = 1; E = 10; S = 2
# 1. Load the function (note that modified wilson is used as the default method for computing the CI; modify the function if you want to use a different method).
# 2. For the number of events of this example, call it simply as follows: 
ec(1,10,2)

# [1] "Ec= 0.0833333333333333 ; Lower CI= 0.00427444119896255 ; Upper CI= 0.353879911141117"

