import React from 'react';
import { useNavigate } from 'react-router-dom';

const budgetValues = [1500, 2000, 2500, 3000];

const BudgetTiles = () => {
  const navigate = useNavigate();

  const handleTileClick = (budget) => {
    // Handle tile click event, navigate to product listing page with the selected budget filter
    navigate(`/catalogue/products/?max_default_bill_amount=${budget}`);
  };

  return (
    <div>
      <h3>Estimated Monthly Bill Budget (INR):</h3>
      <div className="row row-cols-2 row-cols-md-3 row-cols-lg-4 g-3">
        {budgetValues.map((budget) => (
          <div key={budget} className="col">
            <div
              className="card bg-light border-primary text-center p-3"
              onClick={() => handleTileClick(budget)}
              style={{ cursor: 'pointer' }}
            >
              {budget}
            </div>
          </div>
        ))}
      </div>
    </div>
  );
};

export default BudgetTiles;
