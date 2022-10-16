# frozen_string_literal: true

ryan = User.create!(
  email: 'ryan@example.com',
  name: 'Ryan',
  password: 'password',
  password_confirmation: 'password'
)

rado = User.create!(
  name: 'Rado',
  email: 'rado@example.com',
  password: 'password',
  password_confirmation: 'password'
)

bob = User.create!(
  name: 'Bob',
  email: 'bob@example.com',
  password: 'password',
  password_confirmation: 'password'
)

UserAssociation.create!(
  followed_by_user: bob,
  following_user: ryan
)

producthunt = Post.create!(
  title: 'Product Hunt',
  tagline: 'The best new products in tech',
  url: 'https://www.producthunt.com',
  user: ryan
)

angellist = Post.create!(
  title: 'AngelList',
  tagline: 'Invest in Startups',
  url: 'https://angel.co',
  user: rado
)

post = Post.create!(
  title: 'iPhone X',
  tagline: 'It’s all screen',
  url: 'https://www.apple.com/iphone-x/',
  user: bob
)

Comment.create!(
  body: 'Introducing a new experiment...',
  post: producthunt,
  user: ryan
)

Comment.create!(
  body: 'I cannot stop browsing!',
  post: producthunt,
  user: rado
)

Comment.create!(
  body: 'Wow, just discovered a new app!',
  post: producthunt,
  user: rado
)

Comment.create!(
  body: 'Time to start investing!',
  post: angellist,
  user: rado
)

Vote.create!(
  user_id: ryan.id,
  post_id: post.id
)
