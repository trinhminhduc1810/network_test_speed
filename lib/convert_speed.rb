module ConvertSpeed
  def to_mbps(filesize,period)
    (filesize/period)/1000000
  end
end