\name{apply.paramset}
\alias{apply.paramset}
\title{Apply a paramset to the strategy}
\usage{
  apply.paramset(strategy.st, paramset.label, portfolio.st,
    account.st, mktdata = NULL, nsamples = 0,
    user.func = NULL, user.args = NULL, calc = "slave",
    audit = NULL, packages = NULL, verbose = FALSE)
}
\arguments{
  \item{strategy.st}{the name of the strategy object}

  \item{paramset.label}{a label uniquely identifying the
  paramset within the strategy}

  \item{portfolio.st}{the name of the portfolio}

  \item{account.st}{the name of the account}

  \item{mktdata}{optional xts mktdata object, will be
  passed unchanged to applyStrategy}

  \item{nsamples}{if > 0 then take a sample of only size
  nsamples from the paramset}

  \item{user.func}{an optional user-supplied function to be
  run for each param.combo at the end, either on the slave
  or on the master (see calc)}

  \item{user.args}{user-supplied list of arguments for
  user.func}

  \item{calc}{'slave' to run updatePortfolio() and
  tradesStats() on the slave and return all portfolios and
  orderbooks as a list: higher parallelization but more
  data transfer between master and slave; 'master' to have
  updatePortf() and tradeStats() run at the master and
  return all portfolios and orderbooks in the .blotter and
  .strategy environments resp: less parallelization but
  also less data transfer between slave and master; default
  is 'slave'}

  \item{packages}{a vector specifying names of R packages
  to be loaded by the slave, default NULL}

  \item{audit}{a user-specified environment to store a copy
  of all portfolios, orderbooks and other data from the
  tests, or NULL to trash this information}

  \item{verbose}{return full information, in particular the
  .blotter environment, default FALSE}
}
\description{
  This function will run applyStrategy() on portfolio.st,
  once for each parameter combination as specified by the
  parameter distributions and constraints in the paramset.
  Results are gathered and returned as a list containing a
  slot for each parameter combination.
}
\details{
  apply.paramset uses the foreach package to start the runs
  for each parameter combination, and as such allows for
  parallel processing. It is up to the caller to load and
  register an appropriate backend, eg. doMC, doParallel or
  doRedis.
}
\author{
  Jan Humme
}
\seealso{
  \code{\link{add.constraint}},
  \code{\link{add.constraint}},
  \code{\link{delete.paramset}}
}

