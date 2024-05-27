import React from 'react';
import { Link } from 'react-router-dom';
import './BlogPostItem.css';
import { Card } from 'react-bootstrap';

const BlogPostItem = ({ post }) => {
  return (
    <Card className="blog-post-item" border="0">
      <Card.Body>
        <Card.Title>
          <Link to={`/blog/${post.id}`}>{post.title}</Link>
        </Card.Title>
        <Card.Text className="blog-snippet">{post.blog_snippet}</Card.Text>
        <Link to={`/blog/${post.id}`} className="read-more-link">Read More</Link>
      </Card.Body>
    </Card>
  );
};

export default BlogPostItem;
