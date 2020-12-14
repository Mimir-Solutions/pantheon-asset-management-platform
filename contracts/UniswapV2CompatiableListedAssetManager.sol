// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity 0.7.5;

import "hardhat/console.sol";

import "./dependencies/holyzeppelin/contracts/access/Ownable.sol";
import "./dependencies/holyzeppelin/contracts/math/SafeMath.sol";
import "./dependencies/holyzeppelin/contracts/math/Counters.sol";

contract UniswapV2CompatiableListedAssetManager is Ownable {
    
    using SafeMath for uint256;
    using Counters for Counters.Counter;

    mapping (address => mapping (address => address)) private _managedUniswapV2CompatiablePairs;

    constructor() {}

    function addManagedAsset( address token1_, address token2_, address uniswapV2CompatiableLPToken_ ) external onlyOwner() {
        _managedUniswapV2CompatiablePairs[token1_][token2_] = uniswapV2CompatiableLPToken_;
        _managedUniswapV2CompatiablePairs[token2_][token1_] = uniswapV2CompatiableLPToken_;
    }

    function raiseTokenPrice( address tokenToRaise_, uint256 amountToRaiseBy_ ) external onlyOwner() {

    }

    function lowerTokenPrice( address tokenToLower_, uint256 amountToLowerBy_ ) external onlyOwner() {

    }

    function exchangeLiquidty( address tokenToRemove_, address opposingTokenToRemove_, address tokenToDeposit_, address opposingTokenToDeposit_ ) external onlyOwner() {
        
    }
}