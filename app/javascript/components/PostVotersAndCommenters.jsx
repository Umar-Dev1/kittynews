import React from 'react';

const PostVotersAndCommenters = ({ comments, voters }) => {
  return (
    <div className="box mb-4">
      <div className="box">
        <h4>Commenters:</h4>
        {comments.map((comment) => (
          <span  key={comment.id} className="titles m-4" title="Source Title"><a href={`/users/${comment.user.id}`}>{comment.user.name}</a></span>
        ))}
      </div>

      <div className="box">
        <h4>Voters:</h4>
        {voters.map((voter) => (
          <span  key={voter.id} className="titles m-4" title="Source Title"><a href={`/users/${voter.id}`}>{voter.name}</a></span>
        ))}
      </div>
    </div>
  );
};

export default PostVotersAndCommenters;
