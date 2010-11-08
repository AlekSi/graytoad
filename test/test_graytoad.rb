require 'helper'
require 'socket'

HOST = Socket.gethostname

class TestGraytoad < Test::Unit::TestCase
  context "with exception" do
    setup do
      @e = RuntimeError.new("Short message")
      Gelf.any_instance.expects(:short_message=)
      Gelf.any_instance.expects(:full_message=)
      Gelf.any_instance.expects(:host=).with(HOST)
    end

    should "notify with exception" do
      Gelf.any_instance.expects(:send)

      HoptoadNotifier.expects(:notify).with(@e, {})

      Graytoad.notify(@e)
    end

    should "notify with exception and params" do
      Gelf.any_instance.expects(:send)

      HoptoadNotifier.expects(:notify).with(@e, :user => 'user')

      Graytoad.notify(@e, :user => 'user')
    end

    should "notify with params" do
      Gelf.any_instance.expects(:send)

      HoptoadNotifier.expects(:notify).with(:error_class => @e.class.to_s, :error_message => @e.message.to_s, :other_param => 'Param')

      Graytoad.notify(:error_class => @e.class.to_s, :error_message => @e.message.to_s, :other_param => 'Param')
    end
  end
end
