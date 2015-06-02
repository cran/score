\name{pfnorm}
\alias{pfnorm}
\title{
Compares physical functional performance to normal ranges
}
\description{
Compares physical functional performance to the age- and gender-specific normal range scores from the Rikli and Jones Senior Fitness Test Manual. Note that the manual provides normative values for seriors aged between 60-94. Comparison to the norms will only be performed for individuals aged between 60 to 94.  
}

\usage{
pfnorm(data)
}

\arguments{
  \item{data}{Data frame which consists of six columns: 
  
    \tabular{ll}{\cr
              Column 1: \tab Age\cr
              Column 2: \tab Gender (F: female, M: male)\cr
              Column 3: \tab Number of Steps\cr
              Column 4: \tab Number of full stands\cr
              Column 5: \tab Mean of 8 foot up and go trials\cr
              Column 6: \tab Mean of left and right armcurls\cr
              }
  }

}


\value{Four additional columns [StepsNorm, StandNorm, UpgoNorm, ArmcurlNorm] are provided, to the data supplied to the function. The columns indicate whether the individuals' physical performance meets the norm or is lower or higher than the norm.
}

\author{
Jaejoon Song <jjsong2@mdanderson.org>
}
\references{Rikli, R. E. and Jones, C. J. (1999). Development and validation of a functional fitness test for community-residing older adults. Journal of Aging and Physical Activity, 7, 129-61.
 }

\keyword{ fitness }

\examples{
# Generating a random physical performance data for illustration
n <- 20
ID <- rep(1:n)
Age <- rtnorm(n, mean=75, sd=15, lower=60, upper=94)
Gender <- sample(c("F","M"),n,replace=TRUE)
NumberofSteps <- sample(rep(0:150),n,replace=TRUE)
Numberoffullstands <- sample(rep(0:20),n,replace=TRUE)
UpGo8ftmean <- rtnorm(n, mean=7.5, sd=4, lower=3, upper=30)
armcurlR_Lmean <- rnorm(n, mean=14, sd=4)


samplePerf <- data.frame(ID,Age,Gender,
                         NumberofSteps,Numberoffullstands,
                         UpGo8ftmean,armcurlR_Lmean)
                         
# Now comparing the physical performance test to the norm
normCat <- pfnorm(samplePerf)

}
