class ProposalsController < ApplicationController
  def index
    if Vote.open?
      @proposals = Proposal.all
    else
      @proposals = Proposal.most_votes
    end
  end

  def new
    authenticate_user!
    @proposal = Proposal.new
  end

  def show
    @proposal = Proposal.find_by_id(params[:id])

    unless @proposal
      flash[:error] = "The proposal you requested id: #{params[:id]} does not exist in the system, please report the URL that led you here to staff@larubyconf.com"
      redirect_to proposals_path
    end
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

    if current_user.nil?
      flash[:error] = "You must be logged in to update a proposal."
      redirect_to proposal_path(@proposal)
    elsif @proposal.user != current_user
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

  def destroy
    @proposal = Proposal.find(params[:id])
    if current_user &&  @proposal.user == current_user
      @proposal.destroy
      flash[:success] = "You deleted your proposal."
      redirect_to proposals_path
    else
      flash[:error] = "You can not delete a proposal that is not yours."
      redirect_to proposal_path(@proposal)
    end
  end    
end
