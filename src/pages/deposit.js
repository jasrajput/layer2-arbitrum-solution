import { useState, useEffect } from 'react';
import { useWeb3ModalProvider, useWeb3ModalAccount } from '@web3modal/ethers/react'
import { BrowserProvider, Contract, formatUnits } from 'ethers'

const contract_address = '0x5FbDB2315678afecb367f032d93F642f64180aa3';
const USDTAbi = [
    'function name() view returns (string)',
    'function symbol() view returns (string)',
    'function balanceOf(address) view returns (uint)',
    'function transfer(address to, uint amount)',
    'event Transfer(address indexed from, address indexed to, uint amount)'
  ]

  
export default function Deposit() {
    const [balance, setBalance]  = useState('');
    const { address, chainId, isConnected } = useWeb3ModalAccount()
    const { walletProvider } = useWeb3ModalProvider();
    console.log(walletProvider);

    useEffect(() => {
        async function getBalance() {
            try {
                if(isConnected === 'undefined' && !isConnected) {
                    throw Error('User disconnected');
                }

                const ethersProvider = new BrowserProvider(walletProvider);
                const signer = ethersProvider.getSigner();
                // const contract = new Contract(contract_address, USDTAbi, signer);
                const balance = await ethersProvider.getBalance(address);
                const etherBalance = formatUnits(balance, 18);
                setBalance(etherBalance);
            } catch(er) {
                console.log(er.message);
            }
        }

        getBalance();
    }, [isConnected]);
    
    return <div className="container">
        <div className="row m-3">
        <div className="col-12 col-lg-6">
            <div className="card border-0">
              <div className="card-header border-bottom mt-3 mx-2  px-2">
                <h3 className="fw-semi-bold card-title">Deposit</h3>
              </div>
              <div className="card-body">
                <form action="#">
                  <div className="form-group">
                    <div className="input-group mb-3">
                      <div className="input-group d-flex">
                        <label className="me-sm-2">Available Balance</label>
                      </div>
                      <input type="text" disabled id='token_balance' className="form-control" value={balance} />
                    </div>
                  </div>
                  <div className="form-group">
                    <div className="input-group mb-2">
                      <div className="input-group d-flex">
                        <label className="me-sm-s2">Enter Deposit Amount</label>
                      </div>
                      <input type="text"  id='invest_amount' className="form-control" placeholder="" />
                    </div>
                  </div>
                  <button type='button' className="btn btn-primary p-2 btn-blocks invest_now" style={{'fontSize': '13px'}}>Deposit</button>
                </form>
              </div>
            </div>
          </div>
        </div>
    </div>
}