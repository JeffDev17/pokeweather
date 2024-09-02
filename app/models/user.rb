class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Conexao UserPokemons
  has_many :user_pokemons
  has_many :pokemons, through: :user_pokemons

end
