# Ransomware
In this project I created a Ransomware using C#.

## How it works
First the program will check if it's running on a testing machine like: VM, sandbox...
If yes, it will stop and delete itself, else the process starts:

The system reboots into safe mode (if it's not already in it), because on safe mode most drivers are disabled, which means that all AV's won't work (Shadow copies don't work on this mode).
Then the program gets elevated privileges using UAC bypass to perform certain registry changes and access certain files.

[The Ransomware will have the Server's RSA-512 PublicKey hardcoded]

Once it has admin privileges, the program generates a unique RSA-512 pair, and encrypts the ClientPrivateKey using the ServerPublicKey.
Then it crawls through all the drives using MultiThreading, and each file is encrypted using a newly generated AES-256.

Each AES key is then encrypted using the ClientPublicKey, and with that, the encryption ends, the program drops a Message on the desktop and destroys it self.

In order to decrypt all the files, each AES key needs to be decrypted using the ClientPrivateKey, but as it is encrypted with the ServerPublicKey, the victim needs the ServerPrivateKey, and this is where the payment comes in.

This page explains how the encryption part works: [AES-RSA](https://medium.com/@tarcisioma/ransomware-encryption-techniques-696531d07bb9)

## Notes
* Since the program uses MultiThreading and asynchronous programming, iterating through ~600K files took around 7 seconds, so with the encryption it will take ~15 seconds.
* Each file is encrypted using a process called RIPlace, which bypasses Windows-Controlled-Folder. [More on RIPlace](https://www.bleepingcomputer.com/news/security/new-riplace-bypass-evades-windows-10-av-ransomware-protection/)
* While I tested each feature separately, I never tested the Ransomware as a package, so I can't tell the Behaviour.
* Currently working on decryption and spreading.

# Disclaimer
## Use this project for educational purposes only. I am not responsible for anything you do with this project.
