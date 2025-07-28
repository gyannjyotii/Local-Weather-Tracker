# WeatherTracker DApp

## Project Description

WeatherTracker is a decentralized application (DApp) built on the Ethereum blockchain that enables communities to collectively track and share local weather data. The platform allows authorized weather reporters to submit real-time weather information including temperature, humidity, and atmospheric pressure for various locations. All data is stored immutably on the blockchain, ensuring transparency, reliability, and censorship-resistance.

The DApp operates through a smart contract that manages weather data submissions, reporter authorization, and data verification. Users can query weather information for specific locations, while only authorized reporters can submit new data to maintain quality and accuracy.

## Project Vision

Our vision is to create a decentralized, community-driven weather monitoring network that:

- **Democratizes Weather Data**: Removes dependency on centralized weather services by enabling communities to contribute and access local weather information
- **Ensures Data Integrity**: Leverages blockchain technology to provide tamper-proof, transparent weather records
- **Empowers Local Communities**: Gives communities control over their local weather data collection and sharing
- **Promotes Accuracy**: Implements a verification system to ensure quality and reliability of reported weather data
- **Builds Weather Resilience**: Creates a distributed network that remains operational even when traditional weather services fail

## Key Features

### 1. **Decentralized Weather Reporting**
- Authorized reporters can submit weather data for any location
- Data includes temperature, humidity, atmospheric pressure, and location information
- All submissions are timestamped and linked to the reporter's address

### 2. **Data Verification System**
- Contract owner can verify submitted weather data for accuracy
- Verified data is marked with a verification flag for enhanced trust
- Transparency through blockchain ensures all verifications are publicly auditable

### 3. **Reporter Authorization Management**
- Contract owner can authorize trusted individuals to submit weather data
- Authorization can be revoked if needed to maintain data quality
- Prevents spam and ensures only reliable sources contribute data

### 4. **Real-time Weather Queries**
- Anyone can query weather data for specific locations
- Returns comprehensive weather information including reporter details
- Data is instantly accessible without intermediaries

### 5. **Location-based Data Storage**
- Weather data is organized by location using cryptographic hashing
- Supports unlimited number of locations
- Easy enumeration of all tracked locations

### 6. **Immutable Weather History**
- All weather data is permanently stored on the blockchain
- Creates an unchangeable historical record of weather patterns
- Enables long-term climate analysis and research

## Future Scopes

### Short-term Enhancements (3-6 months)
- **Mobile Application**: Develop iOS and Android apps for easy weather data submission and viewing
- **Web Interface**: Create a user-friendly web dashboard for non-technical users
- **Weather Alerts**: Implement notification system for extreme weather conditions
- **Data Visualization**: Add charts and graphs to display weather trends over time

### Medium-term Developments (6-12 months)
- **Incentive Mechanism**: Introduce token rewards for accurate weather reporting
- **Automated Verification**: Integrate with IoT weather sensors for automatic data verification
- **Multi-chain Support**: Deploy on multiple blockchains for better accessibility and lower fees
- **Advanced Analytics**: Implement machine learning for weather prediction based on historical data

### Long-term Vision (1-3 years)
- **Global Weather Network**: Scale to cover weather stations worldwide
- **Weather NFTs**: Create unique NFTs for significant weather events or rare conditions
- **Insurance Integration**: Partner with insurance companies for weather-based claims verification
- **Climate Research Platform**: Provide tools for researchers to analyze long-term climate patterns
- **Decentralized Weather API**: Offer API services to other applications and services
- **Community Governance**: Implement DAO structure for community-driven platform governance

### Advanced Features
- **Weather Prediction Market**: Allow users to predict weather conditions and earn rewards
- **Cross-chain Weather Oracle**: Serve as a weather data oracle for other blockchain applications
- **Satellite Integration**: Incorporate satellite weather data for enhanced accuracy
- **AI-powered Quality Control**: Use artificial intelligence to detect and flag suspicious weather reports
- **Weather-based Smart Contracts**: Enable other smart contracts to trigger based on weather conditions

---

## Getting Started

### Prerequisites
- Node.js and npm installed
- Truffle or Hardhat development framework
- MetaMask or similar Web3 wallet
- Access to Ethereum testnet (Goerli, Sepolia) or mainnet

### Installation
```bash
# Clone the repository
git clone https://github.com/your-username/weather-tracker-dapp.git

# Install dependencies
npm install

# Compile smart contracts
npx hardhat compile

# Deploy to testnet
npx hardhat run scripts/deploy.js --network goerli
```

### Usage
1. Deploy the smart contract to your preferred Ethereum network
2. Authorize weather reporters using the `authorizeReporter()` function
3. Reporters can submit weather data using `submitWeatherData()`
4. Query weather information using `getWeatherData()`
5. Verify data quality using `verifyWeatherData()`

## Contributing
We welcome contributions from the community! Please read our contributing guidelines and submit pull requests for any improvements.

## License
This project is licensed under the MIT License - see the LICENSE file for details.

## Contract Details : 0x9126ecE8ef9781c1D292be947615C2676837aa60
<img width="1919" height="887" alt="Screenshot 2025-07-28 142710" src="https://github.com/user-attachments/assets/66784e57-3149-4f45-ace1-46511a7f50c1" />
