class VotesController < ApplicationController
  def up
    if Vote.open?
      p = Proposal.find(params[:proposal_id])
      success, message = current_user.cast_vote(p)

      if success
        flash[:success] = message
      else
        flash[:error] = message
      end
    else
      vote_error_message
    end

    redirect_to proposals_path
  end

  def down
    if Vote.open?
      p = Proposal.find(params[:proposal_id])

      success, message = current_user.remove_vote(p)

      if success
        flash[:success] = message
      else
        flash[:error] = message
      end
    else
      vote_error_message
    end
    redirect_to proposals_path
  end

  def vote_error_message
    if Vote.status == "PRE"
      flash[:error] = "Voting is not yet opened, you must wait until #{Vote.start_date}"
    elsif Vote.status == "POST"
      flash[:error] ="Voting is closed as of #{Vote.end_date}"
    end
  end
end
