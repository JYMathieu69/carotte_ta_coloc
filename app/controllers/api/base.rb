module API
    class Base < Grape::API
        mount API::V1::Base #mount tells our Rails App that another application (API) is mounted
    end
end