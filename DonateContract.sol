pragma solidity ^0.8.0;

interface IERC20 {
    function transfer(address _to, uint256 _amount) external returns (bool);
}

contract DonateContract {

  uint Donations; // the amount of donations
  address payable owner; // contract creator's address
  mapping (address => uint) public eachDonation;


  //contract settings
  constructor() {
    owner = payable(msg.sender); // setting the contract creator
  }

  modifier OnlyOwner{
        require(msg.sender == owner);
        _;
    }

  //public function to make donate
  function donate() public payable {
    (bool success,) = owner.call{value: msg.value}("");
    require(success, "Failed to send money");
  }

 

 function withdrawToken(address _tokenContract, uint256 _amount) external {
        IERC20 tokenContract = IERC20(_tokenContract);
        
        // transfer the token from address of this contract
        tokenContract.transfer(msg.sender, _amount);
    }
}
