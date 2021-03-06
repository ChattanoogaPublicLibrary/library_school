class ProposalsController < ApplicationController
  load_and_authorize_resource :except => :vote
  before_action :set_proposal, only: [:show, :edit, :update, :destroy]

  # GET /proposals
  # GET /proposals.json
  def index
    @proposals = Proposal.sort_by_votes.page(params[:page]).per(5)
  end

  # GET /proposals/1
  # GET /proposals/1.json
  def show
  end

  # GET /proposals/new
  def new
    @proposal = Proposal.new
  end

  # GET /proposals/1/edit
  def edit
  end

  # GET /proposals/:id/vote
  def vote
    authorize! :vote, Proposal
    @proposal = Proposal.find(params[:id])
    @vote = Vote.new(:proposal => @proposal, :user => current_user)

    respond_to do |format|
      if !@proposal.user_has_voted?(current_user)
        if @vote.save
          format.html { redirect_to @proposal, notice: 'Your vote was successful. Thank you!' }
        else
          format.html { redirect_to @proposal, notice: 'Your vote was unsuccessful. Try again.' }
        end
      else
        format.html { redirect_to @proposal, notice: 'You are not allowed to vote for a proposal more than once.' }
      end
    end
  end

  # POST /proposals
  # POST /proposals.json
  def create
    @proposal = Proposal.new(proposal_params)
    @proposal.user = current_user

    respond_to do |format|
      if @proposal.save
        format.html { redirect_to @proposal, notice: 'Proposal was successfully created.' }
        format.json { render :show, status: :created, location: @proposal }
      else
        format.html { render :new }
        format.json { render json: @proposal.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /proposals/1
  # PATCH/PUT /proposals/1.json
  def update
    respond_to do |format|
      if @proposal.update(proposal_params)
        format.html { redirect_to @proposal, notice: 'Proposal was successfully updated.' }
        format.json { render :show, status: :ok, location: @proposal }
      else
        format.html { render :edit }
        format.json { render json: @proposal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /proposals/1
  # DELETE /proposals/1.json
  def destroy
    @proposal.destroy
    respond_to do |format|
      format.html { redirect_to user_path(current_user), notice: 'Proposal was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_proposal
      @proposal = Proposal.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def proposal_params
      params.require(:proposal).permit(:name, :description)
    end
end
