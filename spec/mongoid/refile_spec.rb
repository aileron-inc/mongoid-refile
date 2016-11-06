require 'spec_helper'

class User
  include Mongoid::Document
  include Mongoid::Refile
  attachment :avatar, extension: %w(gemspec rb)
end

RSpec.describe Mongoid::Refile do
  it 'caches attachments on assignment' do
    user = User.new(avatar: File.open('mongoid-refile.gemspec'))

    expect(user.avatar).not_to eq nil
  end

  it 'stores attachments on saving' do
    user = User.new(avatar: File.open('mongoid-refile.gemspec'))
    user.save

    expect(User.find(user.id).avatar_id).not_to be_empty
    expect(User.find(user.id).avatar).not_to eq nil
  end

  it 'replaces attachments on saving' do
    user = User.new(avatar: File.open('mongoid-refile.gemspec'))
    user.save
    old_avatar = user.avatar

    user.update(avatar: File.open('spec/spec_helper.rb'))

    expect(User.find(user.id).avatar_id).not_to eq old_avatar.id
    expect(User.find(user.id).avatar).not_to eq nil
    expect(old_avatar).not_to exist
  end

  it 'deletes attachments on saving' do
    user = User.new(avatar: File.open('mongoid-refile.gemspec'))
    user.save

    user.update(remove_avatar: true)

    expect(user.avatar_id).to eq nil
    expect(user.avatar).to eq nil
  end

  it 'deletes attachments on destroying' do
    user = User.new(avatar: File.open('mongoid-refile.gemspec'))
    user.save

    user.destroy

    expect(user.avatar).not_to exist
  end

  it 'adds validation errors' do
    user = User.new(avatar: File.open('Rakefile'))

    expect(user.valid?).to eq false
    expect(user.errors[:avatar]).not_to be_empty
  end
end
