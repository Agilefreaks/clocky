# frozen_string_literal: true
# Build your seed data here

require_relative '../system/boot'

def container
  Clocky::Container
end

def user_repo
  container['repositories.user_repo']
end

def create_user(attrs)
  user_repo.create(attrs) unless user_repo.by_email(attrs[:email])
end

create_user({ email: 'calinoiu.alexandru@agilefreaks.com' })
create_user({ email: 'george.bucluc@agilefreaks.com' })
create_user({ email: 'costel@agilefreaks.com' })
create_user({ email: 'nistor.adrian@agilefreaks.com' })
