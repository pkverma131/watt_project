import React, { useState } from 'react';

const ProductFilter = ({ onFilterChange }) => {
  const [maxDefaultBillAmount, setMaxDefaultBillAmount] = useState('');
  const [coverageArea, setCoverageArea] = useState('');
  const [brand, setBrand] = useState('');
  const [acType, setAcType] = useState('');
  const [acCapacity, setAcCapacity] = useState('');

  const brands = [
    "Blue Star", "Croma", "Godrej", "LLOYD", "VOLTAS", "CANDY", "Carrier",
    "DAIKIN", "Electrolux", "Haier", "Hisense", "HITACHI", "IFB", "LG",
    "Midea", "MITSUBISHI HEAVY", "O GENERAL", "Panasonic", "SAMSUNG"
  ];

  const acTypes = ["Split", "Window"];
  const acCapacities = ["1 Ton", "1.5 Ton", "2 Ton"];

  const handleFilterSubmit = (e) => {
    e.preventDefault();
    onFilterChange({
      max_default_bill_amount: maxDefaultBillAmount,
      min_coverage_area: coverageArea,
      brand: brand,
      ac_type: acType,
      ac_capacity: acCapacity,
    });
  };

  const filterOptions = [1500, 2000, 2500, 3000];
  const coverageAreaOptions = [
    { label: 'Select a room size', value: '' },
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
            <label htmlFor="brand">Brand:</label>
          </div>
          <div className="col-auto">
            <select
              id="brand"
              className="form-control"
              value={brand}
              onChange={(e) => setBrand(e.target.value)}
            >
              <option value="">Select a brand</option>
              {brands.map((brand) => (
                <option key={brand} value={brand}>
                  {brand}
                </option>
              ))}
            </select>
          </div>
          <div className="col-auto">
            <label htmlFor="acType">AC Type:</label>
          </div>
          <div className="col-auto">
            <select
              id="acType"
              className="form-control"
              value={acType}
              onChange={(e) => setAcType(e.target.value)}
            >
              <option value="">Select a type</option>
              {acTypes.map((type) => (
                <option key={type} value={type}>
                  {type}
                </option>
              ))}
            </select>
          </div>
          <div className="col-auto">
            <label htmlFor="acCapacity">AC Capacity:</label>
          </div>
          <div className="col-auto">
            <select
              id="acCapacity"
              className="form-control"
              value={acCapacity}
              onChange={(e) => setAcCapacity(e.target.value)}
            >
              <option value="">Select a capacity</option>
              {acCapacities.map((capacity) => (
                <option key={capacity} value={capacity}>
                  {capacity}
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
