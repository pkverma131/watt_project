import React, { useEffect, useState } from 'react';
import { useParams } from 'react-router-dom';
import Navigation from './Navigation';
import Footer from './Footer';
import BillCalculator from './BillCalculator';
import ProductDescription from './ProductDescription';
import ProductHighlights from './ProductHighlights';
import { API_URL } from './app.settings';

const ProductDetailsPage = () => {
  const { productId } = useParams();
  const [productDetails, setProductDetails] = useState(null);

  useEffect(() => {
    // Fetch the product details from the API using the productId from the URL
    fetch(`${API_URL}/catalogue/products/${productId}/`)
      .then((response) => response.json())
      .then((data) => setProductDetails(data))
      .catch((error) => console.error('Error fetching product details:', error));
  }, [productId]);

  if (!productDetails) {
    return <div>Loading...</div>;
  }

  return (
    <div>
      <Navigation />
      <div className="container mt-4">
        <h4>{productDetails.title}</h4>
        <BillCalculator productId={productId} />
        <ProductHighlights highlights={productDetails.highlights} />
        <ProductDescription description={productDetails.description} />
        {/* Add other product details as needed */}
      </div>
      <Footer />
    </div>
  );
};

export default ProductDetailsPage;
