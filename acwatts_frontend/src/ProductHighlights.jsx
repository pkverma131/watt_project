import React from 'react';

const ProductHighlights = ({ highlights }) => {
  return (
    <div className="product-highlights p-3 border rounded mb-4">
      <h5 className="font-weight-bold">Highlights:</h5>
      <ul className="list-disc pl-4">
        {highlights.map((highlight, index) => (
          <li key={index}>{highlight}</li>
        ))}
      </ul>
    </div>
  );
};

export default ProductHighlights;
