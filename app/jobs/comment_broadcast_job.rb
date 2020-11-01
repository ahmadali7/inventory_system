class CommentBroadcastJob < ApplicationJob
  queue_as :default

  def perform(comment)
  	puts '-'*100
    ActionCable.server.broadcast "chat", { comment: render_message(comment) }
    puts "******"*100
		puts "in perform"
		puts "******"*100
  end
  private

  def render_message(comment)
    CommentsController.render(partial: 'comments/comment', locals: {comment: comment})
  end
end
