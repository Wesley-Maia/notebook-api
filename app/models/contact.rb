class Contact < ApplicationRecord
  belongs_to :kind
  
  def author
    "Wesley Maia"
  end

  def kind_description
    self.kind.description
  end

  def as_json(options={})
    super(
      root: true,
      methods: [:kind_description, :author],
      include: { kind: { only: :description }}
    )
  end
end
