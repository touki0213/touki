class User < ApplicationRecord

    validates :name,presence:true,length:{maximum:50}
    validates :emall,presence:true,length:{maximum:255}

end
