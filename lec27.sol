// SPDX-License-Identifier : GPL-3.0
pragma solidity >= 0.7.0 < 0.9.0;

/*
    0.6 버전 이후 try/catch
    try/catch를 왜 써야 하는가?
    기존의 에러 핸들러 assert/revert/require는 에러를 발생시키고 프로그램을 끝냄.
    그러나, try/catch로 에러가 났어도, 프로그램을 종료시키지 않고 어떠한 대처를 하게 만들 수 있다.

    try/catch 특징
    1. try/catch문 안에서, assert/revert/require을 통해 에러가 난다면 catch는 에러를 잡지 못하고, 개발자가 의도한지 알고 정상적으로 프로그램을 끝낸다.
    try/catch 문 밖에서 assert/revert/require을 통해 에러가 난다면 catch는 에러를 잡고, 에러를 핸들할 수 있다.

    2. 3가지 catch
    catch Error(string memory reason) { ... } : revert 나 require을 통해 생성된 에러 용도
    catch Pain(uint errorCode) { ... } : assert를 통해 생성된 에러가 날 때 이 catch에 잡힘. errorCode 는 솔리디티에서 정의한 Panic 에러 별로 나온다.
    catch(bytesmemoryLowLevelData) { ... } : 이 catch는 로우 레벨 에러를 잡는다.

    3. 어디서 쓰이는가?
    외부 스마트 컨트렉트를 함수를 부를 때 : 다른 스마트 컨트렉트를 인스턴스화 하여서, try/catch문이 있는 스마트 컨트렉트의 함수를 불러와서 사용.
    외부 스마트 컨트렉트를 생성 할 때 : 다른 스마트 컨트렉트를 인스턴스화 생성 할 때 사용함.
    스마트 컨트렉트 내에서 함수를 부를 때 : this를 통해 try/catch를 사용함.
*/

contract lec27_math {
    function division(uint256 _num1, uint256 _num2) public pure returns (uint256) {
        require(_num1<10, "num1 should not be more than 10");
        return _num1 / _num2;
    }
}

// 외부 스마트 컨트렉트를 함수를 부를 때
contract lec27_runner {
    event catchErr(string _name, string _err);
    event catchPanic(string _name, uint256 _err);
    event catchLowLevelErr(string _name, bytes _err);

    lec27_math public mathInstance = new lec27_math();

    function playTryCatch(uint256 _num1, uint256 _num2) public returns (uint256, bool) {
        try mathInstance.division(_num1, _num2) returns (uint256 value) {
            return (value, true);
        } catch Error(string memory _err) {
            emit catchErr("revert/require", _err);
            return (0, false);
        } catch Panic(uint256 _errorCode) {
            emit catchPanic("assertError/Panic", _err);
            return (0, false);
        } catch (bytes memory _errorCode) {
            emit catchLowLevelErr("LowLevelError", _err);
            return (0, false);
        }
        return (0, false);
    }
}