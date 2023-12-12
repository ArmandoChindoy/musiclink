module Core::RoleModule::Core
    extend ActiveSupport::Concern
        include Mongoid::Document
        include Mongoid::Timestamps
    end
end