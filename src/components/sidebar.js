import { Link } from 'react-router-dom';
export default function Sidebar() {
    return (
        <div className="sidebar" style={{background: 'rgb(8 20 78)'}}>
            <div className="menu">
              <ul>
                <li>
                <Link to="/" className="active p-3 mb-1 rounded" data-bs-toggle="tooltip" data-placement="right"
                    title="Home">
                    <span><i className="la la-home  fs-4"></i></span>
                    <br/>
                    <span style={{'fontSize': '12px'}}>Home</span>
                </Link>
                </li>

                <li>
                <Link to="/deposit" className=" p-3 mb-1 rounded" data-bs-toggle="tooltip" data-placement="right"
                    title="Investment">
                    <span><i className="la la-money  fs-4"></i></span>
                    <br/>
                    <span style={{'fontSize': '12px'}}>Deposit</span>
                </Link>
                </li>
                <li>
                <Link to="/withdraw" className=" p-3 mb-1 rounded" data-bs-toggle="tooltip" data-placement="right"
                    title="Sell">
                    <span><i className="la la-exchange fs-4"></i></span>
                    <br/>
                    <span style={{'fontSize': '12px'}}>Withdraw</span>
                </Link>
                </li>
                
              
            </ul>
            </div>
        </div>
    )
}