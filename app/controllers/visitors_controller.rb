class VisitorsController < ApplicationController
  def index
    @combined_proposals_courses = Kaminari.paginate_array(Proposal.sort_by_votes.all + Course.sort_by_votes.all).page(params[:page]).per(10)
  end
end
