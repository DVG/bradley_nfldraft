#NFL Draft [![Build Status](https://travis-ci.org/DVG/bradley_nfldraft.png?branch=master)](https://travis-ci.org/DVG/bradley_nfldraft)

This application will allow a system administrator to perform an NFL Draft, as well as allowing users to view what players have been drafted, what's happened recently, and who remains to be drafted.

## Installation

As a rails 3 application, the following steps are required to get up and running
```
$ git clone git://github.com/DVG/bradley_nfldraft.git # clones the repository
$ bundle install # installs all gem dependencies
$ rake draft:seed # uses the draft:seed rake task to create the database
```

If you wish to run the tests, you must also
```
$ rake db:test:prepare
$ rspec    # runs unit tests
$ cucumber # runs integration tests
```

## Rake

The following rake tasks will be provided:

```
# Creates and/or resets the database and seeds it
# with the data provided by the NFL
$ rake draft:seed

#runs a selenium-powered simulation of the draft
# from beginning to end. At it's conclusion, it will rest on the
# results by round screen for 5 seconds so the results may be
# observed.
# NOTE: This assumes that the rails server is running on port 3000
# on the local machine, and the development database has been
# seeded using the draft:seed rake task
rake draft:simulate_draft # simulates an end-to-end draft
```