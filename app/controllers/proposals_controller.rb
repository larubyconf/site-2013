class ProposalsController < ApplicationController
  def index
    @proposals = Proposal.all
  end

  def new
    authenticate_user!
    @proposal = Proposal.new
  end

  def create
    @proposal = Proposal.new

    @proposal.update_attributes(params[:proposal])

    @proposal.user = current_user
    @proposal.submitted_at = Time.now

    if @proposal.save
      flash[:success]="Your proposal was successfully submitted."
      redirect_to proposals_path
    else
      flash[:error] = "We could not save your proposal."
      redirect_to new_proposal_path
    end
  end
end
