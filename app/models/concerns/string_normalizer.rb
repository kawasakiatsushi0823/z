module StringNormalizer
require 'nkf'
  extend ActiveSupport::Concern

  def normalize_as_email(text)
    NKF.nkf('-w -Z1', text).strip if text
  end

  def normalize_as_name(text)
    NKF.nkf('-w -Z1', text).strip if text
  end

  def normalize_as_furigana(text)
    NKF.nkf('-w -Z1 --katakana', text).strip if text
  end

  def normalize_as_postal_code(text)
    NKF.nkf('-w Z1', text).strip.gsub(/-/, '') if text
  end
end
