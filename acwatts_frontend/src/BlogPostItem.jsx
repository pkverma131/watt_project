import React from 'react';
import { Link } from 'react-router-dom';
import './BlogPostItem.css'; // Import the CSS file for custom styling
import { Card } from 'react-bootstrap'; // Import the Card component from react-bootstrap

const BlogPostItem = ({ post }) => {
  return (
    <Card className="blog-post-item">
      <Card.Body>
        <Card.Title>
          <Link to={`/blog/${post.id}`}>{post.title}</Link>
        </Card.Title>
        <Card.Text className="key-points">{post.key_points}</Card.Text>
        {/* You can also display additional information if needed */}
      </Card.Body>
    </Card>
  );
};

export default BlogPostItem;
