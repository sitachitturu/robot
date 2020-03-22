# Project X Jenkins Instructions

## What is Project X

In short, it is a Jenkins job, that allows you to call other Jenkins jobs (robot framework jobs), by entering parameters for the job.

## How to use

1. Go to the ProjectX job in Jenkins and select `build with parameters`.
2. Enter the:
  1. Robot framework job you want to run (e.g., `cycle_counting.robot`)
  2. Database you want to use (e.g., `db.cfg`)
  3. The environment you want to test. (e.g., `https://mos-qa-1.run.aws-usw02-pr.ice.predix.io`)
3. Jenkins will fire off the job and pass in the parameters you specified. The resulting `report.html` can be found in the workspace for the given robot framework job. (Not the ProjectX workspace).
4. Rinse and repeat. You can use ProjectX to fire off multiple jobs in parallel.
