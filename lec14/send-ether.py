from web3 import Web3

ganache_url = "HTTP://127.0.0.1:7545"
web3 = Web3(Web3.HTTPProvider(ganache_url))

print("\n[ --- Ganache Local BlockChain --- ]")
print(" - Connection    : ", web3.isConnected())
print(" - Current Block : ", web3.eth.block_number)

account_sending = "0x178A22F7BBAD4a70b0c7D9aB4f75d3033DB4caC0"
account_receiving = "0xA59765B32338e6DE6170926651f6b84c72cB6A81"

# to sign a transaction
private_key = "fcac1be526d0066d641fdf52bbc80bf5fc729b98345d1771d65f5ab0ae44672c"

# build - sign - send - get transaction hash
nonce = web3.eth.getTransactionCount(account_sending)
tx = {
    'nonce': nonce,
    'to': account_receiving,
    'value': web3.toWei(98, 'ether'),
    'gas': 2000000,
    'gasPrice': web3.toWei('50', 'gwei')
}

signed_tx = web3.eth.account.signTransaction(tx, private_key)
tx_hash = web3.eth.sendRawTransaction(signed_tx.rawTransaction)
print(tx_hash)