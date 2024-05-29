// ProductListingPage.js
import React, { useEffect, useState } from 'react';
import { Link, useLocation, useNavigate } from 'react-router-dom';
import { Card, ListGroup } from 'react-bootstrap';
import Navigation from './Navigation';
import Footer from './Footer';
import './ProductListingPage.css';
import ProductFilter from './ProductFilter';
import { API_URL } from './app.settings';

const ProductListingPage = () => {
  const [products, setProducts] = useState([]); // Initialize products as an empty array
  const itemsPerPage = 10; // Change this value as needed
  const [currentPage, setCurrentPage] = useState(1);
  const [totalPages, setTotalPages] = useState(1);
  const [maxDefaultBillAmount, setMaxDefaultBillAmount] = useState('');
  const [minCoverageArea, setMinCoverageArea] = useState('');

  const location = useLocation();
  const queryParams = new URLSearchParams(location.search);
  const initialMaxDefaultBillAmount = queryParams.get('max_default_bill_amount');
  const initialMinCoverageArea = queryParams.get('min_coverage_area');

  useEffect(() => {
    // Fetch initial values of maxDefaultBillAmount and minCoverageArea when the component mounts
    setMaxDefaultBillAmount(initialMaxDefaultBillAmount || '');
    setMinCoverageArea(initialMinCoverageArea || '');
    // Set currentPage based on the query parameter "page" from the URL
    setCurrentPage(Number(queryParams.get('page')) || 1);
  }, [initialMaxDefaultBillAmount, initialMinCoverageArea, queryParams]);

  const navigate = useNavigate();

  useEffect(() => {
    // Fetch the product data from the API with the appropriate filter
    let apiUrl = `${API_URL}/catalogue/products/?page=${currentPage}`;
    if (maxDefaultBillAmount) {
      apiUrl += `&max_default_bill_amount=${maxDefaultBillAmount}`;
    }
    if (minCoverageArea) {
      apiUrl += `&min_coverage_area=${minCoverageArea}`;
    }

    fetch(apiUrl)
      .then((response) => response.json())
      .then((data) => {
        setProducts(data.results);
        // Calculate the total number of pages based on the number of products and itemsPerPage
        const pages = Math.ceil(data.count / itemsPerPage);
        setTotalPages(pages);
      })
      .catch((error) => console.error('Error fetching product data:', error));
  }, [currentPage, maxDefaultBillAmount, minCoverageArea]);

  const handleFilterChange = (filters) => {
    // Update the state with the selected filter values and trigger the API call
    setCurrentPage(1); // Reset current page to 1 when applying filters
    setMaxDefaultBillAmount(filters.max_default_bill_amount || '');
    setMinCoverageArea(filters.min_coverage_area || '');

    // Update the URL with the selected filter values
    const queryParams = new URLSearchParams();
    if (filters.max_default_bill_amount) {
      queryParams.set('max_default_bill_amount', filters.max_default_bill_amount);
    }
    if (filters.min_coverage_area) {
      queryParams.set('min_coverage_area', filters.min_coverage_area);
    }
    const queryString = queryParams.toString();
    const newUrl = `${window.location.pathname}${queryString ? `?${queryString}` : ''}`;
    navigate(newUrl);
  };

  // Function to handle the previous page button click
  const handlePrevPage = () => {
    if (currentPage > 1) {
      setCurrentPage((prevPage) => prevPage - 1);
    }
  };

  // Function to handle the next page button click
  const handleNextPage = () => {
    if (currentPage < totalPages) {
      setCurrentPage((prevPage) => prevPage + 1);
    }
  };

  return (
    <div>
      <Navigation />
      <div className="container mt-4">
        <h2>Air Conditioners in Indian Market</h2>
        <div className="row">
          <div className="col-lg-12">
            {/* Add margin to the filter component */}
            <div className="mb-4">
              <ProductFilter onFilterChange={handleFilterChange} />
            </div>
          </div>
          <div className="row">
            {products.map((product) => (
              <div key={product.id} className="col-md-12 mb-3">
                <Card>
                  <Card.Header>
                    <h5>{product.title}</h5>
                  </Card.Header>
                  <ListGroup variant="flush">
                    <ListGroup.Item>
                      Wattage: <strong>{product.important_specification.wattage}</strong>, 
                      Coverage Area: <strong>{product.important_specification.coverage_area}</strong>, 
                      Energy Rating: <strong>{product.important_specification.energy_rating}</strong>
                    </ListGroup.Item>
                    <ListGroup.Item>
                      Expected Bill Amount (if used 8 hours daily): <strong>Rs.{product.important_specification.default_bill_amount}</strong>
                    </ListGroup.Item>
                    <ListGroup.Item>
                      <Link to={`/catalogue/product/${product.id}`}>View Details</Link>
                    </ListGroup.Item>
                  </ListGroup>
                </Card>
              </div>
            ))}
          </div>
          {/* Pagination buttons */}
          <div className="d-flex justify-content-center mt-3">
            <button
              className="btn btn-primary mr-2"
              onClick={handlePrevPage}
              disabled={currentPage === 1}
            >
              Previous
            </button>
            {/* Generate dynamic page numbers based on the totalPages */}
            {[...Array(totalPages).keys()].map((pageNumber) => (
              <button
                key={pageNumber + 1}
                className={`btn btn-primary ${
                  pageNumber + 1 === currentPage ? 'active' : ''
                }`}
                onClick={() => setCurrentPage(pageNumber + 1)}
              >
                {pageNumber + 1}
              </button>
            ))}
            <button
              className="btn btn-primary"
              onClick={handleNextPage}
              disabled={currentPage === totalPages}
            >
              Next
            </button>
          </div>
        </div>
      </div>
      <Footer />
    </div>
  );
};

export default ProductListingPage;
