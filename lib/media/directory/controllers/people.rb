require_relative "base"

module Media
  module Directory
    module Controllers
      class People < Base

        set(:model)   { Models::Person }
        set(:pattern) { /[a-z]{3}[1-9]{3}/ }
        set(:policy)  { Policies::Base }

        index
        show

        post "/authenticate" do
          @item = self.class.model.authenticate(parameters.id, parameters.password)

          return 403 unless @item && authorize.show?

          respond_with :show, locals: { item: present(item) }
        end
      end
    end
  end
end
