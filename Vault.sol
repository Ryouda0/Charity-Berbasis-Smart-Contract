// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Vault {
    string private secretMessage;
    address public owner;

    // Event untuk memberikan notifikasi saat pesan diupdate
    event MessageUpdated(string newMessage);

    constructor(string memory _initialMessage) {
        secretMessage = _initialMessage;
        owner = msg.sender; // Orang yang deploy adalah pemiliknya
    }

    // Fungsi untuk mengubah pesan (Hanya Owner yang bisa)
    function updateSecret(string memory _newMessage) public {
        require(msg.sender == owner, "Hanya pemilik yang bisa mengubah!");
        secretMessage = _newMessage;
        emit MessageUpdated(_newMessage);
    }

    // Fungsi untuk melihat pesan
    function revealSecret() public view returns (string memory) {
        return secretMessage;
    }
}