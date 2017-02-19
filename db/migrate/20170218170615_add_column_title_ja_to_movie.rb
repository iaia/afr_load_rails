class AddColumnTitleJaToMovie < ActiveRecord::Migration
    def change
        add_column :movies, :title_ja, :string, :after => :title
    end
end
