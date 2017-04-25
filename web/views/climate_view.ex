defmodule Thermio.ClimateView do
  use Thermio.Web, :view

  def render("index.json", %{climates: climates}) do
    %{data: render_many(climates.entries, Thermio.ClimateView, "climate.json"),
      meta: %{
        page_number: climates.page_number,
        page_size: climates.page_size,
        total_pages: climates.total_pages,
        total_entries: climates.total_entries
      }
    }
  end

  def render("show.json", %{climate: climate}) do
    %{data: render_one(climate, Thermio.ClimateView, "climate.json")}
  end

  def render("climate.json", %{climate: climate}) do
    %{id: climate.id,
      heatIndex: climate.heat_index,
      humidity: climate.humidity,
      temperature: climate.temperature,
      time: climate.inserted_at}
  end
end
