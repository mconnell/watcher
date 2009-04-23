class ZoneFile
  def import_zone_file
    transaction do
      f = File.open("hobbylistMASTER.txt","r") do |file|
        while line = file.gets
          Domain.create(:name => line.scan(/\w+\.?/))
        end
      end
    end
  end
end