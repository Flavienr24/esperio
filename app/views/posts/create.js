
// function refreshForm(innerHTML) {
//   const newPostForm = document.getElementById('new_post');
//   newPostForm.innerHTML = innerHTML;
// }

// function addPost(postHTML) {
//   const posts = document.getElementById('posts');
//   posts.insertAdjacentHTML('beforeend', postHTML);
// }

// <% if @post.errors.any? %>
//   refreshForm('<%= j render "posts/form", project: @project, post: @post %>');
// <% else %>
//   addPost('<%= j render "posts/show", post: @post %>');
//   refreshForm('<%= j render "posts/form", project: @project, post: Post.new %>');
// <% end %>
