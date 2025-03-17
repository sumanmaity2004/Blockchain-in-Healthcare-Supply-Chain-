// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

contract BlockchainHealthcareSupplyChain {
    string public projectTitle = "Blockchain in Healthcare Supply Chain";
    string public projectDescription = "Track the delivery and authenticity of medical supplies in the healthcare system.";

    struct Supply {
        uint256 id;
        string name;
        string origin;
        string destination;
        bool isAuthentic;
    }

    mapping(uint256 => Supply) public supplies;
    uint256 public supplyCount;

    event SupplyAdded(uint256 id, string name, string origin, string destination);
    event SupplyVerified(uint256 id, bool isAuthentic);

    function addSupply(string memory name, string memory origin, string memory destination) public {
        supplyCount++;
        supplies[supplyCount] = Supply(supplyCount, name, origin, destination, false);
        emit SupplyAdded(supplyCount, name, origin, destination);
    }

    function verifySupply(uint256 id, bool isAuthentic) public {
        Supply storage supply = supplies[id];
        supply.isAuthentic = isAuthentic;
        emit SupplyVerified(id, isAuthentic);
    }

    function getSupply(uint256 id) public view returns (uint256, string memory, string memory, string memory, bool) {
        Supply memory supply = supplies[id];
        return (supply.id, supply.name, supply.origin, supply.destination, supply.isAuthentic);
    }
}
