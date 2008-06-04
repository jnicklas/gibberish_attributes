module GibberishAttributes
  
  def self.included(base)
    super
    base.extend ClassMethods
  end
  
  def get_value_for_translation(attr, lang)
    self.send("#{attr}_#{lang}")
  end
  
  def set_value_for_translation(attr, lang, value)
    self.send("#{attr}_#{lang}=", value)
  end
  
  
  module ClassMethods
    
    def translate(*attrs)
      attrs.each do |attr|
        self.class_eval <<-CLASS
          def #{attr}
            get_value_for_translation(:#{attr}, Gibberish.current_language)
          end
          
          def #{attr}=(value)
            set_value_for_translation(:#{attr}, Gibberish.current_language, value)
          end
        CLASS
      end
    end
    
  end
  
end