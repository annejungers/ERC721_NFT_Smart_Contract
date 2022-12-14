# ERC721_NFT_Smart_Contract
How to Develop an ERC721 NFT Smart Contract

##What do you need to develop a smart contract:
+ Solidity
+ A Node - Alchemy (interactions with on-chain data >< off chain data that it stored on a decentralized storage like IPFS)
+ A developer Environment: Remix (rk: there are other development environments like Hardhat and Truffle)
+ Cryptocurrency to pay the gas fees

## Steps.
1. Write a smart contract on Openzeppelin

2. Remix IDE. 
  Modify the contract to allow people to mint and limit the max supply of NFTs
  
3. Logging into *Alchemy*.
  Create app, copy the http address of the app in Metamask to add a testnet to add get *free Goerli ETHERS*

4. Deploy your Smart Contract onto the blockchain via the *Remix IDE* by selecting Injected Web3 (Metamask)

5. Create *NFT Metadata*
  Checking *Opensea metadata structure*, copy it and move it to a *json editor online* [](https://jsoneditoronline.org/).
  
6. Go on *Filebase*
  Create a bucket and select *IPFS*
  Upload an image and copy the IPFS Gateway URL and paste it in the json Editor. 
  
7. Save json on your Disk and upload json on Filebase on IPFS.
  So that we have a token URI associated with our token ID

8. SafeMint() in Remix.
  Copy your Metamask address and the IPFS CID of the json file.
  Click confirm on Metask to mint the NFT, we can see that the NFT id is 0

9. Go on OpenSea Testnet to see your result!



  ![nft_opensea_testnet](https://user-images.githubusercontent.com/84380205/207539025-0f422e2f-1275-46d6-8ef5-b83d2bfd5f46.PNG)

 
