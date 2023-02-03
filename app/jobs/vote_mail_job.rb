class VoteMailJob < ApplicationJob
  queue_as :default

  def perform(*args)
    VoteMailer.vote_notify('eric00471@gmail.com').deliver
  end
end
