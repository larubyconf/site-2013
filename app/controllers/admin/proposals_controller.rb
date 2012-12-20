class Admin::ProposalsController < ApplicationController
  def index
    @proposals = Proposal.all
  end

  def show
    @proposal = Proposal.find(params[:id])
    @comment = Comment.new
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

    redirect_to admin_proposals_path
  end
end
