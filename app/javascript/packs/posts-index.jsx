import React, { useCallback, useState } from 'react';
import { useQuery, useMutation } from 'react-apollo';
import renderComponent from './utils/renderComponent';
import Errors from '../components/Errors';
import * as GqlQueries from './graphql_queries';

const PostsIndex = () => {
  const [errors, setErrors] = useState([]);
  const { data, loading, error } = useQuery(GqlQueries.POSTS_QUERY);
  const [updateVote] = useMutation(GqlQueries.UPDATE_VOTE);


  const handleVote = useCallback((e) => {
    const { id: postId } = e.target.dataset;

    updateVote({
      variables: { postId },
      update: (cache, { data: { voteMutation } }) => {
        const cachedData = cache.readQuery({ query: GqlQueries.POSTS_QUERY });
        const { isVoted, errors } = voteMutation;
        if (errors?.length) {
          if (errors.includes('current user is missing')) {
            window.location.href = '/users/sign_in'
          }
          setErrors(errors);
        } else {
          cachedData.posts = cachedData.posts.map((post) => {
            if (post.id === postId) {
              return { ...post, isVoted, noOfVotes: post.noOfVotes + (isVoted ? 1 : -1) }
            }

            return post;
          });

          cache.writeQuery({ query: GqlQueries.POSTS_QUERY }, cachedData);
        }
      }
    });
  }, [updateVote]);

  if (loading) return 'Loading...';
  if (error) return <Errors errors={[error.message]} />;

  return (
    <div>
      <Errors errors={errors} />
      {data.posts.map((post) => (
        <article className="post box" key={post.id}>
          <h2>
            <a href={`/posts/${post.id}`}>{post.title}</a>
          </h2>
          <div className="url">
            <a href={post.url}>{post.url}</a>
          </div>
          <div className="tagline">{post.tagline}</div>
          <footer>
            <button onClick={handleVote} data-id={post.id} className={post.isVoted ? 'voted-btn' : ''}>
              {post.isVoted ? '🔼' : '🔽' } {post.noOfVotes}
            </button>
            <button>💬 {post.commentsCount}</button>
          </footer>
        </article>
      ))}
    </div>
  );
};

renderComponent(PostsIndex);
