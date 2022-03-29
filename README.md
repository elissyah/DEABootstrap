# Data Envelopment Analysis Bootstrap with R
This is my undergraduate thesis/final project to earn a Bachelor degree in Economics. My research discuss about technical efficiency determinant of crude palm oil (CPO) industry in Indonesia using Data Envelopment Analysis (DEA) Bootstrap and Tobit Estimation.

There are two steps for analysing determinants of variables in this study. First, we obtain technical efficiency scores of decision making unit (DMU) of crude palm oil industry using Data Envelopment Analysis which require __R__ programming language and _Benchmarking_ package for bootstrapping method.
Second, we use those scores as dependent variables for Tobit Regression to know which independent variables have the significant contributions to technical efficiency scores.

*Note:*
DEA requires input and output variables to measure the efficiency of DMU in a certain type of industry.
In this study, I use CPO's output (Q) as output variable. Capital (K), Labor (L), Raw Material (M), and Energy (E) are used as input variables.
The input data is given to me by my supervisor which she collected from Indonesian Central Bureau of Statistics. It consists of 654 DMU of CPO industry from year 2014.
