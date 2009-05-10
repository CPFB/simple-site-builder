class CreateVersionedTableForFaqs < ActiveRecord::Migration
  def self.up
		Faq.create_versioned_table
  end

  def self.down
		Faq.drop_versioned_table
  end
end
