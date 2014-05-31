class VisitorsController < ApplicationController
  def index
    @combined_proposals_courses = Kaminari.paginate_array(Proposal.all + Course.all).page(params[:page]).per(10)
  end
end
