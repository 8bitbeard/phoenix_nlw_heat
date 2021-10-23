defmodule PhoenixNlwHeatWeb.MessagesController do
  use PhoenixNlwHeatWeb, :controller

  alias PhoenixNlwHeat.Message
  alias PhoenixNlwHeat.Messages.Create

  def create(conn, params) do
    params
    |> Create.call()
    |> handle_create(conn)
  end

  defp handle_create({:ok, %Message{} = message}, conn) do
    conn
    |> put_status(:created)
    |> render("create.json", message: message)
  end

  defp handle_create({:error, %{result: result, status: status}}, conn) do
    conn
    |> put_status(status)
    |> put_view(PhoenixNlwHeatWeb.ErrorView)
    |> render("error.json", result: result)
  end
end
