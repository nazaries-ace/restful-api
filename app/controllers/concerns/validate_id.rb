module ValidateId extend ActiveSupport::Concern

    included do
    end

    def validate_id(table,id)
        table.where(id: id).exists?(conditions = :none)
    end
end