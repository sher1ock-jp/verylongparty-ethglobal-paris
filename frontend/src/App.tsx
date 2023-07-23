import { useState } from 'react';
import './App.css';
import { encode } from "starknet";
import { StarknetWindowObject, connect } from "get-wallet-starknet";
import { ChakraProvider, Center, Button } from '@chakra-ui/react';
import { useStoreWallet } from './components/wallet_context';
import Square from './components/square';
import { useDojo } from './DojoContext';

interface Square {
  id: number;
  x: number;
  y: number;
}

const App = () => {
  const [initialFocusId] = useState(1275);

  const gridSize = 50;
  const centerX = Math.floor(gridSize / 2);
  const centerY = Math.floor(gridSize / 2);

  const squares: Square[] = [];
  for (let id = 1; id < 2501; id++) {
    const x = id % gridSize - centerX;
    const y = Math.floor(id / gridSize) - centerY;
    squares.push({ id, x, y });
  }

  const [isConnected, setConnected] = useState(false);
  const [wallet, setWallet] = useState<StarknetWindowObject | null>(null);
  const addressAccountFromContext = useStoreWallet(state => state.address);
  const setAddressAccount = useStoreWallet(state => state.setAddressAccount);
  const chainFromContext = useStoreWallet(state => state.chain);
  const setChain = useStoreWallet(state => state.setChain);
  const accountFromContext = useStoreWallet(state => state.account);
  const setAccount = useStoreWallet(state => state.setAccount);
  const providerFromContext = useStoreWallet(state => state.provider);
  const setProvider = useStoreWallet(state => state.setProvider);
  const {systemCalls: { map_create, square_create, player_create, player_move, quest_done, back_to_start }} = useDojo();

  const handleConnectClick = async () => {
    const wallet: StarknetWindowObject | null = await connect({ modalMode: "alwaysAsk", modalTheme: "light" });
    if (wallet) {
      await wallet.enable({ starknetVersion: "v5" });
      setWallet(wallet);
      const addr = encode.addHexPrefix(encode.removeHexPrefix(wallet.selectedAddress ?? "0x").padStart(64, "0"));
      setAddressAccount(addr);
      setConnected(!!wallet.isConnected);
      if (wallet.account) {
        setAccount(wallet.account);
      }
      if (wallet.isConnected) {
        setChain(wallet.chainId);
        setProvider(wallet.provider);
      }
      console.log(wallet.account);
    }
  };

  return (
    <ChakraProvider>
      <body>
        <div className="background">
          <div className="square-zone">
            {squares.map((square) => (
              <Square
                key={square.id}
                squareId={square.id}
                coordinateX={square.x}
                coordinateY={square.y}
                initialFocusId={initialFocusId}
              />
            ))}

            {!isConnected ? (
              <div className="wallet-area">
                <Center>
                  <Button
                    ml="4"
                    textDecoration="none !important"
                    outline="none !important"
                    boxShadow="none !important"
                    onClick={() => {
                      handleConnectClick();
                    }}
                  >
                    Connect Wallet
                  </Button>
                </Center>
              </div>
            ) : (
              <div className="action-area">
              </div>
            )}
          </div>
        </div>
      </body>
    </ChakraProvider>
  );
};

export default App;
