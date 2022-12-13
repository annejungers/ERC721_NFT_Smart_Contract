// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract HOWESTNFTS is ERC721, ERC721Enumerable, ERC721URIStorage {
    using Counters for Counters.Counter;

    Counters.Counter private _tokenIdCounter; // we initialize Counter library to use track of the NFTs ids
                                             // private, can be use only inside the smart contract itself. not accessible from the outside world

    // to prevent people to mint more NFT than present in the collection
    uint MAX_SUPPLY = 10000;


    constructor() ERC721("HOWESTNFTS", "HOW") {} // creating the instance of the SC 
                                                // here we want to run an operation to assign the name and symbol of our smart contract


    // Mint function = creating a new entry onto the blockchain 
    // in this case we are creating a new NFT onto the blockchain
    // we associate to it : an address, an URI
    // address = type to store addresses on the smart contract
    function safeMint(address to, string memory uri) public { //public accessible from anywhere, everybody have access to the mint function
                                                                        // only Owner = modifier that means is the person that make the tx is not the owner then block the tx
                                                                        // but because we want people to mint the nfts on their own, we remove only Owner
        uint256 tokenId = _tokenIdCounter.current(); // declaring a variable to store the token_id + current() --> give us the current token_id number
        require(tokenId <= MAX_SUPPLY,"I am sorry, all NFTs have been minted");  // if 10001 --> I am sorry = control logic to avoid to mint to NFT
        _tokenIdCounter.increment(); // making sure that the next NFT that will be created will have an incremental number
        _safeMint(to, tokenId); // we mint the NFT with the _safemint() 
        _setTokenURI(tokenId, uri); // we assigne the token URI to the NFT to link NFT to metadata
    }

    // The following functions are overrides required by Solidity.

    function _beforeTokenTransfer(address from, address to, uint256 tokenId, uint256 batchSize)
        internal // like private but contracts that inherit from our contract can access
        override(ERC721, ERC721Enumerable)
    {
        super._beforeTokenTransfer(from, to, tokenId, batchSize);
    }

    function _burn(uint256 tokenId) internal override(ERC721, ERC721URIStorage) {
        super._burn(tokenId);
    }

    function tokenURI(uint256 tokenId) // function that OpenSea and Rarible will call to get the URI of your token
        public                          // the nft market place will pass the tokenId o , 1, 2 and the function will return the tokenURI associated with the token ID
        view   // view = about function that are writing on the blockchain and function that are reading on the blockchain --> here we are reading
                // why it matters?
                // if you mark a function as view and you are calling this function from your wallet, not from another SC, you won't pay any gas
                // if a SC calls this function then, it will have to pay some gas
        override(ERC721, ERC721URIStorage)
        returns (string memory)
    {
        return super.tokenURI(tokenId);
    }

    function supportsInterface(bytes4 interfaceId)
        public
        view
        override(ERC721, ERC721Enumerable)
        returns (bool)
    {
        return super.supportsInterface(interfaceId);
    }
}