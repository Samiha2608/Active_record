class LegacyRecord < ApplicationRecord
  self.table_name = "legacy_data"
  self.primary_key = "legacy_id"

  # 🔒 Validations
  validates :name, presence: true, uniqueness: true, length: { minimum: 3 }
  validates :info, presence: true, length: { maximum: 500 }

  # 🔁 Callbacks
  before_validation :strip_whitespace
  before_save :capitalize_name
  after_create :log_creation
  before_destroy :log_deletion_attempt

  private

  def strip_whitespace
    self.name = name.strip unless name.nil?
    self.info = info.strip unless info.nil?
  end

  def capitalize_name
    self.name = name.capitalize unless name.blank?
  end

  def log_creation
    Rails.logger.info "✅ A new LegacyRecord was created with ID #{self.legacy_id}"
  end

  def log_deletion_attempt
    Rails.logger.warn "⚠️ About to delete LegacyRecord with ID #{self.legacy_id}"
  end
end
