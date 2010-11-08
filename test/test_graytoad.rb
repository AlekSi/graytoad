require 'helper'
require 'socket'

HOST = Socket.gethostname

class TestGraytoad < Test::Unit::TestCase
  should "notify with standard excpetion" do
    e = RuntimeError.new("Short message")

    Gelf.any_instance.expects(:short_message=).with(e.message)
    Gelf.any_instance.expects(:full_message=).with(e.backtrace)
    Gelf.any_instance.expects(:host=).with(HOST)
    Gelf.any_instance.expects(:send)

    HoptoadNotifier.expects(:notify).with(e)

    Graytoad.notify(e)
  end
end
