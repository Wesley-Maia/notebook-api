class Contact < ApplicationRecord
  def author
    "Wesley Maia"
  end
  
  def as_json(options={})
	  super(methods: :author, root: true)
  end
end
