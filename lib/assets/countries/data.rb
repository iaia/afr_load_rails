module ISO3166 
  class Data
    private
    class << self
      def datafile_path(file_array)
        if file_array[1] == "ja.json"
          File.join([File.dirname(__FILE__), "cache"] + file_array)
        else
          File.join(@@cache_dir + file_array)
        end
      end
    end
  end

  class Country
    def translated_names
      data["translations"].values.flatten
    end
  end
end
