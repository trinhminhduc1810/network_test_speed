class AutoMail < ActionMailer::Base
   default from: "networking information"
  def sendResult
    email = ["ty_edge_540t@yahoo.com"]
    @gateways = Gateway.all
    mail(:to => email, :subject => "Network Status Alert !")
  end
end
