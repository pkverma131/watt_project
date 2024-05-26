import React from 'react';

const MainContent = ({ post }) => {
  const { title, date, body } = post;

  return (
    <div className="main-content">
      <h2>{title}</h2>
      <p>Date: {date}</p>
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
