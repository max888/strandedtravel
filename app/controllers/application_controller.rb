class ApplicationController < ActionController::Base
  protect_from_forgery
  
  rescue_from CanCan::AccessDenied do |exception|
      # if authorize! :create, Destination, :alert => "Sorry you need to login to create destination." 
      exception_actions = { 
        index: 'view',
        new: 'create a',
        create: 'create a',
        show: 'view that',
        edit: 'edit that',
        update: 'edit that',
        destroy: 'delete that'
       }

      action_message = exception_actions.fetch(exception.action, 'access')
      subject = exception.subject.class.to_s.downcase
      subject = subject.pluralize if :index == exception.action

      redirect_to main_app.root_url, :alert => "Sorry you need to sign in to #{action_message} #{subject}."
  end
  
end


  # authorize! :create, Destination, :message => "Sorry you need to login or create account first."
