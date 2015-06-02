\name{ipaq}
\alias{ipaq}
\title{
Scores 'International Physical Activity Questionnaire (IPAQ)'
}
\description{
Scores 'International Physical Activity Questionnaire (IPAQ)' short form.
}

\usage{
ipaq(ipaqdata)
}

\arguments{
  \item{ipaqdata}{Data which consists of thirteen columns:

  \tabular{ll}{\cr
               Column 1: \tab ID\cr
              Column 2: \tab Weight\cr 
              Column 3: \tab VigDays: Number of days doing vigorous physical activity per week\cr 
              Column 4: \tab VigHours: Number of hours in vigorous physical activity per day\cr 
              Column 5: \tab VigMin: Number of minutes in vigorous physical activity per day\cr 
              Column 6: \tab ModDays: Number of days doing moderate physical activity per week\cr 
              Column 7: \tab ModHours: Number of hours in moderate physical activity per day\cr  
              Column 8: \tab ModMin: Number of minutes in moderate physical activity per day\cr                  
              Column 9: \tab WalkDays: Number of days walking per week\cr
              Column 10: \tab WalkHours: Number of hours walking per day\cr 
              Column 11: \tab WalkMin: Number of minutes in walking per day\cr 
              Column 12: \tab SitHours: Number of hours sitting per day\cr  
              Column 13: \tab SitMin: Number of minutes sitting per day\cr  
              }
  }

}


\value{
Three additional columns [MET, kilocalories, pacat] are provided, to the data supplied to the function. 
  \tabular{ll}{\cr
              MET: \tab Metabolic Equivalent of Task.\cr
              kilocalories: \tab Kilocalories are computed from MET-minutes.\cr 
              pacat: \tab Physical activity classification into 'Low', 'Moderate', or 'High'. \cr  
              }
}

\author{
Jaejoon Song <jjsong2@mdanderson.org>
}
\references{Craig, C.L., et al. International physical activity questionnaire: 12-country reliability and validity. Med Sci Sports Exerc, 2003. 35(8): p. 1381-95. 

The International Physical Activity Questionnaire. (2015, June 1). Retrieved from \cr                                                             http://www.ipaq.ki.se}

\keyword{ IPAQ}

\examples{
## Generating a random IPAQ data for illustration
set.seed(1234)
n <- 20
ID <- rep(1:n)
weight <- rtnorm(n, mean=75, sd=15, lower=40, upper=120)
VigDays <- sample(rep(0:2),n,replace=TRUE)
VigHours <- sample(rep(0:1),n,replace=TRUE)
VigMin <- sample(rep(0:60),n,replace=TRUE)
VigHours <- ifelse(VigDays==0,0,VigHours)
VigMin <- ifelse(VigDays==0,0,VigMin)
ModDays <- sample(rep(0:3),n,replace=TRUE)
ModHours <- sample(rep(0:2),n,replace=TRUE)
ModMin <- sample(rep(0:60),n,replace=TRUE)
ModHours <- ifelse(ModDays==0,0,ModHours)
ModMin <- ifelse(ModDays==0,0,ModMin)
WalkDays <- sample(rep(0:7),n,replace=TRUE)
WalkHours <- sample(rep(0:2),n,replace=TRUE)
WalkMin <- sample(rep(0:60),n,replace=TRUE)
WalkHours <- ifelse(WalkDays==0,0,WalkHours)
WalkMin <- ifelse(WalkDays==0,0,WalkMin)
SitHours <- sample(rep(1:14),n,replace=TRUE)
SitMin <- sample(rep(1:60),n,replace=TRUE)

sampleIPAQ <- data.frame(ID, weight, 
                         VigDays, VigHours, VigMin,
                         ModDays, ModHours, ModMin,
                         WalkDays, WalkHours, WalkMin,
                         SitHours, SitMin)

# Now scoring the data
output <- ipaq(ipaqdata=sampleIPAQ)
}
