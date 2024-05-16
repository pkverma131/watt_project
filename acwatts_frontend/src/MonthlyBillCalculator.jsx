import React, { useState } from 'react';

const MonthlyBillCalculator = ({ product }) => {
  const [usageHours, setUsageHours] = useState(10);
  const [temperatureRange, setTemperatureRange] = useState('25-28');
  const [roomSize, setRoomSize] = useState(150);
  const [adjustedAmount, setAdjustedAmount] = useState(null);

  const calculateAdjustedAmount = () => {
    // Perform calculation logic based on the inputs
    const adjustedAmount = /* Perform calculation based on inputs */;
    setAdjustedAmount(adjustedAmount);
  };

  const handleUsageHoursChange = (e) => {
    setUsageHours(parseInt(e.target.value, 10));
  };

  const handleTemperatureRangeChange = (e) => {
    setTemperatureRange(e.target.value);
  };

  const handleRoomSizeChange = (e) => {
    setRoomSize(parseInt(e.target.value, 10));
  };

  return (
    <div>
      <h3>Monthly Bill Calculator</h3>
      <div>
        <label htmlFor="usage-hours">Usage Hours:</label>
        <input
          type="number"
          id="usage-hours"
          value={usageHours}
          onChange={handleUsageHoursChange}
        />
      </div>
      <div>
        <label htmlFor="temperature-range">Temperature Range:</label>
        <input
          type="text"
          id="temperature-range"
          value={temperatureRange}
          onChange={handleTemperatureRangeChange}
        />
      </div>
      <div>
        <label htmlFor="room-size">Room Size:</label>
        <input
          type="number"
          id="room-size"
          value={roomSize}
          onChange={handleRoomSizeChange}
        />
      </div>
      <button onClick={calculateAdjustedAmount}>Calculate</button>
      {adjustedAmount && (
        <div>
          <p>Adjusted Amount: {adjustedAmount}</p>
        </div>
      )}
    </div>
  );
};

export default MonthlyBillCalculator;
