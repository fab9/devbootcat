FactoryGirl.define do
  factory :user do |f|
    f.email "g@gmail.com"
    # f.password "password"
  end

  factory :invalid_user_email, parent: :user do |f|
    f.email nil
  end

  factory :invalid_user_password, parent: :user do |f|
    f.password = nil
  end
end