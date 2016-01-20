module SpreeGatewayCheckoutV2
  class Engine < Rails::Engine
    engine_name 'solidus_gateway_checkout_v2'

    config.autoload_paths += %W(#{config.root}/lib)

    initializer "spree.gateway.payment_methods", :after => "spree.register.payment_methods" do |app|
      app.config.spree.payment_methods << Spree::Gateway::CheckoutV2Gateway
    end

    def self.activate
      if SpreeGatewayCheckoutV2::Engine.frontend_available?
        Dir.glob(File.join(File.dirname(__FILE__), "../../controllers/frontend/*/*_decorator*.rb")) do |c|
          Rails.configuration.cache_classes ? require(c) : load(c)
        end
      end
    end


    def self.frontend_available?
      @@frontend_available ||= ::Rails::Engine.subclasses.map(&:instance).map{ |e| e.class.to_s }.include?('Spree::Frontend::Engine')
    end

    if self.frontend_available?
      paths["app/views"] << "lib/views/frontend"
    end

    config.to_prepare &method(:activate).to_proc
  end
end
