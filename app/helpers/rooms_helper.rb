module RoomsHelper

  BUILDING_HASH={0=>'D.H.Hill', 1=>'James.B.Hunt'}

  def get_building (building_id)
    BUILDING_HASH[building_id]
  end

end
