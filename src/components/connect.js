import { createWeb3Modal, defaultConfig } from '@web3modal/ethers/react'
const projectId = 'd91fbd903e027f724bbb4cbd5ed0605b';

export default function Connect() {
    // const mainnet = {
    //     chainId: 421614,
    //     name: 'Arbitrum Sepolia',
    //     currency: 'ETH',
    //     explorerUrl: 'https://sepolia.arbiscan.io/',
    //     rpcUrl: 'https://public.stackup.sh/api/v1/node/arbitrum-sepolia'
    //   }

    const mainnet = {
      chainId: 31337,
      name: 'Localhost',
      currency: 'ETH',
      explorerUrl: 'https://sepolia.arbiscan.io/',
      rpcUrl: 'http://127.0.0.1:8545'
    }
      
    //   const mainnet = {
    //     chainId: 1,
    //     name: 'Ethereum',
    //     currency: 'ETH',
    //     explorerUrl: 'https://etherscan.io',
    //     rpcUrl: 'https://cloudflare-eth.com'
    //   }
      // 3. Create a metadata object
      const metadata = {
        name: 'My Website',
        description: 'My Website description',
        url: 'https://thecitycabs.in', // origin must match your domain & subdomain
        icons: ['https://avatars.mywebsite.com/']
      }
      
      // 4. Create Ethers config
      const ethersConfig = defaultConfig({
        /*Required*/
        metadata,
      
        /*Optional*/
        enableEIP6963: true, // true by default
        enableInjected: true, // true by default
        enableCoinbase: true, // true by default
        rpcUrl: '...', // used for the Coinbase SDK
        defaultChainId: 1, // used for the Coinbase SDK
      })

      createWeb3Modal({
        ethersConfig,
        chains: [mainnet],
        projectId,
        tokens: {
          137: {
            address: '0x7ceB23fD6bC0adD59E62ac25578270cFf1b9f619',
            image: 'token_image_url' //optional
          }
        }
      
      })
      

      return (
        <w3m-button label='connect' balance={'show'} size={'md'} />
        // <button className='btn btn-success' onClick={handleConnect}>Connect</button>
      )
}

