// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity 0.8.0;

import "../../datatypes/Sales.sol";

contract ISalesDatastore is Ownable  {
    
    function salesPlatform(address) external;
    function getFunctionIDForSalesPlatform() external pure returns (bytes4);

    function setSalesPlatform( address salesPlatform_ ) external;
    function getFunctionIDForSetSalesPlatform() external pure returns (bytes4);
    
    function encodeUSV2CExchangeID(address usv2Router_) external pure returns ( bytes32 usv2ExchangeID_ );
    function getFunctiionIDForEncodeUSV2CExchangeID() external pure returns (bytes4);

    function registerUSV2CExchange( address usv2cRouter_ ) external onlyOwner() returns ( bytes32 usv2ExchangeID_ ) ;
    function getFunctionIDForRegisterUSV2CExchange() external returns (bytes4);
}