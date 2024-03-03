// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

contract Encoding{
    function concatStrings() public pure returns(string memory){
        return string(abi.encodePacked("Hello", "World"));
    }

    function encodeNumber() public pure returns( bytes memory){
        bytes memory encodedNumber = abi.encode(1);
        return encodedNumber;
    }

    function encodeString() public pure returns(bytes memory){
        bytes memory encodedString = abi.encode("Hello World");
        return encodedString;
    }

    function encodeStringPacked() public pure returns(bytes memory){
        bytes memory encodedString = abi.encodePacked("Hello World");
        return encodedString;
    }
    
    function encodeStringBytes() public pure returns(bytes memory){
        bytes memory encodedString = bytes("Hello World");
        return encodedString;
    }

    function decodeString() public pure returns(string memory){
        string memory decodedString = abi.decode(encodeString(), (string));
        return decodedString;
    }

    function multiEncode() public pure returns(bytes memory){
        bytes memory encodedString = abi.encode("Hello World", "Hello World");
        return encodedString;
    }

    function multiDecode() public pure returns(string memory, string memory){
        (string memory decodedString1, string memory decodedString2) = abi.decode(multiEncode(), (string, string));
        return (decodedString1, decodedString2);
    }

    function multiEncodePacked() public pure returns(bytes memory){
        bytes memory multiEncodedString = abi.encodePacked("Hello World", "Hello World");
        return multiEncodedString;
    }


    //This does not work
    function multiDecodePacked() public pure returns(string memory, string memory){
        (string memory decodedString1, string memory decodedString2) = abi.decode(multiEncodePacked(), (string, string));
        return (decodedString1, decodedString2);
    }    
    
    // Use this instead
    function multiStringCastPacked() public pure returns(string memory){
        string memory someString = string(abi.multiEncodePacked());
        return someString;
    }
}