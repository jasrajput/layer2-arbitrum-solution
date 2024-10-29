export default function Dashboard() {

    return (
        <div className="container">
        <div className="row g-4 m-2 mb-3 bg-lights mt-4  px-3 pb-2 rounded-bottom-3 text-center">
          <div className="col-12 col-lg-12 col-xl-12">
            <div className="total-card">
              <h2 className='text-white text-center'>Total Balance</h2>
              <h5>
                  <span className='text-white' id='matic_balance_plus_earning'>0.00</span>
              </h5>
            </div>
          </div>
        </div>
        <div className='row m-2'>
          <div className="col-12 col-lg-6 col-md-6 col-xl-6" id="home">
          <h5 className="fw-semi-bold pt-2 pb-3">Dashboard</h5>
            <div className="bg-white-1 rounded-5 pt-1 pb-3">
              <div className="d-flex income-text">
                <div className="card border-0  rounded-5 p-3  mr-2">
                    <i className="las la-coins grd-color"></i>
                    <p className=" my-1">ARBC Token</p>
                    <p className='token_balance  bs'>0.00</p>
                </div>
                <div className="card border-0  rounded-5 p-3 mr-2">
                    <i className="las la-dollar-sign grd-color"></i>
                    <p className=" my-1">ARBC Price</p>
                    <p id='currentPrice' className='bs'>0.00</p>
                </div>
                <div className="card border-0  rounded-5 p-3 ">
                    <i className="las la-hand-holding-usd grd-color"></i>
                    <p className=" my-1">ARBC Value</p>
                    <p id='usdtPrice' className='bs'>
                        0.00
                    </p>
                </div>
              </div>
              <div className="d-flex income-text">
                <div className="card border-0  rounded-5 p-3  mr-2">
                    <i className="las la-seedling grd-color"></i>
                    <p className=" my-1">My Investment</p>
                    <p className='investment bs'>0.00</p>
                </div>
                <div className="card border-0  rounded-5 p-3 mr-2">
                    <i className="las la-donate grd-color"></i>
                    <p className=" my-1">Total Earning </p>
                    <p className='total_payout bs'>0.00</p>
                </div>
                <div className="card border-0  rounded-5 p-3 ">
                    <i className="las la-wallet grd-color"></i>
                    <p className=" my-1">Available Earning</p>
                    <p className='unwithdrawn_income bs'>0.00</p>
                </div>
              </div>
            </div>
          </div>

          <div className="col-12 col-lg-6 col-md-6 col-xl-6" id="investment">
          <h5 className="fw-semi-bold pt-2 pb-3">Earnings</h5>
            <div className="bg-white-1 rounded-5 ">
              <div className="card-header border-0 py-0">

              </div>
              <div className="d-flex income-text">
                <div className="card border-0  rounded-5 p-3  mr-2">
                    <i className="las la-chalkboard grd-color"></i>
                    <p className=" my-1">Direct Earning</p>
                    <p className='bs direct_bonus'>0.00</p>
                </div>
                <div className="card border-0  rounded-5 p-3 mr-2">
                        <i className="las la-share-square grd-color"></i>
                        <p className=" my-1">Level Earning</p>
                        <p className='match_bonus bs'>0.00</p>
                </div>
                <div className="card border-0  rounded-5 p-3 ">
                    <i className="la la-user  fs-3 grd-color"></i>
                    <p className=" my-1">Daily Earning</p>
                    <p className='bs daily_payout'>0.00</p>
                </div>
              </div>
              <div className="d-flex income-text">
                <div className="card border-0  rounded-5 p-3  mr-2">
                    <i className="las la-sort-amount-up grd-color"></i>
                    <p className=" my-1">Rank Earning</p>
                    <p className='bs' id='rank_earning'>0.00</p>
                </div>
                <div className="card border-0  rounded-5 p-3 mr-2">
                    <i className="las la-trophy grd-color"></i>
                    <p className=" my-1">Rank Earning Claimed</p>
                    <p id='daily_mtc_bonus' className='bs'>0.00</p>
                </div>
                
                <div className="card border-0  rounded-5 p-3 ">
                        <i className="las la-hand-holding-usd grd-color"></i>
                        <p className=" my-1">Total Earning</p>
                        <p className='total_payout bs'>0.00</p>
                </div>
              </div>
            </div>
          </div>
          <div className="col-12 col-lg-6 col-xl-5 mt-3 mb-3" id="team">
          <h5 className="fw-semi-bold pt-2 pb-3">Network</h5>
            <div className="bg-white-1 rounded-5 ">

              <div className="d-flex income-text">
                <div className="card border-0  rounded-5 p-3  mr-2">
                      <i className="las la-chalkboard grd-color"></i>
                      <p className=" my-1">My Network</p>
                      <p className='bs total_team'>0</p>
                </div>
                <div className="card border-0  rounded-5 p-3 mr-2">
                    <i className="las la-share-square grd-color"></i>
                    <p className=" my-1">My Direct</p>
                    <p className='total_referrals bs'>0</p>
                </div>
                <div className="card border-0  rounded-5 p-3 ">
                        <i className="la la-user grd-color fs-3"></i>
                        <p className=" my-1">Down Business</p>
                        <p className='bs downline_business'>0</p>
                </div>
              </div>
              
              
              <div className="d-flex income-text">
                <div className="card border-0  rounded-5 p-3  mr-2">
                      <i className="las la-chalkboard grd-color"></i>
                      <p className=" my-1">Left Leg Deposit</p>
                      <p className='bs' id='leftLegDeposit'>0</p>
                </div>
                <div className="card border-0  rounded-5 p-3 mr-2">
                    <i className="las la-share-square grd-color"></i>
                    <p className=" my-1">Right Leg Deposit</p>
                    <p className='bs' id='rightLegDeposit'>0</p>
                </div>
                <div className="card border-0  rounded-5 p-3 ">
                        <i className="la la-user grd-color fs-3"></i>
                        <p className=" my-1">Direct Business</p>
                        <p className='bs direct_business'>0</p>
                </div>
              </div>
              
              
            </div>
          </div>
          <div className="col-12 col-lg-6 col-xl-5 mt-3 " id="abc">
          <h5 className="fw-semi-bold pt-2 pb-3">Other</h5>
            <div className="bg-white-1 rounded-5 ">
              <div className="card-header border-0 py-0">

              </div>
              <div className="d-flex income-text">
                <div className="card border-0  rounded-5 p-3  mr-2">
                    <i className="las la-chalkboard grd-color"></i>
                    <p className=" my-1">My investment</p>
                    <p className='investment bs'>0.00</p>
                </div>
                <div className="card border-0  rounded-5 p-3 mr-2">
                    
                    <i className="las la-share-square grd-color"></i>
                    <p className=" my-1">Max. Payout</p>
                    <p className='max_payout bs'>0.00</p>
                </div>
                <div className="card border-0  rounded-5 p-3 ">
                    <i className="la la-user  fs-3 grd-color"></i>
                    <p className=" my-1">Retopup times</p>
                    <p id='cycle' className=' bs'>0.00</p>
                </div>
              </div>
              
            </div>
          </div>
        </div>
      </div>
    )
}