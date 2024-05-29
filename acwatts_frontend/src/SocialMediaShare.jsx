import React from 'react';
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import './SocialMediaShare.css';
import { useLocation } from 'react-router-dom';

const SocialMediaShare = () => {
  const location = useLocation();
  const currentUrl = window.location.href;

  const handleCopyLink = () => {
    navigator.clipboard.writeText(currentUrl)
      .then(() => {
        alert('Link copied to clipboard');
      })
      .catch((error) => {
        console.error('Error copying link to clipboard:', error);
      });
  };

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
        <a
          href={`whatsapp://send?text=${encodeURIComponent(currentUrl)}`}
          data-action="share/whatsapp/share"
          target="_blank"
          rel="noopener noreferrer"
        >
          <FontAwesomeIcon icon={['fab', 'whatsapp']} size="2x" />
        </a>
        {/* <button onClick={handleCopyLink}>
          <FontAwesomeIcon icon={['fas', 'link']} size="2x" />
          <span>Copy Link</span>
        </button> */}
      </div>
    </div>
  );
};

export default SocialMediaShare;
