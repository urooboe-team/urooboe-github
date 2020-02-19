class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :last_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/}

  validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/}

  validates :kana_last_name, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }

  validates :kana_first_name, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }

  validates :postcode, presence: true, format: { with: /\A\d{7}\z/ }

  validates :address, presence: true

  validates :telephone, format: { with: /\A\d{10,11}\z/ }

  has_many :produsts,  through: :cart_items
  has_many :cart_items, dependent: :destroy

  has_many :addresses,  dependent: :destroy
  has_many :orders, dependent: :destroy

  # 物理削除の代わりにユーザーの`deleted_at`をタイムスタンプで更新
  def soft_delete
    update_attribute(:member_status, false)
  end

  # ユーザーのアカウントが有効であることを確認
  def active_for_authentication?
    super && member_status
  end

  # 削除したユーザーにカスタムメッセージを追加します
  # def inactive_message
  #   !member_status ? super : :deleted_account
  # end

  # enum member_status: { 有効: true, 退会: false }

end
