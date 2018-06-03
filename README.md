# EncDecSys
An Encryption/Decryption System Design (Secure Hardware Design Project)

## Overall Objective
Design, test, synthesis and layout of an encryption/decryption digital design in the AMS C35B4 0.35um technology process.

## General Structure and Specifications
The whole design consists of two general blocks, the encryptor block and the decryptor block.

In order to encrypt the data which is clocked-in character-by-character when EN signal is high, the data stream will first be shifted based on the user input, then it will be permuted and after that it will be xored with keys based on one of two modes, the normal mode and the configuration mode. The decryption of data reverses the encryption process and generate an 8-bit ASCII character for each received codeword.

### Encryptor Block
This block is designed to work as a pipeline, the encryptor block consists of three main stages: shifting stage, permutation stage and xoring stage, each of them represent a pipeline stage that forward its result to the next pipeline stage.

#### 1. Shifting stage:
When data stream is clocked-in when EN signal is high, depending on the data DIN and the user input ShiftMode, which is 2 bits, the data can either not be shifted if it represent an ASCII character which is not a letter, or it can be shifted by one up to four if it represent an ASCII character which is a letter.

The implementation of this stage is done using multiplexers , D flip-flops and one adder. The result of shifting is forwarded to the next stage of the pipeline alongside with all the needed signals for the subsequent stages , including the PerEnable signal to enable the permutation stage.

#### 2. Permutation stage:
When data stream is clocked-in when PerEnable signal is high, depending on the mode that is chosen by the user, represented by Mode signal, the bits of each byte can either be permuted based on a specific pattern {4, 3, 7, 6, 5, 2, 1, 8} if the normal mode represented by ‘0’ is chosen, or can be permuted based on the user pattern, represented by PerBitXMode signals (three bits each), if the configuration mode represented by ‘1’ is chosen.

The implementation of this stage is done using multiplexers and D flip-flops. The result of permutation is forwarded to the next stage of the pipeline alongside with all the needed signals for the subsequent stages , including the XorEnable signal to enable the xor stage.

#### 3. Xoring stage:
When data stream is clocked-in when XorEnable signal is high, depending on the mode that is chosen by the user, represented by Mode signal, each byte can either be xored with one of the following keys {49, 129, 136, 49} if the normal mode represented by ‘0’ is chosen, or can be xored with one of the following keys {49, 49, 129, 129, 136, 136, 49, 49} if the configuration mode represented by ‘1’ is chosen. Knowing that the frequency of alternating the keys is specified by the mode: in the normal mode, the keys order is {49, 129, 136, 49} for four subsequent bytes, while in the configuration mode the keys order is {49, 49, 129, 129, 136, 136, 49, 49} for eight subsequent bytes. 

The implementation of this stage is done using xor, multiplexers, D flip-flops and adder. It was better to use two
bits register NormalKeysMode in case of the normal mode and increment its value for every time the xor stage is executed to specify which key will be used than storing the four keys in one big register and rotating them. The same applied for the configuration mode with using SuperKeysMode three bits register.

The result of xor stage is forwarded to the decryptor block alongside with all the needed signals for synchronization between the two blocks, including the EN signal to activate the decryptor block.

### Decryptor Block
This block is designed to work as a pipeline, the decryptor block consists also of three main stages: xoring stage, permutation stage and shifting stage, each of them represent a pipeline stage that forward its result to the next pipeline stage. The functionality of this block reverses the encryption process and generate an 8-bit ASCII character for each received codeword.

## Parameters of the final design

|      Area     | Dynamic Power | Leakage Power  | Operation Frequency |
| ------------- | ------------- | -------------- | ------------------- |
| 110892.998459 |   4.2432 mW   |    1.8950 uW   |       80 MHZ        |
