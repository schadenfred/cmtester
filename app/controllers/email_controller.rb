class EmailController < ApplicationController
  skip_before_filter :verify_authenticity_token
  require 'mail'

  def input
    msg = Mail.new params[:message]

    from = msg.from[0]
    from_user = User.find_or_create_by_email(from) # TODO: grab name from email

    toandcc = msg.to + msg.cc # - ['ce1c14b80ca625c3078c@cloudmailin.net']
    toandcc_users = toandcc.map{|address|
      User.find_or_create_by_email(address) # TODO: grab name
    }
    content = Content.create(:by_user => from_user, :about_users => toandcc_users, :subject => msg.subject, :body => msg.body)
    
 #     msg.attachments.each {|att|
 #       content.attachments << Attachment.new(:filename => att.original_filename, :bits => att.body, :content_type => att.content_type)
 #     }
    }
  end
end
