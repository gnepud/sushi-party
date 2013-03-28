# encoding: utf-8

##
# Mailer methods can be defined using the simple format:
#
# email :registration_email do |name, user|
#   from 'admin@site.com'
#   to   user.email
#   subject 'Welcome to the site!'
#   locals  :name => name
#   content_type 'text/html'       # optional, defaults to plain/text
#   via     :sendmail              # optional, to smtp if defined, otherwise sendmail
#   render  'registration_email'
# end
#
# You can set the default delivery settings from your app through:
#
#   set :delivery_method, :smtp => {
#     :address         => 'smtp.yourserver.com',
#     :port            => '25',
#     :user_name       => 'user',
#     :password        => 'pass',
#     :authentication  => :plain, # :plain, :login, :cram_md5, no auth by default
#     :domain          => "localhost.localdomain" # the HELO domain provided by the client to the server
#   }
#
# or sendmail (default):
#
#   set :delivery_method, :sendmail
#
# or for tests:
#
#   set :delivery_method, :test
#
# and then all delivered mail will use these settings unless otherwise specified.
#

SushiParty.mailer :contact_form do

  email :contact_email do |name, email, tel, message|
    from 'sushiparty2011@gmail.com'
    to SushiParty.email_to
    subject 'padrino-boilerplate-sleede.fr [Prise de contact]'
    locals :name => name, :email => email, :tel => tel, :message => message
    render 'contact_form/contact_email'
    content_type :html       # optional, defaults to :plain
    via :sendmail            # optional, to smtp if defined otherwise sendmail
  end
end
