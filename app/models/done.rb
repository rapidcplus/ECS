class Done < ApplicationRecord
  belongs_to :item
  # sent_atとsender_nameは特にモデルでの設定は不要、保存時に適切な値を設定するだけ
end


