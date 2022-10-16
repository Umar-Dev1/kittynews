import React from 'react';
import { format } from 'date-fns';

const Comments = ({ comments }) => {
  return (
    <div>
      <div className="box">
        <h4>Comments:</h4>
        {comments.map((comment) => (
          <div key={comment.id} className="card mb-1">
            <div className="card-body">
            <blockquote className="blockquote mb-0">
              <p>{comment.body}</p>
              <footer className="blockquote-footer">
                <span className="titles" title="Source Title">{comment.user.name}</span>
                <span className="commented-at">{format(new Date(comment.createdAt), 'dd-MMM-yyyy HH:mm')}</span>
              </footer>
            </blockquote>
            </div>
          </div>
        ))}
      </div>
    </div>
  );
};

export default Comments;
