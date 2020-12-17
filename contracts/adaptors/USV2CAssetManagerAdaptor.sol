// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity 0.8.0;

import "hardhat/console.sol";

import "./dependencies/holyzeppelin/contracts/access/Ownable.sol";
import "./dependencies/holyzeppelin/contracts/math/SafeMath.sol";
import "./dependencies/holyzeppelin/contracts/math/Counters.sol";
import "./interfaces/IAssaetManagerAdaptor.sol";

// TODO Add enhanced ERC165 with bytes4 ID for each function 
contract USV2CLPAssetManagerAdaptor is Ownable, IAssaetManagerAdaptor {
    
    using SafeMath for uint256;

    constructor() {}

    function withdrawLiquidity( address lpToWithdrawFrom_, address tokenToWithdraw_, uint256 amountToWithdraw_ ) public onlyOwner() {

    }

    function addLiquidity( address lpToDepositTo_, address[] tokensToDeposit_, uint256 ammountsToDeposit_ ) public onlyOwner() {

    }

    function raiseTokenPrice( address targetLP_, address tokenToRaisePrice_, uint256 amountToRaiseBy_ ) public onlyOwner() {
        
    }

    function lowerTokenPrice( address targetLP_, address tokenToLowerPrice_, uint256 ammountToLowerBy_ ) public onlyOwner() {

    }
}