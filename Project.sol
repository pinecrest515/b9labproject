contract Project {
    // constructor and struct storing info of owner, contribution goal, deadline, etc
    struct ProjectData {
        address owner;
        uint contributed;
        uint goal;
        uint deadline;
        uint num_contributions;
        mapping(uint => Contribution) contributions;
    };
    struct Contribution {
        address contributor;
        uint amount;
    };

    // Fund() This function starts a new campaign funding project and contributes to the funding
    // This function also puts in logic so that
    // 1. If project goal is reached, current contributor is returned money and payout of already contributed amount happens
    // 2. If project deadline is reached without reaching goal, all contributed amounts are refunded to contributor
    function fund(address recipient, uint256 goal, uint256 deadline, uint256 contributedvalue) {
        var project = ProjectData(recipient, 0, goal, deadline);
        if (project.deadline == 0) // check for non-existing campaign funding project
            return;

        // Check whether the funding goal of the project
        // has been reached.  If so, transfer the money.
        if (project.deadline > 0 && project.contributed >= project.goal) {
            // since goal is already reached, return value back to the current contributor
            send(project.contributions[num_contributors].contributor,project.contributions[num_contributors].amount);
            delete project.contributions[num_contributions];
            // since goal is reached, payout to funding recepient the contributed amount
            payout();
            // clear storage, we have to do it explicitly 
             for (uint i = 0; i < project.num_contributions; i++) {
                delete project.contributions[i]; // zero out its members
            }
            delete project;
        }

        // Check whether the deadline of the project has
        // passed without reaching goal. If so, return the contributed money and delete the
        // funding project
        if (project.deadline > 0 && project.contributed < project.goal && block.timestamp > project.deadline) {
            // since deadline has passed before reaching goal, refund everything back to the contributors
            refund();
            delete project;
            }
    
        // else if funding goal has not been reached and project deadline not passed
        // add the next contribution to the total contribution ledger
        project.contributed += contributedvalue;
        project.contributions[project.num_contributions]= Contribution(transaction.sender, contributedvalue);
        project.num_contributions++;
        
    // Payout() This function pays out the contributed amount to funding recepient
    function payout() returns (bool payout) {
        send(project.recipient, project.contributed);
        payout = true;
    }
    
    // Refund() This function sends all individual contributions back to the respective contributor
    function refund() returns (bool refund) {
        for (uint i = 0; i < project.num_contributors; i++) {
                send(project.contributions[i].contributor,
                     project.contributions[i].amount);
                delete project.contributions[i];
            }
        refund = true;
    }

state:
    mapping(uint256 => ProjectData) project;
};
