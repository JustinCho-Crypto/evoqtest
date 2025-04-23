RPC_URL=https://bsc-testnet.bnbchain.org
TESTNET_PRIV_KEY=2e58745aafa15ef8447d106428df6b74866d034c2fa07eefc07cc27cee0f99ea

# set mock oracles for each asset
MOCK_COMPTROLLER=0x89f2FC8C20BA3419b35C68B7FEbc2EfE84dF8365

# Token addresses (mainnet-style tokens on testnet)
USDC=0x16227D60f7a0e586C66B005219dfc887D13C9531
WBNB=0xae13d989daC2f0dEbFf460aC112a837C89BAa7cd
BTCB=0xA808e341e8e723DC6BA0Bb5204Bafc2330d7B8e4
USDT=0xA11c8D9DC9b66E209Ef60F0C8D969D3CD988782c

# Corresponding deployed MockOracle contracts
USDC_ORACLE=0x0C2D92688d36eF2219F4DDBAA4bbeDAc61467DD7
BNB_ORACLE=0xcA6362339c5A6F5DA506E0B79ea34ABE8C6b8DE2
BTCB_ORACLE=0x15022478BD09Df28715D8755f0FA7C1a7e6B7D5a
USDT_ORACLE=0xd7422eaB46231a8DcE398Cd178362F6A20C97575

echo "📌 Setting mock oracles..."
cast send $MOCK_COMPTROLLER "setOracle(address,address)" $USDC $USDC_ORACLE --private-key $TESTNET_PRIV_KEY --rpc-url $RPC_URL
cast send $MOCK_COMPTROLLER "setOracle(address,address)" $WBNB $BNB_ORACLE --private-key $TESTNET_PRIV_KEY --rpc-url $RPC_URL
cast send $MOCK_COMPTROLLER "setOracle(address,address)" $BTCB $BTCB_ORACLE --private-key $TESTNET_PRIV_KEY --rpc-url $RPC_URL
cast send $MOCK_COMPTROLLER "setOracle(address,address)" $USDT $USDT_ORACLE --private-key $TESTNET_PRIV_KEY --rpc-url $RPC_URL

# set oracle
COMPTROLLER=0xfD36E2c2a6789Db23113685031d7F16329158384
COMPTROLLER_ADMIN=0x939bD8d64c0A9583A7Dcea9933f7b21697ab6396 # timelock

# IMPORTANT: look at this if there is `error code 3: execution reverted, data: "0x"`
CUSTOM_ORACLE=0x89f2FC8C20BA3419b35C68B7FEbc2EfE84dF8365

# cast rpc anvil_impersonateAccount $COMPTROLLER_ADMIN --rpc-url $RPC_URL
# cast send $COMPTROLLER --from $COMPTROLLER_ADMIN "_setPriceOracle(address)" $CUSTOM_ORACLE --unlocked --rpc-url $RPC_URL

# init tokens
USDC=0x8ac76a51cc950d9822d68b83fe1ad97b32cd580d
WBNB=0xbb4CdB9CBd36B01bD1cBaEBF2De08d9173bc095c
BTCB=0x7130d2a12b9bcbfae4f2634d864a1ee1ce3ead9c

WHALE_1=0x554b52bf57b387fd09d6644368c5a8aacaaf5ae0 # BNB and USDC
WHALE_2=0xD3a22590f8243f8E83Ac230D1842C9Af0404C4A1 # BTCB

ACCOUNT_8=0x23618e81E3f5cdF7f54C3d65f7FBc0aBf5B21E8f
ACCOUNT_8_PRIV=0xdbda1821b80551c9d65939329250298aa3472ba22feea921c0cf5d620ea67b97
ACCOUNT_9=0xa0Ee7A142d267C1f36714E4a8F75612F20a79720
ACCOUNT_9_PRIV=0x2a871d0798f97d79848a013d4936a73bf4cc922c825d33c1cf7073dff6d409c6

# cast rpc anvil_impersonateAccount $WHALE_1 --rpc-url $RPC_URL

# send 300k USDC to ACCOUNT_8 and ACCOUNT_9
# cast send $USDC --from $WHALE_1 "transfer(address,uint256)(bool)" $ACCOUNT_8 300000000000000000000000 --unlocked --rpc-url $RPC_URL # 300k USDC
# cast send $USDC --from $WHALE_1 "transfer(address,uint256)(bool)" $ACCOUNT_9 300000000000000000000000 --unlocked --rpc-url $RPC_URL

# cast send $WBNB --from $ACCOUNT_8 "deposit()" --value 1000000000000000000000 --private-key $ACCOUNT_8_PRIV --rpc-url $RPC_URL # 1000 BNB
# cast send $WBNB --from $ACCOUNT_9 "deposit()" --value 1000000000000000000000 --private-key $ACCOUNT_9_PRIV --rpc-url $RPC_URL

# cast rpc anvil_impersonateAccount $WHALE_2 --rpc-url $RPC_URL

# cast send $BTCB --from $WHALE_2 "transfer(address,uint256)(bool)" $ACCOUNT_9 100000000000000000000 --unlocked --rpc-url $RPC_URL # 100 BTCB
