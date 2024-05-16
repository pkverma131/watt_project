import React, { useEffect, useState } from 'react';
import { useParams } from 'react-router-dom';
import MainContent from './MainContent';
import RecentPosts from './RecentPosts';
import SocialMediaShare from './SocialMediaShare';
import Navigation from './Navigation';
import Footer from './Footer';

const BlogPage = () => {
  const [blogPost, setBlogPost] = useState(null);
  
  const urlParts = window.location.pathname.split('/');
  const id = urlParts[urlParts.length - 1];

  useEffect(() => {
    // Fetch the blog post using the API based on the id
    fetch(`http://localhost:8000/blog/posts/${id}/`)
      .then((response) => response.json())
      .then((data) => setBlogPost(data))
      .catch((error) => console.error('Error fetching blog post:', error));
  }, [id]);

  return (
    <div className="blog-page">
      <Navigation />
      <div className="container mt-4">
        <div className="row">
          <div className="col-lg-8">
            {blogPost ? (
              <MainContent post={blogPost} />
            ) : (
              <p>Loading...</p>
            )}
          </div>
          <div className="col-lg-4">
            <RecentPosts />
            <SocialMediaShare />
          </div>
        </div>
      </div>
      <Footer />
    </div>
  );
};

export default BlogPage;
