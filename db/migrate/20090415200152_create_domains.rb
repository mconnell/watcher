class CreateDomains < ActiveRecord::Migration
  def self.up
    create_table :domains do |t|
      t.string :name
      t.boolean :registered
      t.boolean :suspended
      t.string :status
      t.datetime :whois_created_at
      t.datetime :whois_expires_at
      t.datetime :whois_changed_at

      t.timestamps
    end
  end

  def self.down
    drop_table :domains
  end
end
