import React from 'react';
import { Link } from 'react-router-dom';
import './BlogPostItem.css';
import { Card } from 'react-bootstrap';
import { API_URL } from './app.settings';

const BlogPostItem = ({ post }) => {
  return (
    <Card className="blog-post-item">
      <Card.Body>
      <Card.Title>
          <Link to={`/blog/${post.id}`}>{post.title}</Link>
      </Card.Title>
      {post.post_image && ( // Check if post has an image
          <Card.Img 
            variant="top" 
            src={`${API_URL}${post.post_image.meta.download_url}`} 
            alt={post.post_image.title} 
            style={{ width: '480px' }} 
          />
        )}
        <Card.Text className="key-points">{post.key_points}</Card.Text>
        {/* You can also display additional information if needed */}
      </Card.Body>
    </Card>
  );
};

export default BlogPostItem;
