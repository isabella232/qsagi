require "spec_helper"

describe Qsagi::Config do
  describe "#broker" do
    it "returns a configuration hash for a new broker" do
      subject.broker.should == {
        host: "127.0.0.1",
        port: "5672",
        vhost: "/",
        user: "guest",
        password: "guest",
        heartbeat: :server,
        automatically_recover: true,
        network_recovery_interval: 1
      }
    end

    it "allows you to override defaults" do
      config = Qsagi::Config.new(
        host: "128.0.0.1",
        port: "15672",
        vhost: "qsagi",
        user: "qsagi",
        password: "qsagi",
        heartbeat: 300,
        automatically_recover: false,
        network_recovery_interval: 0
      )

      config.broker.should == {
        host: "128.0.0.1",
        port: "15672",
        vhost: "qsagi",
        user: "qsagi",
        password: "qsagi",
        heartbeat: 300,
        automatically_recover: false,
        network_recovery_interval: 0
      }
    end
  end

  describe "#exchange" do
    it "returns a configuration hash for a new exchange" do
      subject.exchange.should == {
        type: :topic,
        auto_delete: false,
        durable: true
      }
    end

    it "allows you to override defaults" do
      config = Qsagi::Config.new(
        exchange_type: :fanout
      )

      config.exchange.should == {
        type: :fanout,
        auto_delete: false,
        durable: true
      }
    end
  end
end