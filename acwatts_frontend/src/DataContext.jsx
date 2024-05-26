import React, { createContext, useState, useEffect } from 'react';
import { API_URL } from './app.settings';

const DataContext = createContext();

const DataProvider = ({ children }) => {
  const [cachedData, setCachedData] = useState([]);
  const cacheExpiryTime = 60 * 1000; // 60 seconds in milliseconds
  const [lastFetchTime, setLastFetchTime] = useState(null);

  useEffect(() => {
    const cachedData = JSON.parse(localStorage.getItem('cachedData') || 'null');
    const lastFetchTime = localStorage.getItem('lastFetchTime');

    // Check if the cached data exists and if it's not expired
    if (cachedData && lastFetchTime && Date.now() - Number(lastFetchTime) < cacheExpiryTime) {
      setCachedData(cachedData);
    } else {
      // Fetch data from the backend API and update the cache
      fetch(`${API_URL}/catalogue/search/?query=${encodeURIComponent(query)}`)
        .then((response) => response.json())
        .then((data) => {
          setCachedData(data);
          localStorage.setItem('cachedData', JSON.stringify(data));
          localStorage.setItem('lastFetchTime', Date.now());
        })
        .catch((error) => console.error('Error fetching data:', error));
    }
  }, []);

  return (
    <DataContext.Provider value={cachedData}>
      {children}
    </DataContext.Provider>
  );
};

export { DataContext, DataProvider };
