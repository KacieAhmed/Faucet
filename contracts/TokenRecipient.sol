/*

  Token recipient. Modified very slightly from the example on http://ethereum.org/dao (just to index log parameters).

*/

pragma solidity 0.8.4;

import "openzeppelin-solidity/contracts/token/ERC20/ERC20.sol";

/**
 * @title TokenRecipient
 * @author Wyvern Protocol Developers
 */
contract TokenRecipient {
    event ReceivedEther(address indexed sender, uint amount);
    event ReceivedTokens(address indexed from, uint256 value, address indexed token);

    /**
     * @dev Receive tokens and generate a log event
     * @param from Address from which to transfer tokens
     * @param value Amount of tokens to transfer
     * @param token Address of token
     */
    function receiveApproval(address from, uint256 value, address token) public {
        ERC20 t = ERC20(token);
        require(t.transferFrom(from, address(this), value), "ERC20 token transfer failed");
        emit ReceivedTokens(from, value, token);
    }
    
    //returns the balance of ether held by this contract
     function getBalanceEther() external view returns(uint){
        return address(this).balance;
    }
    
    //returns the balance of music coins held by this contract
      function getBalanceToken() external view returns(uint){
          address token = address(0x609f3128A27353465f52c8A1f93485bE42d45ce1);
          address thisContract = address(this);
          
          ERC20 t = ERC20(token);
          
         uint i = t.balanceOf(thisContract);
        return i;
    }
    
    
    //returns the balance of music coins held by the user
    function getUserBalanceV() external view returns(uint){
          address token = address(0x609f3128A27353465f52c8A1f93485bE42d45ce1);
          address thisContract = address(this);
          
          ERC20 t = ERC20(token);
          
         uint i = t.balanceOf(msg.sender);
        return i;
    }
    
    //sends music tokens from this contract to another user
    function sendToken(address to, uint256 value) public{
         address token = address(0x609f3128A27353465f52c8A1f93485bE42d45ce1);
          address thisContract = address(this);
          
          ERC20 t = ERC20(token);
          
          t.transfer( to, value);
        
    }
    
 
    
    function faucet() public{
        sendToken(msg.sender, 1000);
    }
    

    /**
     * @dev Receive Ether and generate a log event
     */
    fallback () payable external {
        emit ReceivedEther(msg.sender, msg.value);
    }
}
