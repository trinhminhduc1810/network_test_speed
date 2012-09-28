module ConvertSpeed
  def to_mbps(filesize,period)
    result = filesize/period/1000000
    format("%.2f mbps",result)
  end
end