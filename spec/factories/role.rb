############################################
# EMPTY role
#############################################
FactoryGirl.define do
  factory :role_without_rules, class: Role do
    name        'user'
    title       'User role'
    description 'Default Role for users'
  end
end

#############################################
# USER role
#############################################
role_user = {
  stocks: {
  index:   true,
  show:    true,
  new:     false,
  create:  false,
  edit:    false,
  update:  false,
  destroy: false,
}
}

FactoryGirl.define do
  factory :role_user, class: Role do
    name        'user'
    title       'User role'
    description 'Default Role for users'
    the_role     role_user
  end
end

#############################################
# SELLER role
#############################################
role_seller = {
  stocks: {
  index:   true,
  show:    true,
  new:     true,
  create:  true,
  edit:    true,
  update:  true,
  destroy: true,
}
}

FactoryGirl.define do
  factory :role_seller, class: Role do
    name        'stocks_seller'
    title       'Seller of Stocks'
    description 'Can do anything with stocks'
    the_role     role_seller
  end
end

#############################################
# ADMIN role
#############################################
role_admin = {
  :system => {
    :administrator => true
  }
}

FactoryGirl.define do
  factory :role_admin class: Role do
    name        'admin'
    title       'Admin of the system'
    description 'Can do anything'
    the_role     role_admin
  end
end
