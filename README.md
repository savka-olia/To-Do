<div class="error-msg">
    <ul class="error-list">
      <button type="button" class="close" data-dismiss="alert" aria-label="Close">
    <span aria-hidden="true">&times;</span>
  </button>
    <% @task.errors.full_messages.each do |error| %>
      <li><%= error %></li>
      
    <% end %>
  </ul>

  <i class="fa fa-times-circle"></i>
</div>