defmodule WeatherWeb.Api.WeatherView do
  use WeatherWeb, :view

  def render("weather.json", %{data: data}) do
      %{"city" => data["city_name"],
      "date" => data["ts"],
      "measurements" => [data["temp"]],
      "uvindex" => data["uv"],
      "wind" =>  data["wind_spd"],
    }
  end
end
