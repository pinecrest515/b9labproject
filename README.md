# b9labproject
Jim Yuan
codelearning515@gmail.com
jim.y on slack

Link to project on github page: https://github.com/pinecrest515/b9labproject

This is the final project for b9lab blockchain development course.  The project creates a decentralized funding application. This project contains two .sol files, FundingHub and Project.

A) FundingHub is the registry contract for all projects to be funded.  FundingHub.sol conains the following functions:
1) createProject()
This function allows a user to add a new project to FundingHub.  It deploys a new Project contract and keeps track of its address.  It accepts all constructor values that the Project contract requires.

2) contribute()
This function allows a user to contribute to a Project identified by its address.  It calls the fund function in the individual Project contract and passes on all value attached to the function call.

B) Project is the storage contract containg all data for each individual project.  Project.sol contains the following information:
1) A constructor and struct to contain address of project owner, amount raised in wei, and time until when amount has to be raised

2) fund()
This function is called when FundingHub receives a contribution.  It keeps track of the contributor and amount contributed.  If contribution was sent after deadline or full amount being raised, then the contributed amount is sent back to the originator.  If the full amount has been raised, then payout is called.  If deadline is passed without full amount being raised, then refund is called.

3) payout()
This function sends funds received via contributions to the project owner

4) refund()
This function sends individual contribution back to the original contributors.



