# AES RTL Verification using UVM
This repository contains the UVM (Universal Verification Methodology) testbench created to verify an AES (Advanced Encryption Standard) RTL implementation written in Verilog. The goal of this project is to demonstrate a complete verification environment that ensures the AES module functions according to the design specifications.

> [!IMPORTANT]
> The RTL design files for the AES module are sourced externally and are not created by me, done by [Eng. Michael ehab](https://github.com/michaelehab). This repository focuses only on the verification environment using UVM.

---

## Introduction
AES (Advanced Encryption Standard) is a widely used symmetric encryption algorithm. This project provides a UVM-based verification environment for testing an externally provided RTL implementation of the AES algorithm. The environment is designed to thoroughly verify the AES module's functionality, including both encryption and decryption processes.

---

##  UVM hierarchy

```sh
└── UVM-AES-Verilog.git/
    ├── UVM
    │   ├── interface
    │   │   └── AES_intf.sv
    │   ├── objects
    │   │   ├── configration
    │   │   │   └── configration.sv
    │   │   ├── sequenceItem
    │   │   │   └── sequenceItem.sv
    │   │   └── sequences
    │   │       └── main_sequence.sv
    │   ├── shared_pkg
    │   │   └── shared_pkg.sv
    │   └── testbench_top
    │       ├── test
    │       │   ├── env
    │       │   │   ├── agent
    │       │   │   ├── env.sv
    │       │   │   ├── scoreboard
    │       │   │   └── subscriber
    │       │   └── test.sv
    │       └── top.sv
    ├── michaelehab_AES-Verilog
    │   ├── ...
    │   ├── ...
    │   └── ...
    └── run.tcl
```

---


## Getting Started
To get started with this repository, follow these steps:
> [!NOTE]
> You need to have [QuestaSim](https://support.sw.siemens.com/en-US/) installed on your machine.

1. Clone the repository to your local machine using the following command:
```
git clone https://github.com/Abdelrahman1810/UVM-AES-Verilog.git
```

2. Open QuestaSim and navigate to the directory where the repository is cloned.

3. Compile the HDL files by executing the following command in the QuestaSim transcript tap: 
```ruby
do run.do
```
---

## Contributing
If you find any issues or have suggestions for improvement, feel free to submit a pull request or open an issue in the repository. Contributions are always welcome!

---

## Contact info 💜
<a href="https://linktr.ee/A_Hassanen" target="_blank">
  <img align="left" alt="Linktree" width="180px" src="https://app.ashbyhq.com/api/images/org-theme-wordmark/b3f78683-a307-4014-b236-373f18850e2c/d54b020a-ff53-455a-9d52-c90c0f4f2081.png" />
</a> 
<br>
<br>
