defmodule EctoParams.Plug do
  use Plug.Router

  import Plug.Conn

  plug(:match)
  plug(:dispatch)

  alias EctoParams.AddCommand

  get "/" do
    conn =
      conn
      |> fetch_query_params()

    params = conn.query_params

    case AddCommand.changeset(%AddCommand{}, params) do
      {:ok, %AddCommand{} = command} ->
        send_resp(conn, 200, "#{command.a} + #{command.b} = #{command.a + command.b}")

      {:error, %Ecto.Changeset{}} ->
        send_resp(conn, 422, "Not quite right")
    end
  end
end
