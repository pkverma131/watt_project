import React from 'react';

const MainContent = ({ post }) => {
  return (
    <div className="main-content">
      <h4>{post.title}</h4>
      <p>{post.key_points}</p>
      <p>{post.main_content}</p>
    </div>
  );
};

export default MainContent;
