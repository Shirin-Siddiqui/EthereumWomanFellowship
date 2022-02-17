// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;
import "remix_tests.sol"; // this import is automatically injected by Remix.
import "../contracts/1_Storage.sol";

contract StorageTest{
    Storage s;

    function beforeEach() public{
        s = new Storage();
    }

    function initialValueShouldBe100() public returns (bool) {
        return Assert.equal(s.retrieve(), 100, "Initial value is not correct");
    }

    function valueIsSet200() public returns(bool){
        s.store(200);
        return Assert.equal(s.retrieve(), 200, "Value is not 200");
    }

    function valueIsNegative() public returns(bool){
        return Assert.greaterThan(
            s.retrieve(),
            int256(-1),
            "Given value found is Negative"
        );
    }

    function valueIsAboveMax() public returns(bool){
        return Assert.lesserThan(
            s.retrieve(), 
            int256(1000), 
            "Given Value is Greater than 1000"
        );
    }
}