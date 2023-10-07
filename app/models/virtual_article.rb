# frozen_string_literal: true

class VirtualArticle
  include ActiveModel::Model

  attr_accessor :id, :body, :end_time, :people, :user_id, :created_at, :updated_at
  attr_writer :start_time # 書き込み専用のメソッドを定義

  def start_time
    # @start_timeが文字列の場合はTimeオブジェクトに変換
    @start_time.is_a?(String) ? Time.parse(@start_time) : @start_time
  end

  def persisted?
    true
  end
end
