class Domain < ActiveRecord::Base

  validates_format_of :name, :with => /^([a-z0-9]([-a-z0-9]*[a-z0-9])?\.)+(co\.uk|org\.uk|me\.uk|ltd\.uk)$/i
  validates_uniqueness_of :name

  after_create :update_from_whois

  default_scope :order => "whois_expires_at"

  def update_from_whois
    begin
      stream = TCPSocket.open("whois.nic.uk", 43)
      stream.write("#{name}\r\n")
      response = []
      while stream.gets do
        response << $_
      end
      stream.close

      hash = {}

      response.each do |line|
        if line.match(/Last Updated:/i)
          hash['whois_changed_at'] = line.gsub(/Last Updated:/i, "").strip()
        end
        if line.match(/Registered On:/i)
          hash['whois_created_at'] = line.gsub(/Registered On:/i, "").strip()
        end
        if line.match(/Renewal Date:/i)
          hash['whois_expires_at'] = line.gsub(/Renewal Date:/i, "").strip()
        end
      end

      response = response.join("\n")

      # registered?
      hash['registered'] = (response.include?("No match for") ? false : true)

      # suspended?
      hash['suspended'] = (response.include?("This registration has been SUSPENDED") ? true : false)

      self.update_attributes!(hash)
    rescue
    end
  end

end
