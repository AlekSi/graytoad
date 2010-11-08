require "gelf"
require "hoptoad_notifier"

class Graytoad
  class << self
    attr_accessor :gelf_host, :gelf_port, :this_host

    def notify(e, opts={})
      detect_this_host if this_host.nil?

      if e.is_a?(Hash)
        opts, e = e, nil
      end

      g = Gelf.new(gelf_host, gelf_port)
      g.host = this_host

      if e.nil?
        g.short_message, g.full_message = "#{opts[:error_class]}: #{opts[:error_message]}", caller
        opts.each_pair { |key, value| g.add_additional(key.to_s, value) }
        HoptoadNotifier.notify(opts)
      else
        g.short_message, g.full_message = e.message, e.backtrace
        HoptoadNotifier.notify(e, opts)
      end

      g.send
    end

  private
    def detect_this_host
      require 'socket'
      self.this_host = Socket.gethostname
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
