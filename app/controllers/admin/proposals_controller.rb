class Admin::ProposalsController < ApplicationController
  def index
    case params[:filter]
    when "confirmed"
      @proposals = Proposal.confirmed
    when "rejected"
      @proposals = Proposal.rejected
    when "accepted"
      @proposals = Proposal.accepted
    when "considered"
      @proposals = Proposal.considered
    when "review"
      @proposals = Proposal.to_review
    when "denied"
      @proposals = Proposal.denied
    else
      @proposals = Proposal.all
    end
  end

  def show
    @proposal = Proposal.find(params[:id])
    @comment = Comment.new
  end

  def edit
    @proposal = Proposal.find(params[:id])
  end

  def update
    @proposal = Proposal.find(params[:id])

    @proposal.update_attributes(params[:proposal])

    if @proposal.save
      redirect_to proposal_path(@proposal)
    end
  end
  
  def accept
    change_status params[:id], 'accepted'
  end

  def clear
    change_status params[:id], 'cleared'
  end

  def reject
    change_status params[:id], 'rejected'
  end

  def consider
    change_status params[:id], 'considered'
  end

  def confirm
    change_status params[:id], 'confirmed'
  end

  def denied
    change_status params[:id], 'denied'
  end
  
  def change_status id, status
    @proposal = Proposal.find(params[:id])

    if @proposal.status == status || (@proposal.status.blank? && status == 'cleared')
      flash[:error] = "That proposal was already #{status}."
    else
      @proposal.status = (status == "cleared" ? '' : status)

      if @proposal.save
        flash[:success] = "'#{@proposal.title}' has now been flagged as #{status}."
      else
        flash[:error] = "Unable to change the status on '#{@proposal.title}'"
      end
    end
    if params[:from] == 'show'
      redirect_to admin_proposal_path(@proposal)
    else        
      redirect_to admin_proposals_path
    end
  end
end
