class AddColumnToDirector < ActiveRecord::Migration
    def change
        add_column :directors, :name_ja, :string, :after => :name
    end
end
