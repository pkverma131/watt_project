import React from 'react';

const Footer = () => {
  return (
    <footer className="bg-light py-4 text-center">
      <div className="container">
        <p>&copy; {new Date().getFullYear()} Acwatts. All rights reserved.</p>
      </div>
    </footer>
  );
};

export default Footer;
