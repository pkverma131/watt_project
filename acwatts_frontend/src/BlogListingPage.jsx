import React, { useState, useEffect } from 'react';
import Navigation from './Navigation';
import Footer from './Footer';
import BlogPostItem from './BlogPostItem';
import { API_URL } from './app.settings';

const BlogListingPage = () => {
  const [blogPosts, setBlogPosts] = useState([]);

  useEffect(() => {
    // Fetch blog posts from the API
    fetch(`${API_URL}/article/api/v2/posts/?type=article.BlogPage&fields=post_image`)
      .then((response) => response.json())
      .then((data) => {
        // Extract blog post items from the response
        const items = data.items || [];
        setBlogPosts(items);
      })
      .catch((error) => console.error('Error fetching blog posts:', error));
  }, []);

  return (
    <div className="blog-listing-page">
      <Navigation />
      <div className="container mt-4">
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
