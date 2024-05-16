import React, { useState } from 'react';

const ProductFilter = ({ onFilterChange }) => {
  const [maxDefaultBillAmount, setMaxDefaultBillAmount] = useState('');
  const [coverageArea, setCoverageArea] = useState(''); // Set the initial state to match one of the option values

  const handleFilterSubmit = (e) => {
    e.preventDefault();
    // console.log('coverageArea');
    // console.log(coverageArea);
    // Call the onFilterChange callback with the selected filter values
    onFilterChange({
      max_default_bill_amount: maxDefaultBillAmount,
      min_coverage_area: coverageArea,
    });
  };

  // Available filter options
  const filterOptions = [1500, 2000, 2500, 3000];
  const coverageAreaOptions = [
    { label: 'Select a room size', value: '' }, // Set the value to an empty string to match the initial state
    { label: 'Below 120 Sq.Ft. - Small Bedroom', value: '120' },
    { label: '120-170 Sq.Ft. - Big Bedroom', value: '170' },
    { label: 'Above 170 Sq.Ft. - Living Room', value: '200' },
  ];

  return (
    <div className="product-filter">
      <form onSubmit={handleFilterSubmit} className="form-inline">
        <div className="row align-items-center">
          <div className="col-auto">
            <label htmlFor="maxDefaultBillAmount">Estimated Bill Amount:</label>
          </div>
          <div className="col-auto">
            <select
              id="maxDefaultBillAmount"
              className="form-control"
              value={maxDefaultBillAmount}
              onChange={(e) => setMaxDefaultBillAmount(e.target.value)}
            >
              <option value="">Select an amount</option>
              {filterOptions.map((option) => (
                <option key={option} value={option}>
                  {option}
                </option>
              ))}
            </select>
          </div>
          <div className="col-auto">
            <label htmlFor="coverageArea">Room Size:</label>
          </div>
          <div className="col-auto">
            <select
              id="coverageArea"
              className="form-control"
              value={coverageArea}
              onChange={(e) => setCoverageArea(e.target.value)}
            >
              {coverageAreaOptions.map((option) => (
                <option key={option.value} value={option.value}>
                  {option.label}
                </option>
              ))}
            </select>
          </div>
          <div className="col-auto">
            <button type="submit" className="btn btn-primary">
              Apply Filter
            </button>
          </div>
        </div>
      </form>
    </div>
  );
};

export default ProductFilter;
