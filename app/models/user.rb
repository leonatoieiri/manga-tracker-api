class User < ApplicationRecord
    enum :role, [:reader, :admin]
end
