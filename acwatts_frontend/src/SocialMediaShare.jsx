import React from 'react';
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import './SocialMediaShare.css';
import { useLocation } from 'react-router-dom';

const SocialMediaShare = () => {
  const location = useLocation();
  const currentUrl = window.location.href;

  return (
    <div className="social-media-share">
      <div className="heading">
        <h4>Share This Post</h4>
      </div>
      {/* Include social media icons here */}
      <div className="icons">
        <a
          href={`https://facebook.com/share.php?u=${encodeURIComponent(currentUrl)}`}
          target="_blank"
          rel="noopener noreferrer"
        >
          <FontAwesomeIcon icon={['fab', 'facebook']} size="2x" />
        </a>
        <a
          href={`https://twitter.com/intent/tweet?url=${encodeURIComponent(currentUrl)}`}
          target="_blank"
          rel="noopener noreferrer"
        >
          <FontAwesomeIcon icon={['fab', 'twitter']} size="2x" />
        </a>
        <a
          href={`https://www.linkedin.com/shareArticle?url=${encodeURIComponent(currentUrl)}`}
          target="_blank"
          rel="noopener noreferrer"
        >
          <FontAwesomeIcon icon={['fab', 'linkedin']} size="2x" />
        </a>
      </div>
    </div>
  );
};

export default SocialMediaShare;
