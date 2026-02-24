// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Charity {
    address public owner;
    uint256 public targetAmount;
    uint256 public totalDonations;
    uint256 public deadline;
    bool public isCompleted;

    struct Donor {
        uint256 amount;
        uint256 timestamp;
    }

    mapping(address => Donor) public donors;

    event Donated(address indexed donor, uint256 amount);
    event Withdrawn(uint256 totalAmount);

    constructor(uint256 _targetEth, uint256 _durationDays) {
        owner = msg.sender;
        targetAmount = _targetEth * 1 ether; // Konversi ke Wei
        deadline = block.timestamp + (_durationDays * 1 days);
    }

    // Fungsi untuk menerima donasi (Payable)
    function donate() public payable {
        require(block.timestamp < deadline, "Donasi sudah berakhir!");
        require(msg.value > 0, "Donasi harus lebih dari 0 ETH");

        donors[msg.sender].amount += msg.value;
        donors[msg.sender].timestamp = block.timestamp;
        totalDonations += msg.value;

        emit Donated(msg.sender, msg.value);
    }

    // Hanya owner yang bisa tarik dana jika target tercapai
    function withdrawFunds() public {
        require(msg.sender == owner, "Bukan pemilik!");
        require(totalDonations >= targetAmount, "Target belum tercapai");
        require(!isCompleted, "Dana sudah ditarik sebelumnya");

        isCompleted = true;
        uint256 amount = address(this).balance;
        
        (bool success, ) = owner.call{value: amount}("");
        require(success, "Transfer gagal");

        emit Withdrawn(amount);
    }

    function getContractBalance() public view returns (uint256) {
        return address(this).balance;
    }
}