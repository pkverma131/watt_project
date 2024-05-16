import React, { useState, useEffect } from 'react';
import { useNavigate } from 'react-router-dom';
import './SearchBox.css';

const SearchBox = ({ onSelect }) => {
  const [searchQuery, setSearchQuery] = useState('');
  const [autoSuggestions, setAutoSuggestions] = useState([]);
  const history = useNavigate();

  useEffect(() => {
    // Debounce the handleSearchChange function with a delay of 500ms (adjust as needed)
    const debounceTimer = setTimeout(() => {
      handleSearchChange(searchQuery); // Pass the current searchQuery to the debounced function
    }, 500);

    // Clear the timer on component re-render to avoid triggering the API call too soon
    return () => clearTimeout(debounceTimer);
  }, [searchQuery]);

  const handleSearchChange = (query) => {
    setSearchQuery(query);

    fetch(`http://localhost:8000/catalogue/search/?query=${encodeURIComponent(query)}`)
      .then((response) => response.json())
      .then((data) => setAutoSuggestions(data))
      .catch((error) => console.error('Error fetching auto-suggestions:', error));

  };

  const handleSearchSubmit = (e) => {
    e.preventDefault();
    // Perform the search logic, e.g., call the onSelect callback with the search results
    onSelect(autoSuggestions);
  };

  const handleSelectItem = (itemId) => {
    // Redirect to ProductDetailsPage with the selected product ID
    history(`/catalogue/product/${itemId}`);
  };

  return (
    <div className="search-container">
      <form onSubmit={handleSearchSubmit} className="input-group">
        <input
          type="text"
          value={searchQuery}
          onChange={(e) => handleSearchChange(e.target.value)} // Call handleSearchChange directly here
          className="form-control"
          placeholder="Search for air conditioner by name, brand or model..."
        />
        <button type="submit" className="btn btn-primary">
          Search
        </button>
      </form>
      {/* Display auto-suggestions in a scrollable dropdown */}
      {autoSuggestions.length > 0 && searchQuery !== '' && (
        <div className="list-group" style={{ maxHeight: '200px', overflowY: 'auto' }}>
          {autoSuggestions.map((item, index) => (
            <a
              key={index}
              href="#"
              className="list-group-item list-group-item-action"
              onClick={() => handleSelectItem(item.id)}
            >
              {item.title}
            </a>
          ))}
        </div>
      )}
    </div>
  );
};

export default SearchBox;
