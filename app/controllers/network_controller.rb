class NetworkController < ApplicationController
  def test
    system("/Users/eastagile/code/network_test/script/clear_cache")
    previous = params[:gateway_id]
    if previous
      current = previous.to_f + 1
      @gateway = Gateway.find_by_id(current)
    else
      @gateway = Gateway.find_by_id(1)
    end

    if @gateway
      system("/Users/eastagile/code/network_test/script/get_gateway #{@gateway.name}")
      sleep(4)
    else
      Gateway.all.each do |gate|
        if gate.download != "Very slow speed or connection failed"
          system("/Users/eastagile/code/network_test/script/get_gateway #{gate.name}")
          break
        end
      end
      if Gateway.where(:download => "Very slow speed or connection failed").count > 0
        sleep(4)
        AutoMail.sendResult.deliver
        sleep(4)
      end
      system("/Users/eastagile/code/network_test/script/clear_cache")
      system("/Users/eastagile/code/network_test/script/close_chrome")
    end

  end

  def send_result
    gateway = params[:gate_way]
    result = params[:result_network]
    @current_gate_way = Gateway.find(gateway)
    if @current_gate_way
      @current_gate_way.download = result
      @current_gate_way.save
    end
    system("/Users/eastagile/code/network_test/script/clear_cache")
    system("/Users/eastagile/code/network_test/script/close_chrome")
    system("/Users/eastagile/code/network_test/script/clear_cache")
    sleep(6)
    system("/Users/eastagile/code/network_test/script/open_chrome #{gateway}")
  end
end
