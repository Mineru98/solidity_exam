# solidity_exam

## 컴파일러 설치

### Node(solc-js)

#### 설치
```shell
npm i -g solc
```

#### 실행

```shell
solc-js --bin --include-path node_modules/ --base-path . MainContract.sol
```

### Docker

```shell
docker run ethereum/solc:stable --version
```

### MacOS

일반적인 설치 방법

```shell
brew update
brew upgrade
brew tap ethereum/ethereum
# stable 설치
brew install solidity
```

특정 버전 설치 방법

```shell
brew unlink solidity
# 0.4.x release
brew install solidity@4
# 0.5.x release
brew install solidity@5
# 0.6.x release
brew install solidity@6
# 0.7.x release
brew install solidity@7
# 0.8.x release
brew install solidity@8
# 특정 커밋 설치
brew install https://raw.githubusercontent.com/ethereum/homebrew-ethereum/77cce03da9f289e5a3ffe579840d3c5dc0a62717/solidity.rb
```

## 참고자료

https://ethereum.github.io/yellowpaper/paper.pdf