module RoomsHelper

  @@building_hash={0=>'D.H.Hill', 1=>'James.B.Hunt'}

  def get_building (building_id)
    @@building_hash[building_id]
  end

end
