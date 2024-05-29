import React, { useEffect, useState } from 'react';
import { useNavigate } from 'react-router-dom';
import axios from 'axios';

const BrandTiles = () => {
  const navigate = useNavigate();
  const [brands, setBrands] = useState([]);

  useEffect(() => {
    // Fetch the brands from the API
    axios.get(`${API_URL}/catalogue/brands`)
      .then(response => setBrands(response.data))
      .catch(error => console.error('Error fetching brands:', error));
  }, []);

  const handleTileClick = (brand) => {
    // Handle tile click event, navigate to product listing page with the selected brand filter
    navigate(`/catalogue/products/?brand=${brand}`);
  };

  return (
    <div>
      <h3>Select Brand:</h3>
      <div className="row row-cols-2 row-cols-md-3 row-cols-lg-4 g-3">
        {brands.map((brand) => (
          <div key={brand} className="col">
            <div
              className="card bg-light border-primary text-center p-3"
              onClick={() => handleTileClick(brand)}
              style={{ cursor: 'pointer' }}
            >
              {brand.name}
            </div>
          </div>
        ))}
      </div>
    </div>
  );
};

export default BrandTiles;
