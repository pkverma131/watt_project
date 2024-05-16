import React from 'react';

const ProductDescription = ({ description }) => {
  return (
    <div className="product-description p-3 border rounded mb-4">
      <h5 className="font-weight-bold">Description:</h5>
      <p>{description}</p>
    </div>
  );
};

export default ProductDescription;
