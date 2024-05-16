import React from 'react';

const ProductCard = ({ product }) => {
  const handleProductClick = () => {
    // Handle product click event, e.g., navigate to product details page
  };

  return (
    <div className="product-card" onClick={handleProductClick}>
      <img src={product.image} alt={product.name} />
      <h3>{product.name}</h3>
      <p>Price: ${product.price}</p>
      {/* Add more product details as needed */}
    </div>
  );
};

export default ProductCard;
