require "gelf"
require "hoptoad_notifier"

class Graytoad
  class << self
    attr_accessor :gelf_host, :gelf_port

    def notify(*args)
      HoptoadNotifier.notify(args)

      @notifier ||= GELF::Notifier.new(@gelf_host, @gelf_port)
      @notifier.notify(args)
    end
  end
end

if defined?(ActionController::Base)
  class ActionController::Base
    def notify_graytoad(hash_or_exception)
      unless hoptoad_local_request?
        Graytoad.notify(hash_or_exception, hoptoad_request_data)
      end
    end
  end
end
