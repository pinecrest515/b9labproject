contract Project {
    // constructor and struct storing info of owner, contribution goal, deadline, etc
    struct ProjectData {
        address owner;
        uint contributed;
        uint goal;
        uint deadline;
        mapping(uint => Contribution) contributions;
    };
    struct Contribution {
        address contributor;
        uint amount;
    };

    // Start a new campaign funding project and contribute to the funding
    function fund(address recipient, uint256 goal, uint256 deadline) {
        var project = ProjectData(recipient, 0, goal, deadline);
        if (project.deadline == 0) // check for non-existing campaign funding project
            return;
        project.contributed += transaction.value;
        project.contributions =
                      Contribution(transaction.sender, transaction.value);

    // Check whether the funding goal of the campaign with id $(campaignId)
    // has been reached and transfer the money.
        if (project.deadline > 0 && project.contributed >= project.goal) {
            payout(project.recipient, project.contributed);
            // clear storage, we have to do it explicitly 
            delete project.contributions[i]; // zero out its members
            delete project;
        }
    }

    // Check whether the deadline of the campaign with id $(campaignId) has
    // passed. In that case, return the contributed money and delete the
    // campaign.
        expired = false;
        if (project.deadline > 0 && block.timestamp > project.deadline) {
            // pay out the contributors
            for (uint i = 0; i < campaign.num_contributors; i++) {
                send(campaign.contributions[i].contributor,
                     campaign.contributions[i].amount);
                delete campaign.contributions[i];
            }
            delete campaign;
            expired = true;
        }
    }
    }
    
    // Refund() This function sends all individual contributions back to the respective contributor
    function refund(uint campaignId) returns (uint amount)
    {
        amount = project.contributed;
    }

state:
    mapping(uint256 => ProjectData) project;
};
