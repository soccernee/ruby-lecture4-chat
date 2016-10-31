class MessagesController < ApplicationController
  def create
    @message = Message.new message_params
    if @message.save
      flash[:success] = "Saved."
      redirect_to root_path # redirect to chat room
    else
      flash[:error] = "Error: #{@message.errors.full_messages.to_sentence}"
      redirect_to root_path
    end
  end

  private

  def message_params
    params.require(:message).permit(:username, :content)
  end
end
