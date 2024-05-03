const {buildModule} = require("@nomicfoundation/hardhat-ignition/modules")
;
module.exports=buildModule("Token",(m)=>{
    const name=m.getParameter("_name","Emmuna");
    const symbol = m.getParameter("_symbol","symbol");
    const decimals = m.getParameter("_decimals",10);
    const initialSupply = m.getParameter('_initialSupply',10);
    const token=m.contract("SimpleToken",[name,symbol,decimals,initialSupply]);
    return {token};
});