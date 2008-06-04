module GibberishAttributes
  
  def self.included(base)
    super
    base.extend ClassMethods
  end
  
  def get_value_for_translation(attr)
    self.send("#{attr}_#{Gibberish.current_language}")
  end
  
  def set_value_for_translation(attr, value)
    self.send("#{attr}_#{Gibberish.current_language}=", value)
  end
  
  
  module ClassMethods
    
    def translate(*attrs)
      attrs.each do |attr|
        self.class_eval <<-CLASS
          def #{attr}
            get_value_for_translation(:#{attr})
          end
          
          def #{attr}=(value)
            set_value_for_translation(:#{attr}, value)
          end
        CLASS
      end
    end
    
  end
  
end