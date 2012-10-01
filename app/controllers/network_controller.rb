class NetworkController < ApplicationController
  include ConvertSpeed
  def download_result
    begin
      period = Float(params[:period])
      filesize = Float(ConstantVariables::FILESIZE)
      result = to_mbps(filesize,period)
    rescue ArgumentError
      result = 0
    end
    id = params[:id]
    gate_way = Gateway.find_by_id(id)
    if gate_way
      gate_way.download = result
      gate_way.save
    end
    render :nothing => true
  end

  def upload_result
    begin
      period = Float(params[:period])
      filesize = Float(ConstantVariables::FILESIZE)
      result = to_mbps(filesize,period)
    rescue ArgumentError
      result = 0
    end
    id = params[:id]
    gate_way = Gateway.find_by_id(id)
    if gate_way
      if gate_way.download.zero?
        result = 0
      end
      gate_way.upload = result
      gate_way.save
    end
    render :nothing => true
  end

  def send_alert
    send = false
    Gateway.all.each do |gate|
      if gate.download.zero? || gate.upload.zero?
        send = true
      else
        system("/Users/eastagile/code/network_test/script/change_gate #{gate.name}")
        sleep(2)
      end
    end
    if send
      AutoMail.sendResult.deliver
    end
    render :nothing => true
  end

  def show_chart
     @gateways = Gateway.all
  end
end
