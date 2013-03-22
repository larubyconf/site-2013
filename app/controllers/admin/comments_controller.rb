class Admin::CommentsController < Admin::Controller
  respond_to :html, :xml, :json
  
  def create
    @proposal = Proposal.find(params[:proposal_id])
    @comment = Comment.build_from(@proposal, current_user, params[:comment][:body])

    if @comment.save
      respond_with @comment, :location => admin_proposal_path(@proposal)
    else

    end
  end
end
