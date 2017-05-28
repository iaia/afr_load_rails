FactoryGirl.define do
  factory :movie do
    title         "Back to the Future"
    title_ja      "バック・トゥ・ザ・フューチャー"
    released_year 1985
    story         "1985年のカリフォルニア州ヒルバレーに住むロックとペプシコーラが大好きな高校生マーティ・マクフライは、科学者である親友のエメット・ブラウン博士（通称ドク）を手伝って、深夜のショッピングモール「ツインパインズ・モール」の駐車場にて、スポーツタイプの乗用車デロリアンDMC-12を改造してドクが開発したタイムマシンの実験をする。"
    director
    after(:create) do |movie|
      movie.countries << build(:country, country_code: "840")
      movie.save!
    end
  end

  factory :director, class: Director do
    name          "Rovert Zemeckis"
    name_ja       "ロバート・ゼメキス"
  end

  factory :country, class: MovieCountry do
    country_code "000"
  end
end
