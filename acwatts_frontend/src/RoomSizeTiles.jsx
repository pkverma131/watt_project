import React from 'react';
import { useNavigate } from 'react-router-dom';

const roomSizes = [
  { label: 'Below 120 sq.ft.', description: 'Small Bedroom',value:'120'},
  { label: '120-170 sq.ft.', description: 'Big Bedroom',value:170 },
  { label: 'Above 170 sq.ft.', description: 'Living Room',value:200},
];

const RoomSizeTiles = () => {
  const navigate = useNavigate();
  const handleTileClick = (size) => {
    const min_coverage_area = size.value;
    navigate(`/catalogue/products/?min_coverage_area=${min_coverage_area}`);
  };

  return (
    <div>
      <h3>Select Room Size:</h3>
      <div className="row row-cols-2 row-cols-md-3 row-cols-lg-4 g-3">
        {roomSizes.map((room) => (
          <div key={room.label} className="col">
            <div
              className="card bg-light border-primary text-center p-3"
              onClick={() => handleTileClick(room)}
              style={{ cursor: 'pointer' }}
            >
              <h5>{room.label}</h5> 
              {/* Add tranding pointer here ? */}
              <p>{room.description}</p>
            </div>
          </div>
        ))}
      </div>
    </div>
  );
};

export default RoomSizeTiles;
