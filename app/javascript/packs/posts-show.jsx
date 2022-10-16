import React, { useState, useCallback } from 'react';
import renderComponent from './utils/renderComponent';
import { useQuery, useMutation } from 'react-apollo';

import * as GqlQueries from './graphql_queries';
import Comments from '../components/Comments';
import PostVotersAndCommenters from '../components/PostVotersAndCommenters'
import Errors from '../components/Errors';

const PostsShow = ({ postId }) => {
  const [errors, setErrors] = useState([]);

  const {
    data: { post } = {},
    loading,
    error,
  } = useQuery(GqlQueries.POST_QUERY, { variables: { postId: postId.toString()}});
  const [updateVote] = useMutation(GqlQueries.UPDATE_VOTE);

  const handleVoteClick = useCallback(() => {
    updateVote({
      variables: { postId: postId.toString() },
      update: (cache, { data: { voteMutation } }) => {
        const cachedData = cache.readQuery({ query: GqlQueries.POST_QUERY, variables: { postId: postId.toString()} });
        const { isVoted, errors } = voteMutation;
        if (errors?.length) {
          if (errors.includes('current user is missing')) {
            window.location.href = '/users/sign_in'
          }
          setErrors(errors);
        } else {
          cachedData.post.isVoted = isVoted;
          cachedData.post.noOfVotes = cachedData.post.noOfVotes + (isVoted ? 1 : -1);
        }
      }
    });
  }, [updateVote, postId]);

  if (loading) return 'Loading...';
  if (error) return <Errors errors={[error.message]} />;


  return (
    <>
      <div className="post">
        <Errors errors={errors} />
        <article className="box">
          <h2>
            <p className="titles">{post.title}</p>
          </h2>
          <div className="url">
            <a href={post.url} target="_blank">
              {post.url}
            </a>
          </div>
          <div className="tagline">{post.tagline}</div>
          <footer>
            <button onClick={handleVoteClick} data-id={post.id} className={post.isVoted ? 'voted-btn' : ''}>
              {post.isVoted ? '🔼' : '🔽' } {post.noOfVotes}
            </button>
            {post.commentsCount} comments | author:{' '}
            {post.user.name}
          </footer>
        </article>
      </div>
      <PostVotersAndCommenters comments={post.comments} voters={post.voters} />
      <Comments comments={post.comments} />
    </>
  );
}

renderComponent(PostsShow);
