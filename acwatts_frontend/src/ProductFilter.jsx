import React, { useState, useEffect } from 'react';
import { API_URL } from './app.settings';

const ProductFilter = ({ onFilterChange }) => {
  const [maxDefaultBillAmount, setMaxDefaultBillAmount] = useState('');
  const [coverageArea, setCoverageArea] = useState('');
  const [brand, setBrand] = useState('');
  const [brands, setBrands] = useState([]);

  useEffect(() => {
    const fetchBrands = async () => {
      try {
        const response = await fetch(`${API_URL}/catalogue/brands`);
        if (!response.ok) {
          throw new Error('Network response was not ok');
        }
        const data = await response.json();
        setBrands(data);
      } catch (error) {
        console.error('Error fetching brands:', error);
      }
    };

    fetchBrands();
  }, []);

  const handleFilterSubmit = (e) => {
    e.preventDefault();
    onFilterChange({
      max_default_bill_amount: maxDefaultBillAmount,
      min_coverage_area: coverageArea,
      brand: brand,
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
