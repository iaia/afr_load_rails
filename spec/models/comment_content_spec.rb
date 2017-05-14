require 'rails_helper'

RSpec.describe CommentContent, type: :model do
  describe "comment_contents" do
    it "returns " do
      contents_data = [
        {uri: "uri1", expanded_url: "expanded_url1"},
        {uri: "uri2", expanded_url: "expanded_url2"}
      ]
      comment = Comment.create(comment_id_on_provider: 10)
      contents_data.each do |content|
        comment.contents << CommentContent.find_or_create_by(
          url: content[:uri],
          expanded_url: content[:expanded_url]
        )
      end

      expect(comment.contents.count).to eq 2
      comment.contents.each do |content|
        expect(content.comment_id).to eq comment.id
      end
      
    end
  end
end
