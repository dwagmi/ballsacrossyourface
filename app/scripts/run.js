const main = async () => {
  const [owner, randomPerson] = await hre.ethers.getSigners(); // get generated wallet addresses for contract owner and randomPerson from hardhat
    const contractFactory = await hre.ethers.getContractFactory('Contract');
    const contract = await contractFactory.deploy();
    await contract.deployed();

    console.log("Contract is deployed to:", contract.address);
    console.log("Contract deployed by:", owner.address);
    console.log("Random person's address is:", randomPerson.address); 

    // getTotalWaves, wave once and then getTotalWaves again
    let waveCount;
    waveCount = await contract.getTotalWaves(); // awaiting even though contract function not async? 
    let waveTxn = await contract.wave(); 
    await waveTxn.wait(); 
    waveCount = await contract.getTotalWaves(); 

    // connect to contract with randomPerson, wave, getTotalWaves
    waveTxn = await contract.connect(randomPerson).wave();
    await waveTxn.wait();
    waveCount = await contract.getTotalWaves();    

    // get owner to wave once more and getTotalWaves again 
    waveTxn = await contract.wave(); 
    await waveTxn.wait(); 
    waveCount = await contract.getTotalWaves();    

  };
  
  const runMain = async () => {
    try {
      await main();
      process.exit(0);
    } catch (error) {
      console.log(error);
      process.exit(1);
    }
  };
  
  runMain();