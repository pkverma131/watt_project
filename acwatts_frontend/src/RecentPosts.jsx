import React, { useEffect, useState } from 'react';
import { Link, useParams } from 'react-router-dom';
import './RecentPosts.css';

const RecentPosts = () => {
  const [recentPosts, setRecentPosts] = useState([]);
  const urlParts = window.location.pathname.split('/');
  const currentPostId = urlParts[urlParts.length - 1];

  useEffect(() => {
    // Fetch the recent blog posts from the API
    fetch('http://localhost:8000/blog/posts/')
      .then((response) => response.json())
      .then((data) => {
        setRecentPosts(data);
      })
      .catch((error) => console.error('Error fetching recent posts:', error));
  }, []);

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
              <Link to={`/blog/${post.id}`}>{post.title}</Link>
            </li>
          )
        ))}
      </ul>
    </div>
  );
};

export default RecentPosts;
