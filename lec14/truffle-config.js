const path = require("path");

module.exports = {
    contracts_build_directory: path.join(__dirname, "client/src/contracts"),
    networks: {
        development:{
            port: 8545,
            host: "127.0.0.1",
            network_id: 1337,
            gasPrice: 0x01,
        },
    },
    compilers: {
        solc:{
            version:"^0.8.11",
            optimizer: { enabled: true, runs: 200 }
        }
    }
};
