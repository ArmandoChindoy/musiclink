module Core::RoleModule::Relations
    extend ActiveSupport::Concern
        included do
            has_and_belongs_to_many :users
        end
end