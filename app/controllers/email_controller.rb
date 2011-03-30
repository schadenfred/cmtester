class EmailController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def input
    msg = TMail::Mail.parse params[:message]

    from = msg.from[0]
    from_user = User.create_or_find_by_email(from.email) # TODO: grab name from email


    abouts = msg.to + msg.cc - ['ce1c14b80ca625c3078c@cloudmailin.net']
    abouts.each {|user|
      about_user = User.create_or_find_by_email(user.email) # TODO: grab name from email
      content = Content.create(:from => from_user, :about => about_user, :subject => msg.subject, :body => msg.body)
    
      msg.attachments.each {|att|
        content.attachments << Attachment.new(:filename => att.original_filename, :bits => att.body, :content_type => att.content_type)
      }
    }
  end
end