class ProposalsController < ApplicationController
  def index
    @proposals = Proposal.all
  end

  def new
    authenticate_user!
    @proposal = Proposal.new
  end

  def show
    @proposal = Proposal.find(params[:id])
  end

  def edit
    @proposal = Proposal.find(params[:id])
    unless @proposal.user == current_user
      flash[:error] = "You can not edit a proposal that is not yours."
      redirect_to proposal_path(@proposal)
    end
  end

  def update
    @proposal = Proposal.find(params[:id])

    unless @proposal.user == current_user
      flash[:error] = "You can not edit a proposal that is not yours."
      redirect_to proposal_path(@proposal)
    end

    @proposal.update_attributes(params[:proposal])

    if @proposal.save
      flash[:success] = "Your changes to your proposal have been saved."
      redirect_to proposal_path(@proposal)
    else
      flash[:error] = "We could not save your changes."
      redirect_to edit_proposal_path(@proposal)
    end
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
