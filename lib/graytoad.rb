require "gelf"
require "hoptoad_notifier"

class Graytoad
  class << self
    attr_accessor :gelf_host, :gelf_port, :this_host

    def notify(e)
      detect_this_host if this_host.nil?

      HoptoadNotifier.notify(e)

      g = Gelf.new(gelf_host, gelf_port)
      g.short_message, g.full_message, g.host = e.message, e.backtrace, this_host
      g.send
    end

  private
    def detect_this_host
      require 'socket'
      self.this_host = Socket.gethostname
    end
  end
end
