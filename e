[1mdiff --git a/Gemfile b/Gemfile[m
[1mindex e053a8f..52388e4 100644[m
[1m--- a/Gemfile[m
[1m+++ b/Gemfile[m
[36m@@ -78,3 +78,5 @@[m [mgroup :test do[m
 end[m
 [m
 gem 'faker', :git => 'https://github.com/faker-ruby/faker.git', :branch => 'main'[m
[32m+[m
[32m+[m[32mgem "pg_search"[m
[1mdiff --git a/Gemfile.lock b/Gemfile.lock[m
[1mindex ff3f55f..feb7727 100644[m
[1m--- a/Gemfile.lock[m
[1m+++ b/Gemfile.lock[m
[36m@@ -163,6 +163,9 @@[m [mGEM[m
       racc (~> 1.4)[m
     orm_adapter (0.5.0)[m
     pg (1.4.6)[m
[32m+[m[32m    pg_search (2.3.6)[m
[32m+[m[32m      activerecord (>= 5.2)[m
[32m+[m[32m      activesupport (>= 5.2)[m
     public_suffix (5.0.1)[m
     puma (5.6.5)[m
       nio4r (~> 2.0)[m
[36m@@ -271,6 +274,7 @@[m [mDEPENDENCIES[m
   jbuilder[m
   jsbundling-rails[m
   pg (~> 1.1)[m
[32m+[m[32m  pg_search[m
   puma (~> 5.0)[m
   rails (~> 7.0.4, >= 7.0.4.2)[m
   sassc-rails[m
[1mdiff --git a/app/assets/stylesheets/components/_navbar.scss b/app/assets/stylesheets/components/_navbar.scss[m
[1mindex 9de72f3..7608363 100644[m
[1m--- a/app/assets/stylesheets/components/_navbar.scss[m
[1m+++ b/app/assets/stylesheets/components/_navbar.scss[m
[36m@@ -56,3 +56,4 @@[m
   color: #0D8BD3;[m
   padding: 10px 15px 10px 15px;[m
 }[m
[41m+[m
[1mdiff --git a/app/controllers/polls_controller.rb b/app/controllers/polls_controller.rb[m
[1mindex 10f9585..d7a3090 100644[m
[1m--- a/app/controllers/polls_controller.rb[m
[1m+++ b/app/controllers/polls_controller.rb[m
[36m@@ -3,7 +3,13 @@[m [mclass PollsController < ApplicationController[m
 [m
 [m
   def index[m
[31m-    @polls = Poll.all[m
[32m+[m[32m    if params[:query].present?[m
[32m+[m[32m      @polls = Poll.search_by_category_and_question(params[:query])[m
[32m+[m[32m    else[m
[32m+[m[32m      @polls = Poll.all[m
[32m+[m[32m    end[m
[32m+[m[32m    #   sql_query = "category.title @@ :query OR question @@ :query OR first_option @@ :query OR second_option @@ :query"[m
[32m+[m[32m    #   @polls = Poll.where(sql_query, query: "%#{params[:query]}%")[m
   end[m
 [m
   def new[m
[1mdiff --git a/app/models/poll.rb b/app/models/poll.rb[m
[1mindex 879a3fd..6f8930a 100644[m
[1m--- a/app/models/poll.rb[m
[1m+++ b/app/models/poll.rb[m
[36m@@ -8,4 +8,13 @@[m [mclass Poll < ApplicationRecord[m
   validates :first_option, length: { maximum: 100 }, presence: true[m
   validates :second_option, length: { maximum: 100 }, presence: true[m
 [m
[32m+[m[32m  include PgSearch::Model[m
[32m+[m[32m  pg_search_scope :search_by_category_and_question,[m
[32m+[m[32m  against: [:question, :first_option, :second_option],[m
[32m+[m[32m  associated_against: {[m
[32m+[m[32m  category: [ :title ][m
[32m+[m[32m  },[m
[32m+[m[32m  using: {[m
[32m+[m[32m    tsearch: { prefix: true }[m
[32m+[m[32m  }[m
 end[m
[1mdiff --git a/app/views/shared/_navbar.html.erb b/app/views/shared/_navbar.html.erb[m
[1mindex ecbd714..b2dfecc 100644[m
[1m--- a/app/views/shared/_navbar.html.erb[m
[1m+++ b/app/views/shared/_navbar.html.erb[m
[36m@@ -8,6 +8,15 @@[m
     <%= render "shared/sidebar" %>[m
   </div>[m
 [m
[32m+[m[32m  <%= form_with url: polls_path, method: :get, class: "d-flex" do %>[m
[32m+[m[32m    <%= text_field_tag :query,[m
[32m+[m[32m      params[:query],[m
[32m+[m[32m      class: "form-control",[m
[32m+[m[32m      placeholder: "Search by category..."[m
[32m+[m[32m    %>[m
[32m+[m[32m    <%= submit_tag "Search", class: "btn btn-primary" %>[m
[32m+[m[32m  <% end %>[m
[32m+[m
     <div class="nav-item dropdown">[m
       <%= image_tag "https://kitt.lewagon.com/placeholder/users/ssaunier", class: "avatar dropdown-toggle", id: "navbarDropdown", data: { bs_toggle: "dropdown" }, 'aria-haspopup': true, 'aria-expanded': false %>[m
       <div class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">[m
