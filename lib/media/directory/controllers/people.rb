require_relative "base"

module Media
  module Directory
    module Controllers
      class People < Base

        set(:model)  { Models::People }
        set(:policy) { Policies::Base }

        get "/authenticate" do
          @item = self.class.model.authenticate(parameters.id, parameters.password)

          return 403 unless authorize.show?

          respond_with :show, locals: { item: present(id) }
        end

        index
        show
      end
    end
  end
end
