// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity 0.8.0;

import "hardhat/console.sol";

import "../../dependencies/holyzeppelin/contracts/access/Ownable.sol";
import "../../dependencies/holyzeppelin/contracts/security/Context.sol";
import "../../dependencies/holyzeppelin/contracts/introspection/ERC165.sol";

contract AssetManagerDatastore is Ownable, ERC165 {
    
    using Address for address;
    // using SafeERC20 for IERC20;

    mapping( address => bytes4 ) public adaptorsForLP;
    mapping( bytes4 => address ) public adaptorAddressForID;
    mapping( bytes4 => address ) public lpForAssets;

    mapping( )
    address public override salesPlatform;

    constructor() {}

    function getFunctionIDForSalesPlatform() external pure returns (bytes4) {
        return bytes4(keccak256("salesPlatform(address)"));
    }

    // TODO needs to be updated to use Authorization platform.
    // TODO needs to be set to platform admin role.
    function setSalesPlatform( address salesPlatform_ ) external onlyOwner() {
        console.log("setSalesPlatform(address) function ID: %s", bytes4(keccak256("salesPlatform(address)")));
        salesPlatform = salesPlatform_
    }
    function getFunctionIDForSetSalesPlatform() external pure returns (bytes4) {
        return bytes4(keccak256("setSalesPlatform(address)"));
    }

    /**
     * Intended to provide a small UUID style identifier generated from the minimum amount of date needed to uniquely identify a sale.
     * Because UniswapV2 compatible exchanges use a router contract as the primary
     */
    function encodeUSV2CExchangeID(address usv2Router_) external pure returns ( bytes4 usv2ExchangeID_ ) {
        console.log("encodeUSV2CExchangeID(address) function ID: %s", bytes4(keccak256("encodeUSV2CExchangeID(address)")));
        return _encodeUSV2CExchangeID( usv2Router_);
    }
    function getFunctiionIDForEncodeUSV2CExchangeID() external pure returns (bytes4) {
        return bytes4(keccak256("encodeUSV2CExchangeID(address)"));
    }

    // Internal function provided to optimize gas for internal calls;
    function _encodeUSV2CExchangeID(address usv2Router_) internal pure returns ( bytes4 usv2ExchangeID_ ) {
        return bytes4(uint256(usv2Router_));
    }

    // TODO needs to be updated to use Authorization platform.
    // TODO needs to be set to SalesPlatform role.
    function registerUSV2CExchange( address usv2cRouter_ ) external onlyOwner() returns ( bytes4 usv2ExchangeID_ ) {
        console.log("registerUSV2CExchange(address) function ID: %s", bytes4(keccak256("registerUSV2CExchange(address)")));
        bytes4 usv2cExchangeID_ = _encodeUSV2CExchangeID( usv2cRouter_ );
        require( usv2cRouter_.isContract() );
        require( bytes4(uint256(_usv2Exchanges[usv2cExchangeID_])) == 0 );
        _usv2Exchanges[_encodeUSV2CExchangeID( usv2cExchangeID_ )] = usv2cRouter_;
        return _encodeUSV2CExchangeID( usv2cExchangeID_ );
    }
    function getFunctionIDForRegisterUSV2CExchange() external returns (bytes4) {
        return bytes4(keccak256("registerUSV2CExchange(address)"));
    }

    /**
     * Intended to provide a small UUID style identifier generated from the minimum amount of date needed to uniquely identify a sale.
     * Because UniswapV2 compatible exchanges use a router contract as the primary
     */
     // TODO Needs an event.
    // function encodeSaleID(address saleToken_, address proceedsToken_, address uniswapV2CompatibleRouterddress_) public pure returns ( bytes32 ) {
    //     return _encodeSaleID(saleToken_, proceedsToken_, uniswapV2CompatibleRouterddress_);
    // }
}