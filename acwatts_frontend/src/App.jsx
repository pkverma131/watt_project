// App.js
import React from 'react';
import { BrowserRouter as Router, Route, Routes } from 'react-router-dom'; // Update import statement
import HomePage from './HomePgae'; // Update import path
import ProductListingPage from './ProductListingPage';
import ProductDetailsPage from './ProductDetailsPage'; // Update import path
import BlogListingPage from './BlogListingPage';
import BlogPage from './BlogPage'

import { library } from '@fortawesome/fontawesome-svg-core';
import { fab } from '@fortawesome/free-brands-svg-icons';

// Add Font Awesome icons to the library
library.add(fab);


const App = () => {
  return (
    <Router>
      <div className="App">
          <Routes>
            <Route path="/" element={<HomePage />} />
            <Route path="/catalogue/products" element={<ProductListingPage />} /> {/* Updated route path */}
            <Route path="/catalogue/product/:productId" element={<ProductDetailsPage />} /> {/* Updated route path */}
            <Route path="/blogs" element={<BlogListingPage />} /> {/* Updated route path */}
            <Route path="/blog/:blogId" element={<BlogPage />} /> 
          </Routes>
      </div>
    </Router>
  );
};

export default App;
