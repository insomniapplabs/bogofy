class PagesController < ApplicationController
  def home
  	if user_signed_in?
  		@link = current_user.links.build
  		@links = current_user.links.order('link_name asc')
  		@list = current_user.lists.build
  		@lists = current_user.lists.order('name asc')
  		@micropost = current_user.microposts.build
  		@microposts = current_user.microposts.order('created_at desc')
      @new_users = User.order('created_at desc')
    

      #@feed = Micropost.where("user_id in (?)", following.push(current_user.id)).order("created_at").all
  	  #@feed = current_user.following_by_type('Micropost').order('created_at desc')
    

      following_ids = current_user.following_users.map(&:id)
      following_ids << current_user
      @feed = Micropost.where(user_id: following_ids ).order("created_at desc")
    end
  end

  def tour

  end

end


#@statuses = Status.where("member_id in (?)", following_ids.push(current_member.id)).order("created_at desc").all
#<% for micropost in @feed %>
#          <div class="micro-container">
#              <div class="micro-image">
#                <%= image_tag avatar_url(current_user), align: "left", class: "img-border" %>
#              </div>
#              <div class="micro-text-container">
#                <p class="micro-text-hdr"><%= "#{current_user.first_name} #{current_user.last_name}" %> <span class="pull-right time-ago"><%= time_ago_in_words(micropost.created_at) %> ago</span></p>
#                <p class="micro-text"><%= micropost.content %><p>
#              </div>
#            </div>
#        <% end %>

#following_ids = current_user.following_users.map(&:id)
#Post.where(user_id: following_ids).order("created_at DESC").paginate(page: params[:page])

#<% if @microposts.present? %>
#          <% for micropost in @microposts %>
#            <div class="micro-container">
#              <div class="micro-image">
#                <%= image_tag avatar_url(current_user), align: "left", class: "img-border" %>
#              </div>
#              <div class="micro-text-container">
#                <p class="micro-text-hdr"><%= "#{micropost.user.first_name} #{micropost.user.last_name}" %> <span class="pull-right time-ago"><%= time_ago_in_words(micropost.created_at) %> ago</span></p>
#            
#                <p class="micro-text"><%= micropost.content %><p>
#              </div>
#            </div>
#          <% end %>
#        <% else %>
#          <p>There has been no activity!</p>
#        <% end %>