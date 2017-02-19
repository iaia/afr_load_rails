class AddColumnToActor < ActiveRecord::Migration
    def change
        add_column :actors, :name_ja, :string, :after => :name
    end
end
