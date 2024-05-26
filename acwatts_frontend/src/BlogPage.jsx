import React, { useEffect, useState } from 'react';
import { useParams } from 'react-router-dom';
import MainContent from './MainContent';
import RecentPosts from './RecentPosts';
import SocialMediaShare from './SocialMediaShare';
import Navigation from './Navigation';
import Footer from './Footer';
import { API_URL } from './app.settings';

const BlogPage = () => {
  const { blogId } = useParams();
  const [blogPost, setBlogPost] = useState(null);

  useEffect(() => {
    // Fetch the blog post using the API based on the blogId
    fetch(`${API_URL}/article/api/v2/posts/${blogId}/`)
      .then((response) => response.json())
      .then((data) => setBlogPost(data))
      .catch((error) => console.error('Error fetching blog post:', error));
  }, [blogId]);

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
            {blogPost && <RecentPosts tags={blogPost.tags} />}
            <SocialMediaShare />
          </div>
        </div>
      </div>
      <Footer />
    </div>
  );
};

export default BlogPage;
