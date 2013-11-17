require_relative "base"

module Media
  module Directory
    module Controllers
      class People < Base

        set(:model)  { Models::Person }
        set(:policy) { Policies::Base }

        get "/authenticate" do
          @item = self.class.model.authenticate(parameters.id, parameters.password)

          return 403 unless authorize.show?

          respond_with :show, locals: { item: present(id) }
        end

        index
        show

        def parameters
          self.class.parameters.new(params, pattern: /[a-z]{3}[1-9]{3}/)
        end
      end
    end
  end
end
