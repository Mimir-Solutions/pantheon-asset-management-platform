// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity 0.8.0;

import "hardhat/console.sol";

interface IAssaetManagerAdaptor {

    function withdrawLiquidity( address lpToWithdrawFrom_, address tokenToWithdraw_, uint256 amountToWithdraw_ ) public;

    function addLiquidity( address lpToDepositTo_, address[] tokensToDeposit_, uint256 ammountsToDeposit_ ) public;

    function raiseTokenPrice( address targetLP_, address tokenToRaisePrice_, uint256 amountToRaiseBy_ ) public;

    function lowerTokenPrice( address targetLP_, address tokenToLowerPrice_, uint256 ammountToLowerBy_ ) public;
}