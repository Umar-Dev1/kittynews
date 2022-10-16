import gql from 'graphql-tag';

export const POSTS_QUERY = gql`
  query PostsPage {
    viewer {
      id
    }
    posts {
      id
      title
      tagline
      url
      commentsCount
      noOfVotes
      isVoted
    }
  }
`;

export const POST_QUERY = gql`
  query PostsPage($postId: String!) {
    post(postId: $postId) {
      id
      title
      tagline
      url
      commentsCount
      noOfVotes
      isVoted
      comments {
        id
        body
        createdAt
        user {
          id
          name
        }
      }
      user {
        id
        name
      }
      voters {
        id
        name
      }
    }
  }
`;

export const USER_QUERY = gql`
  query UsersPage($userId: String!) {
    viewer {
      id
    }
    user(userId: $userId) {
      id
      name
      isFollowing
    }
  }
`;


export const UPDATE_FOLLOWEE = gql`
  mutation UsersPage($userId: String!) {
    userAssociationUpdate(userId: $userId) {
      isFollowing
      errors
    }
  }
`;

export const UPDATE_VOTE = gql`
  mutation PostsPage($postId: String!) {
    voteMutation(postId: $postId) {
      errors
      isVoted
    }
  }
`;
