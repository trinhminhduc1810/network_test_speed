class AutoMail < ActionMailer::Base
  default from: "from@example.com"

  def sendResult
    email = "ty_edge_540t@yahoo.com"
    @gateways = Gateway.all
    mail(:to => email, :subject => "network test speed")
  end
end
