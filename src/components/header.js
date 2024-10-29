import Logo from '../assets/logo.png';
import Connect from './connect';
export default function Header() {
    return (
        <header className="header dashboard-header" style={{background: 'rgb(8 20 78)'}}>
            <div className="container-fluid">
                <div className="row">
                <div className="col-12">
                    <nav className="navbar navbar-expand-lg navbar-light p-0 justify-content-between">
                    <a className="navbar-brand" href="index">
                        <img src={Logo} className='img-fluid' style={{height:'50px', width:'100%'}} />
                    </a>

                    <div className="dashboard-log my-2">
                        <div className="d-flex align-items-center">
                            <Connect />
                        </div>
                    </div>
                    </nav>
                </div>
                </div>
            </div>
        </header>
    )
}