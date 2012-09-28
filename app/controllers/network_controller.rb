class NetworkController < ApplicationController
  include ConvertSpeed
  def download_result
    period = Float(params[:period])
    id = params[:id]
    filesize = Float(ConstantVariables::FILESIZE)
    result = to_mbps(filesize,period)
    gate_way = Gateway.find_by_id(id)
    if gate_way
      gate_way.download = result
      gate_way.save
    end
    render :nothing => true
  end

  def upload_result
    period = Float(params[:period])
    id = params[:id]
    filesize = Float(ConstantVariables::FILESIZE)
    result = to_mbps(filesize,period)
    gate_way = Gateway.find_by_id(id)
    if gate_way
      gate_way.upload = result
      gate_way.save
    end
    render :nothing => true
  end
end
