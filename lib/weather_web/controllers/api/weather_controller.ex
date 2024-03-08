defmodule WeatherWeb.Api.WeatherController do
  use WeatherWeb, :controller

  def index(conn, params) do
    data = retrieve_data(params)
    render(conn, "weather.json", data: data)
  end

  def show(conn, params) do
    data = retrieve_data(params) |> IO.inspect(label: "data????")
    data = %{"city" => data["city_name"],
            "date" => data["datetime"],
            "measurements" => [data["temp"]],
            "uvindex" => data["uv"],
            "wind" =>  data["wind_spd"],
          }

    conn
    |> put_status(200)
    |> json(data)
  end

  defp retrieve_data(params) do
    city = params["city"] || "Bratislava"

    {:ok, %{body: data}} = Tesla.get "http://api.weatherbit.io/v2.0/current?key=0df2834323ec48c0b87eaafab6065689&city=#{city}"

    non_parsed_data = Jason.decode!(data)

    [data] = non_parsed_data["data"]

    data
  end
end
