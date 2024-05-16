import React, { useState, useEffect } from 'react';

const BillCalculator = ({ productId }) => {
  const [wattage, setWattage] = useState(0);
  const [energyRating, setEnergyRating] = useState(0);
  const [dailyUsageHours, setDailyUsageHours] = useState(8);
  const [defaultBillAmount, setDefaultBillAmount] = useState(0);
  const [monthlyBillAmount, setMonthlyBillAmount] = useState(0);
  const [coverageArea, setCoverageArea] = useState(0);
  const [productDetails, setProductDetails] = useState(null);

  useEffect(() => {
    // Fetch the product details from the API using the productId
    fetch(`http://localhost:8000/catalogue/api/bill_amount/${productId}/`)
      .then((response) => response.json())
      .then((data) => {
        setProductDetails(data);
        setWattage(data.wattage);
        setEnergyRating(data.energy_rating);
        setCoverageArea(data.coverage_area);
        setDefaultBillAmount(data.default_bill_amount);
      })
      .catch((error) => console.error('Error fetching product details:', error));
  }, [productId]);

  useEffect(() => {
    // Function to recalculate monthly bill amount
    const calculateMonthlyBill = () => {
      // Bill calculation logic goes here based on wattage, energyRating, and dailyUsageHours
      const monthlyBill = parseInt((((wattage * dailyUsageHours * 30) / 1000) / energyRating) * 8);
      setMonthlyBillAmount(monthlyBill);
    };

    calculateMonthlyBill();
  }, [wattage, energyRating, dailyUsageHours]);

  return (
    <div className="container border rounded mt-4">
      <h3 className="mb-4">Bill Calculator</h3>
      {/* Form for user input */}
      <form>
        <div className="form-group row">
          <label className="col-sm-3 col-form-label">Wattage:</label>
          <div className="col-sm-4">
            <input
              type="number"
              className="form-control"
              value={wattage}
              onChange={(e) => setWattage(e.target.value)}
            />
          </div>
        </div>
        <div className="form-group row">
          <label className="col-sm-3 col-form-label">Energy Rating:</label>
          <div className="col-sm-4">
            <input
              type="number"
              className="form-control"
              value={energyRating}
              onChange={(e) => setEnergyRating(e.target.value)}
            />
          </div>
        </div>
        <div className="form-group row">
          <label className="col-sm-3 col-form-label">Daily Usage Hours:</label>
          <div className="col-sm-4">
            <input
              type="number"
              className="form-control"
              value={dailyUsageHours}
              onChange={(e) => setDailyUsageHours(e.target.value)}
            />
          </div>
        </div>
        <div className="form-group row">
          <label className="col-sm-3 col-form-label">Coverage Area (Sq. Ft.):</label>
          <div className="col-sm-4">
            <input
              type="number"
              className="form-control"
              value={coverageArea}
              onChange={(e) => setCoverageArea(e.target.value)}
            />
          </div>
        </div>
      </form>
      {/* Monthly Estimated Bill Amount */}
      <div className="mt-4">
        <strong>Monthly Estimated Bill Amount:</strong> Rs. {monthlyBillAmount}
      </div>
    </div>
  );
};

export default BillCalculator;
