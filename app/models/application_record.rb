class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  def generate_uuid                                                                                                                                       
    SecureRandom.uuid                                                                                                                                     
  end                                                                                                                                                     
                                                                                                                                                          
  def generate_uuid_baseontime                                                                                                                            
    (Time.now.to_f * 1000000).to_i                                                                                                                        
  end                                                                                                                                                     

  private                                                                                                                                                 

  def slug_candidates                                                                                                                                     
    [                                                                                                                                                     
        [:generate_uuid_baseontime, :generate_uuid]                                                                                                       
    ]                                                                                                                                                     
  end
end
