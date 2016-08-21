contract FundingHub {

  function createProject {
  address public recipient;
  unit256 public goal;
  unit256 public deadline;
  
  var project = ProjectData(recipient, 0, goal, deadline)
  
  }
  
  function contribute {
  unit256 contributedvalue;
  
  // call fund() function 
  fund(contributedvalue);
  }
  
}
