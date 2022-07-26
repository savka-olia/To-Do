<nav class="navbar navbar-expand-lg navbar-light">
  <%= link_to 'ToDos', tasks_path, class:"navbar-brand" %>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarNavDropdown">
    <ul class="navbar-nav">
      <li class="nav-item">
         <%= link_to "Home", root_path, class:"nav-link" %>
      </li>
      <% if current_user %>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" role="button" data-toggle="dropdown" aria-expanded="false">
            Profile
          </a>
          <div class="dropdown-menu">
            <%= link_to "Edit profile", edit_user_registration_path, class:"dropdown-item" %>
            <%= link_to "Log Out", destroy_user_session_path, class:"dropdown-item", method: :delete %>
          </div>
        </li>
      <% else %>
        <li><%= link_to "Log In", user_session_path, class:"nav-link" %></li>
        <li><%= link_to "Sign up", new_user_registration_path, class:"nav-link" %></li>
      <% end %>
    </ul>
  </div>
</nav>