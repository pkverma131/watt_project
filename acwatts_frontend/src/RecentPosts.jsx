import React, { useEffect, useState } from 'react';
import { Link } from 'react-router-dom';
import { Card } from 'react-bootstrap';
import './RecentPosts.css';
import { API_URL } from './app.settings';

const RecentPosts = ({ tags }) => {
  const [recentPosts, setRecentPosts] = useState([]);
  const urlParts = window.location.pathname.split('/');
  const currentPostId = urlParts[urlParts.length - 1];

  useEffect(() => {
    if (tags && tags.length > 0) {
      // Fetch the recent blog posts from the API
      fetch(`${API_URL}/article/api/v2/posts/?type=article.BlogPage&tags=${tags.join(',')}`)
        .then((response) => response.json())
        .then((data) => {
          setRecentPosts(data.items); // Adjusted based on your API response structure
        })
        .catch((error) => console.error('Error fetching recent posts:', error));
    }
  }, [tags]);

  return (
    <div className="recent-posts">
      <div className="heading">
        <h4>Recent Posts</h4>
      </div>
      <ul>
        {recentPosts.map((post) => (
          // Exclude the current page from the recent posts list
          post.id !== parseInt(currentPostId) && (
            <li key={post.id}>
              <Card className="blog-post-item" border="0">
                <Card.Body>
                  <Card.Title>
                    <Link to={`/blog/${post.id}`}>{post.title}</Link>
                  </Card.Title>
                </Card.Body>
              </Card>
            </li>
          )
        ))}
      </ul>
    </div>
  );
};

export default RecentPosts;
