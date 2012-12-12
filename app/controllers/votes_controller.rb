class VotesController < ApplicationController
  def up
    p = Proposal.find(params[:proposal_id])
    success, message = current_user.cast_vote(p)
    
    if success
      flash[:success] = message
    else
      flash[:error] = message
    end

    redirect_to proposals_path
  end
  
  def down
    p = Proposal.find(params[:proposal_id])

    success, message = current_user.remove_vote(p)
    
    if success
      flash[:success] = message
    else
      flash[:error] = message
    end
    redirect_to proposals_path
  end
end
