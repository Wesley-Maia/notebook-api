class ContactSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :birthdate

  belongs_to :kind do
    link(:related) { contact_kind_url(object.id) }
  end

  has_many :phones do
    link(:related) { contact_phones_url(object.id) }
  end

  has_one :address do
    link(:related) { contact_address_url(object.id) }
  end

  # link(:self) { contact_path(object.id) }
  # link(:kind) { kind_path(object.kind.id) }
  # link(:self) { contact_url(object.id) }
  # link(:kind) { kind_url(object.kind.id) }

  meta do
    { author: "Jackson Pires" }
  end

  def attributes(*args)
    h = super(*args)
    # pt-BR --->
    # h[:birthdate] = (I18n.l(object.birthdate) unless object.birthdate.blank?)
    h[:birthdate] = object.birthdate.to_time.iso8601 unless object.birthdate.blank?
    h
  end
end
