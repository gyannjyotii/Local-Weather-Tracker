// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/**
 * @title WeatherTracker
 * @dev A decentralized weather tracking system that allows users to submit and retrieve weather data
 */
contract WeatherTracker {
    
    struct WeatherData {
        uint256 timestamp;
        int256 temperature; // Temperature in Celsius * 100 (to handle decimals)
        uint256 humidity; // Humidity percentage
        uint256 pressure; // Pressure in hPa
        string location; // Location name
        address reporter; // Address of the person who reported the data
        bool isVerified; // Whether the data has been verified
    }
    
    // Mapping from location hash to latest weather data
    mapping(bytes32 => WeatherData) public weatherRecords;
    
    // Mapping to track authorized weather reporters
    mapping(address => bool) public authorizedReporters;
    
    // Array to store all location hashes for enumeration
    bytes32[] public locations;
    
    // Contract owner
    address public owner;
    
    // Events
    event WeatherReported(bytes32 indexed locationHash, string location, address indexed reporter);
    event ReporterAuthorized(address indexed reporter);
    event ReporterRevoked(address indexed reporter);
    event WeatherVerified(bytes32 indexed locationHash, address indexed verifier);
    
    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can call this function");
        _;
    }
    
    modifier onlyAuthorizedReporter() {
        require(authorizedReporters[msg.sender], "Only authorized reporters can submit weather data");
        _;
    }
    
    constructor() {
        owner = msg.sender;
        authorizedReporters[msg.sender] = true; // Owner is automatically an authorized reporter
    }
    
    /**
     * @dev Submit weather data for a specific location
     * @param _location The name of the location
     * @param _temperature Temperature in Celsius * 100 (e.g., 2550 for 25.50°C)
     * @param _humidity Humidity percentage (0-100)
     * @param _pressure Atmospheric pressure in hPa
     */
    function submitWeatherData(
        string memory _location,
        int256 _temperature,
        uint256 _humidity,
        uint256 _pressure
    ) public onlyAuthorizedReporter {
        require(_humidity <= 100, "Humidity cannot exceed 100%");
        require(_pressure > 0, "Pressure must be greater than 0");
        require(bytes(_location).length > 0, "Location cannot be empty");
        
        bytes32 locationHash = keccak256(abi.encodePacked(_location));
        
        // Check if this is a new location
        if (weatherRecords[locationHash].timestamp == 0) {
            locations.push(locationHash);
        }
        
        weatherRecords[locationHash] = WeatherData({
            timestamp: block.timestamp,
            temperature: _temperature,
            humidity: _humidity,
            pressure: _pressure,
            location: _location,
            reporter: msg.sender,
            isVerified: false
        });
        
        emit WeatherReported(locationHash, _location, msg.sender);
    }
    
    /**
     * @dev Get weather data for a specific location
     * @param _location The name of the location
     * @return WeatherData struct containing all weather information
     */
    function getWeatherData(string memory _location) public view returns (WeatherData memory) {
        bytes32 locationHash = keccak256(abi.encodePacked(_location));
        require(weatherRecords[locationHash].timestamp > 0, "No weather data found for this location");
        return weatherRecords[locationHash];
    }
    
    /**
     * @dev Authorize a new weather reporter
     * @param _reporter Address of the reporter to authorize
     */
    function authorizeReporter(address _reporter) public onlyOwner {
        require(_reporter != address(0), "Invalid reporter address");
        require(!authorizedReporters[_reporter], "Reporter already authorized");
        
        authorizedReporters[_reporter] = true;
        emit ReporterAuthorized(_reporter);
    }
    
    /**
     * @dev Revoke authorization of a weather reporter
     * @param _reporter Address of the reporter to revoke
     */
    function revokeReporter(address _reporter) public onlyOwner {
        require(authorizedReporters[_reporter], "Reporter not authorized");
        require(_reporter != owner, "Cannot revoke owner's authorization");
        
        authorizedReporters[_reporter] = false;
        emit ReporterRevoked(_reporter);
    }
    
    /**
     * @dev Verify weather data for a specific location (can only be done by owner)
     * @param _location The name of the location to verify
     */
    function verifyWeatherData(string memory _location) public onlyOwner {
        bytes32 locationHash = keccak256(abi.encodePacked(_location));
        require(weatherRecords[locationHash].timestamp > 0, "No weather data found for this location");
        require(!weatherRecords[locationHash].isVerified, "Weather data already verified");
        
        weatherRecords[locationHash].isVerified = true;
        emit WeatherVerified(locationHash, msg.sender);
    }
    
    /**
     * @dev Get the total number of locations with weather data
     * @return uint256 Number of locations
     */
    function getTotalLocations() public view returns (uint256) {
        return locations.length;
    }
}
