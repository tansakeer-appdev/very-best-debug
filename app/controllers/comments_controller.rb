class CommentsController < ApplicationController

  def create

    auth_id = params.fetch("query_author_id")
   if (User.where({ :id => auth_id }).at(0) != nil)
    comm = Comment.new
    comm.author_id = auth_id
    comm.venue_id = params.fetch("query_venue_id")
    comm.body = params.fetch("query_body")
    comm.save
      redirect_to("/venues/#{comm.venue_id}")
    else
      render plain:"check ya user/author id bruh"
    end
    
  end
end
