module NetworkHelper
  def upload_start
    system("/Users/eastagile/code/network_test/script/upload_file #{@gateway.id}")
  end
end
