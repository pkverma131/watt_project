// ProductListingPage.js
import React, { useEffect, useState } from 'react';
import { Link, useLocation, useNavigate} from 'react-router-dom';
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
  // Calculate the starting and ending index of products to be displayed on the current page
  const startIndex = (currentPage - 1) * itemsPerPage;
  const endIndex = startIndex + itemsPerPage;
  // Function to generate an array of page numbers to be displayed in the pagination
  const generatePageNumbers = () => {
    const pageNumbers = [];
    const maxVisiblePages = 5;

    if (totalPages <= maxVisiblePages) {
      for (let i = 1; i <= totalPages; i++) {
        pageNumbers.push(i);
      }
    } else {
      // Show first 2 pages
      for (let i = 1; i <= 2; i++) {
        pageNumbers.push(i);
      }

      // Show ellipsis if not on the first page
      if (currentPage > 3) {
        pageNumbers.push('...');
      }

      // Show current page and two adjacent pages if possible
      for (let i = Math.max(3, currentPage - 1); i <= Math.min(totalPages - 2, currentPage + 1); i++) {
        pageNumbers.push(i);
      }

      // Show ellipsis if not on the last page
      if (currentPage < totalPages - 2) {
        pageNumbers.push('...');
      }

      // Show last 2 pages
      for (let i = totalPages - 1; i <= totalPages; i++) {
        pageNumbers.push(i);
      }
    }

    return pageNumbers;
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
              <Card.Header>{product.title}</Card.Header>
              <ListGroup variant="flush">
                <ListGroup.Item>
                  Model Number: {product.model_number}
                </ListGroup.Item>
                {/* {product.highlights && Array.isArray(product.highlights) && (
                  <ListGroup.Item>
                    Highlights:
                    <ul>
                      {product.highlights.map((highlight, index) => (
                        <li key={index}>{highlight}</li>
                      ))}
                    </ul>
                  </ListGroup.Item>
                )} */}
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
        {generatePageNumbers().map((pageNumber, index) => (
          <button
            key={index}
            className={`btn btn-primary ${
              pageNumber === currentPage || pageNumber === '...' ? 'active' : ''
            }`}
            onClick={() => {
              if (typeof pageNumber === 'number') setCurrentPage(pageNumber);
            }}
          >
            {pageNumber}
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
