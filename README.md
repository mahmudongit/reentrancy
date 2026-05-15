# Reentrancy

A simple Solidity project demonstrating how reentrancy attacks work in smart contracts and how to prevent them.

This repository contains vulnerable and fixed smart contracts for learning Ethereum smart contract security.

---

# Overview

Reentrancy is one of the most common smart contract vulnerabilities.

It happens when an external contract repeatedly calls back into a vulnerable function before the original execution is completed, allowing funds or state to be manipulated.

This project demonstrates:

- A vulnerable bank contract
- A malicious attacker contract
- Different reentrancy fixes
- Usage of `ReentrancyGuard`
- Checks-Effects-Interactions pattern

---

# Tech Stack

- Solidity
- Foundry
- Remix IDE
- OpenZeppelin Contracts

---

# Project Structure

```txt
reentrancy/
│
├── learning-reentrancy/
│   ├── SimpleBank.sol
│   ├── BlackHat.sol
│   ├── SimpleBank-fix.sol
│   └── SimpleBank-fix-ReentrancyGuard.sol
│
├── README.md
└── LICENSE
```

---

# Contracts

## SimpleBank.sol

A vulnerable smart contract that allows deposits and withdrawals.

### Vulnerability

The contract sends ETH before updating the user's balance.

This allows an attacker to repeatedly call the withdraw function and drain funds.

---

## BlackHat.sol

A malicious contract used to exploit the vulnerable bank contract.

### Features

- Performs recursive withdrawals
- Exploits the reentrancy vulnerability
- Demonstrates how attackers drain ETH

---

## SimpleBank-fix.sol

A secured version of the bank contract.

### Protection Used

- Checks-Effects-Interactions pattern

The user's balance is updated before sending ETH.

---

## SimpleBank-fix-ReentrancyGuard.sol

Another secured version using OpenZeppelin's `ReentrancyGuard`.

### Protection Used

- `nonReentrant` modifier
- Reentrancy prevention through mutex locking

---

# Learning Objectives

This project helps developers understand:

- How reentrancy attacks work
- Why state updates matter
- Secure ETH withdrawal patterns
- Smart contract attack surfaces
- OpenZeppelin security utilities

---

# Example Attack Flow

```txt
1. User deposits ETH into vulnerable contract
2. Attacker calls withdraw()
3. Contract sends ETH before balance update
4. Attacker fallback function triggers
5. withdraw() gets called repeatedly
6. Funds are drained
```

---

# Installation

## Clone Repository

```bash
git clone https://github.com/mahmudongit/reentrancy.git
cd reentrancy
```

## Install Foundry

```bash
curl -L https://foundry.paradigm.xyz | bash
foundryup
```

---

# Remix IDE

```
remix.ethereum.org

```

---

# Security Concepts Covered

- Reentrancy attacks
- Fallback functions
- receive() function abuse
- CEI pattern
- ReentrancyGuard
- Secure Solidity practices

---

# Disclaimer

This repository is for educational purposes only.

Do not use vulnerable contracts in production environments.

---

# License

MIT
