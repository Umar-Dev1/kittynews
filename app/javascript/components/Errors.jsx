import React from 'react';

const Errors = ({ errors }) => {
  return (
    <>
      {errors.map((error) => (
        <div key={error} className="notice">{error}</div>
      ))}
    </>
  );
};

export default Errors;
