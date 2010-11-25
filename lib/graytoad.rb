require "gelf"
require "hoptoad_notifier"

class Graytoad
  class << self
    attr_accessor :gelf_notifier

    def notify(*args)
      HoptoadNotifier.notify(*args)
      @gelf_notifier.notify(*args)
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
