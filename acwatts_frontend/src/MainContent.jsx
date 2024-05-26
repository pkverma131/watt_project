import React from 'react';
import { Card } from 'react-bootstrap';
import { API_URL } from './app.settings';

const MainContent = ({ post }) => {
  const { title, date, body, post_image } = post;

  return (
    <div className="main-content">
      <h2>{title}</h2>
      <p>Date: {date}</p>
      {post_image && (
          <Card.Img 
            variant="top" 
            src={`${API_URL}${post_image.meta.download_url}`} 
            alt={post_image.title} 
            style={{ width: '480px' }} 
          />
        )}
      <div className="body-content">
        {body.map((contentBlock, index) => (
          <ContentBlock key={index} block={contentBlock} />
        ))}
      </div>
    </div>
  );
};

const ContentBlock = ({ block }) => {
  switch (block.type) {
    case 'heading':
      return <h3>{block.value}</h3>;
    case 'paragraph':
      return <p dangerouslySetInnerHTML={{ __html: block.value }} />;
    default:
      return null;
  }
};

export default MainContent;
