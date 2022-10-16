import React, { useState, useCallback } from 'react';
import renderComponent from './utils/renderComponent';
import { useQuery, useMutation } from 'react-apollo';

import * as GqlQueries from './graphql_queries';
import Errors from '../components/Errors';
import { VariablesInAllowedPositionRule } from 'graphql';

const UsersShow = ({ userId }) => {
  const [errors, setErrors] = useState([]);

  const {
    data: { user } = {},
    loading,
    error,
  } = useQuery(GqlQueries.USER_QUERY, { variables: { userId: userId.toString()}});
  
  const [updateFollowee] = useMutation(GqlQueries.UPDATE_FOLLOWEE);

  const handleFolloweeClick = useCallback(() => {
    updateFollowee({
      variables: { userId: userId.toString() },
      update: (cache, { data: { followeeMutation } }) => {
        const cachedData = cache.readQuery({ query: GqlQueries.USER_QUERY, variables: { userId: userId.toString()} });
        const { isFollowing, errors } = followeeMutation;
        if (errors?.length) {
          if (errors.includes('current user is missing')) {
            window.location.href = '/users/sign_in'
          }
          setErrors(errors);
        } else {
          cachedData.user.isFollowing = isFollowing;
        }
      }
    });
  }, [updateFollowee, userId]);

  if (loading) return 'Loading...';
  if (error) return <Errors errors={[error.message]} />;


  return (
    <>
      <div className="user">
        <Errors errors={errors} />
        <article className="box">
          <h2>
            <p className="titles">{user.name}</p>
          </h2>
          <p>{user.isFollowing}</p>
          <footer>
            <button onClick={handleFolloweeClick} data-id={user.id} className={user.isFollowing ? 'btn btn-secondary' : 'btn btn-primary'} >
            {user.isFollowing ? 'Un-Follow' : 'Follow'}
            </button>
          </footer>
        </article>
      </div>
    </>
  );
}

renderComponent(UsersShow);
