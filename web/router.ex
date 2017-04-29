defmodule Thermio.Router do
  use Thermio.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
    plug ProperCase.Plug.SnakeCaseParams
    plug Joken.Plug,
      verify: &Thermio.JWTHelpers.verify/0,
      on_error: &Thermio.JWTHelpers.error/2
  end

  scope "/api", Thermio do
    pipe_through :api

    get "/aircon", AirconController, :index
    resources "/climates", ClimateController
  end

  scope "/health", Thermio do
    get "/", HealthController, :health
  end
end
