class User < ApplicationRecord
    enum :role, [:reader, :publisher, :admin]
end
