// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract SimpleStorage {
    uint256 public angka;
    function simpan(uint256 _angka) public { angka = _angka; }
}