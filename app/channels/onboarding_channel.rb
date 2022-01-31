class OnboardingChannel < ApplicationCable::Channel
  def subscribed
    coloc = Coloc.find(params[:coloc])
    stream_for coloc
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
