import React, { useState } from 'react';
import Navigation from './Navigation';
import Footer from './Footer';
import SearchBox from './SearchBox';
import BudgetTiles from './BudgetTiles';
import RoomSizeTiles from './RoomSizeTiles';

const HomePage = () => {
  // eslint-disable-next-line
  const [selectedProduct, setSelectedProduct] = useState(null);

  const handleProductSelect = (product) => {
    setSelectedProduct(product);
    // Redirect to the product details page with pre-filled data
  };

  return (
    <div>
      <Navigation />
      <div className="container py-4">
        <h2 className="text-center mb-5">Search Air Conditioner Products</h2>
        <div className="row justify-content-center">
          <div className="col-md-8">
            <SearchBox onSelect={handleProductSelect} />
          </div>
          </div>
          <div className="row justify-content-center">
          <div className="col-md-8">
            <div className="bg-white rounded p-4">
              <BudgetTiles />
            </div>
          </div>
          <div className="row justify-content-center">
          <div className="col-md-8">
            <div className="bg-white rounded p-4">
              <RoomSizeTiles />
            </div>
          </div>
        </div>
        </div>
      </div>
      <Footer />
    </div>
  );
};

export default HomePage;
