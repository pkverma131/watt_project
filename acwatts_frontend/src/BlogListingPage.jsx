import React, { useState, useEffect } from 'react';
import Navigation from './Navigation';
import Footer from './Footer';
import BlogPostItem from './BlogPostItem'; // Import the new component

const BlogListingPage = () => {
  const [blogPosts, setBlogPosts] = useState([]);

  useEffect(() => {
    // Fetch blog posts from the API
    fetch('http://localhost:8000/blog/posts/')
      .then((response) => response.json())
      .then((data) => setBlogPosts(data))
      .catch((error) => console.error('Error fetching blog posts:', error));
  }, []);

  return (
    <div className="blog-listing-page">
      <Navigation />
      <div className="container mt-4">
        <h1>Blog Posts</h1>
        <div className="blog-list">
          {blogPosts.map((post) => (
            <BlogPostItem key={post.id} post={post} />
          ))}
        </div>
      </div>
      <Footer />
    </div>
  );
};

export default BlogListingPage;
