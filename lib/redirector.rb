class Redirector
  def initialize(app)
    @app = app
  end

  def call(env)
    request = Rack::Request.new(env)
    if request.get?
      # making permanent redirect to new turing.io try coding site
      [301, {"Location" => "https://turing.io/trycoding"}, self]
    else
      @app.call(env)
    end
  end

  def each(&block)
  end
end