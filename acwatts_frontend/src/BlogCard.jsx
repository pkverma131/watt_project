import React from 'react';

const BlogCard = ({ blog }) => {
  const handleBlogClick = () => {
    // Handle blog click event, e.g., navigate to blog details page
  };

  return (
    <div className="blog-card" onClick={handleBlogClick}>
      <img src={blog.image} alt={blog.title} />
      <h3>{blog.title}</h3>
      <p>{blog.date}</p>
      {/* Add more blog details as needed */}
    </div>
  );
};

export default BlogCard;
