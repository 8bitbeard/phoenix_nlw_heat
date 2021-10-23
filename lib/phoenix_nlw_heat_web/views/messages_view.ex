defmodule PhoenixNlwHeatWeb.MessagesView do
  use PhoenixNlwHeatWeb, :view

  def render("create.json", %{message: message}) do
    %{
      result: "Message created!",
      message: message
    }
  end
end
